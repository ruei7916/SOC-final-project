module fir_mm #(
    parameter pADDR_WIDTH = 12,
    parameter pDATA_WIDTH = 32,
    parameter Tape_Num    = 11
) (
    // Wishbone Slave ports (WB MI A)
    input wbs_stb_i, // Valid data transfer cycle (kind of chip select)
    input wbs_cyc_i, // Bus Cycle in progress (active high)
    input wbs_we_i, // READ (negate), WRITE(assert)
    input [3:0] wbs_sel_i, // Valid data(Byte-enable)
    input [31:0] wbs_dat_i,
    input [31:0] wbs_adr_i,
    output wbs_ack_o,
    output [31:0] wbs_dat_o,
    // AXI-Stream slave in
    output  reg                      ss_tready,
    input   wire                     ss_tvalid,
    input   wire [(pDATA_WIDTH-1):0] ss_tdata,
    input   wire                     ss_tlast,
    // AXI-Stream master out
    input   wire                     sm_tready,
    output  reg                      sm_tvalid,
    output  wire [(pDATA_WIDTH-1):0] sm_tdata,
    output  reg                      sm_tlast,
    // bram for tap RAM
    output  reg                      tap_WE,
    output  wire                     tap_RE,
    output  reg  [(pADDR_WIDTH-1):0] tap_WADDR,
    output  reg  [(pADDR_WIDTH-1):0] tap_RADDR,
    output  wire  [(pDATA_WIDTH-1):0] tap_Di,
    input   wire [(pDATA_WIDTH-1):0] tap_Do,
    // bram for data RAM
    output  reg                      data_WE,
    output  wire                     data_RE,
    output  reg  [(pADDR_WIDTH-1):0] data_WADDR,
    output  reg  [(pADDR_WIDTH-1):0] data_RADDR,
    output  reg  [(pDATA_WIDTH-1):0] data_Di,
    input   wire [(pDATA_WIDTH-1):0] data_Do,

    input   wire                     clk,
    input   wire                     rst,

    input   wire                     tap_mode,
    input   wire                     fir_mode,
    input   wire                     mm_mode
);

reg [2:0] state, _state;
reg [(16-1):0] data_length, _data_length;
reg [(16-1):0] data_idx, _data_idx;
reg [3:0] tap_idx, _tap_idx, tap_idx_delay;
reg [3:0] data_A_shift, _data_A_shift;
reg [(pDATA_WIDTH-1):0] acc, _acc, mul_out, adder_out;

reg stall;
wire acc_reset;
wire wbs_enable;
reg stall_delay;

localparam IDLE = 2'b00;
localparam SET_TAP = 2'b01;
localparam RUN_FIR = 2'b10;
localparam RUN_MM = 2'b11;

// state
always @(*) begin
    _state = state;
    case (state)
        IDLE: begin
            /*
            if (wbs_enable&wbs_we_i) begin
                _state = wbs_dat_i[5:4];
            end
            */
            if(tap_mode)
                _state = SET_TAP;
            else if(fir_mode)
                _state = RUN_FIR;
            else if(mm_mode)
                _state = RUN_MM;
        end
        SET_TAP: begin
            if(tap_idx==5'd10&ss_tready&ss_tvalid)begin
                _state = IDLE;
            end
        end
        RUN_FIR, RUN_MM: begin
            if (sm_tlast&sm_tready) begin
                _state = IDLE;
            end
        end
    endcase
end


// wishbone
/*
[0]         start
[1]         idle
[5:4]       mode
[31:16]     length
*/
assign wbs_enable = wbs_cyc_i & wbs_stb_i;
assign wbs_ack_o = wbs_enable;
assign wbs_dat_o = {30'b0,(_state==IDLE?1'b1:1'b0),1'b0};
always @( *) begin
    _data_length = data_length;
    if(state==IDLE)begin
        if (wbs_enable&wbs_we_i) begin
            _data_length = wbs_dat_i[31:16];
        end
    end
end


// REGS
always @(posedge clk ) begin
    if(rst)begin
        data_length <= 64;
        state <= IDLE;
    end
    else begin
        data_length <= _data_length;
        state <= _state;
    end
end
always @(posedge clk) begin
    if(rst||(state==IDLE&&_state!=IDLE))begin
        data_idx <= 0;
        tap_idx <= 0;
        acc <= 0;
        data_A_shift <= 0;
    end
    else begin
        data_idx <= _data_idx;
        tap_idx <= _tap_idx;
        acc <= _acc;
        data_A_shift <= _data_A_shift;
    end
end
always @(posedge clk ) begin
    stall_delay <= stall;
end


// tap_idx
always @( *) begin
    case (state)
        SET_TAP:begin
            _tap_idx = tap_idx + (ss_tready&ss_tvalid?1:0);
        end
        RUN_FIR:begin
            if(tap_idx==4'd10)begin
                _tap_idx = 4'd0;
            end
            else begin
                _tap_idx = tap_idx + (stall?0:1);
            end
        end
        RUN_MM: begin
            if(data_idx[2:1]==2'b00)
                _tap_idx = tap_idx + (ss_tready&ss_tvalid?1:0);
            else
                _tap_idx = tap_idx + (stall?0:1);
        end
        default:begin
            _tap_idx = 4'd0;
        end 
    endcase
end

// data_idx & data_A_shift
wire [3:0] tap_idx_max;
assign tap_idx_max = (state==RUN_FIR)?4'd10:4'd15;
always @( *) begin
    if(tap_idx==tap_idx_max&&tap_idx!=_tap_idx)begin
        _data_A_shift = (data_A_shift==4'd10)?0:data_A_shift+1;
        _data_idx = data_idx + 1;
    end
    else begin
        _data_A_shift = data_A_shift;
        _data_idx = data_idx;
    end
end

// multiply-add
assign acc_reset = ((state==RUN_MM&&tap_idx[1:0]==2'b01)||(state==RUN_FIR&&tap_idx==4'd1) ? 1'b1 : 1'b0);
always @(*) begin
    mul_out = data_Do * tap_Do;
    adder_out = mul_out + (acc_reset ? 0 : acc);
    _acc = stall_delay ? acc : adder_out;
end

// stall
always @(*) begin
    if(state==RUN_FIR&&({sm_tvalid,sm_tready}=={2'b10}||(ss_tvalid==0&&tap_idx==2)))
        stall = 1'b1;
    else if(state==RUN_MM&&data_idx[2:1]!=2'b00&&({sm_tvalid,sm_tready}=={2'b10}))
        stall = 1'b1;
    else
        stall = 1'b0;
end

// ss; x in
always @( *) begin
    case (state)
        RUN_FIR: begin
            ss_tready = (tap_idx==4'd2) ? 1'b1 : 1'b0;
        end
        SET_TAP: begin
            ss_tready = 1'b1;
        end
        RUN_MM: begin
            ss_tready = (data_idx[2:1]==2'b00)?1'b1:1'b0;
        end
        default: begin
            ss_tready = 1'b0;
        end
    endcase
end

// sm; y out
assign sm_tdata = _acc;
always @( *) begin
    sm_tlast = 1'b0;
    sm_tvalid = 1'b0;
    if(state==RUN_FIR)begin
        if(tap_idx==4'd0 && data_idx!=4'd0)begin
            sm_tvalid = 1'b1;
        end
        sm_tlast = (data_idx==data_length) ? sm_tvalid : 1'b0;
    end
    else if(state==RUN_MM)begin
        if(({data_idx[2:0],tap_idx[3:2]}>5'b01000)&&(tap_idx[1:0]==2'b00))begin
            sm_tvalid = 1'b1;
        end
        sm_tlast = (data_idx==3'b110) ? sm_tvalid : 1'b0;
    end
end


// tap RAM
assign tap_Di = ss_tdata;
always @( *) begin
    if(state==SET_TAP)begin
        tap_WADDR = tap_idx;
        tap_WE = ss_tready&ss_tvalid;
    end
    else if(state==RUN_MM&&data_idx[2:0]==3'b000)begin
        tap_WADDR = tap_idx;
        tap_WE = ss_tready&ss_tvalid;
    end
    else begin
        tap_WADDR = 0;
        tap_WE = 1'b0;
    end
end
assign tap_RE = 1'b1;
always @( *) begin
    if(state==RUN_FIR)
        tap_RADDR = 4'd10 - tap_idx;
    else// if(state==RUN_MM)
        tap_RADDR = {data_idx[2],data_idx[0],tap_idx[1:0]};
end


// data RAM
wire [4:0] data_WADDR_t;
assign data_WADDR_t = 4'd10 + data_A_shift;
always @( *) begin
    data_WE = 1'b0;
    data_Di = 0;
    data_WADDR = 0;
    case (state)
        SET_TAP:begin
            data_WE = tap_WE;
            data_Di = 0;
            data_WADDR = tap_idx;
        end
        RUN_FIR: begin
            data_WE = (tap_idx==4'd2) ? 1'b1 : 1'b0;
            data_Di = ss_tdata;
            if(data_WADDR_t>10)
                data_WADDR = data_WADDR_t - 11;
            else
                data_WADDR = data_WADDR_t;
        end
        RUN_MM: begin
            if(data_idx[2:0]==3'b001)begin
                data_WE = ss_tready&ss_tvalid;
                data_Di = ss_tdata;
                data_WADDR = tap_idx;
            end
        end
    endcase
end
assign data_RE = 1'b1;
wire [4:0] data_RADDR_t;
assign data_RADDR_t = tap_idx + data_A_shift;
always @( *) begin
    data_RADDR = 0;
    case (state)
        RUN_FIR: begin
            if(data_RADDR_t>10)
                data_RADDR = data_RADDR_t - 11;
            else
                data_RADDR = data_RADDR_t;
        end
        RUN_MM: begin
            data_RADDR = {tap_idx[1:0],tap_idx[3:2]};
        end
    endcase
end


endmodule

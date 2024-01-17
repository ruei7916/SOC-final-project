module dma(
    input wb_clk_i,
    input wb_rst_i,
    input wbs_stb_i,
    input wbs_cyc_i,
    input wbs_we_i,
    input [3:0] wbs_sel_i,
    input [31:0] read_dat_i,
    input [31:0] wbs_adr_i,
    input wbs_ack,
    input dma_ack,
    output [31:0] ss_tdata,
    output [31:0] wbs_adr_o,
    output wbs_stb_o,
    output wbs_cyc_o,
    output wbs_we_o,
    output [3:0] wbs_sel_o,
    output ss_tvalid,
    input ss_tready,
    input sm_tvalid,
    output reg sm_tready,
    input [31:0]sm_tdata,
    output [31:0] wbs_dat_o,
    output dma_fir_tap,
    output dma_mode_fir,
    output dma_mode_mm
);
reg [1:0]r_state_d,r_state_q;
reg [1:0]w_state_d,w_state_q;
reg ss_tvalid_d,ss_tvalid_q;
reg [31:0]input_buffer,output_buffer;
reg [31:0]radr_o_d,radr_o_q;
reg [31:0]wadr_o_d,wadr_o_q;
reg r_stb_o_d,r_stb_o_q;
reg r_cyc_o_d,r_cyc_o_q;
reg w_stb_o_d,w_stb_o_q;
reg w_cyc_o_d,w_cyc_o_q;
reg we_o_d,we_o_q;
reg[3:0] sel_o_d,sel_o_q;
reg dma_fir_tap_d,dma_mode_fir_d,dma_mode_mm_d,dma_fir_tap_q,dma_mode_fir_q,dma_mode_mm_q;
reg [5:0]counter_d,counter_q;
assign ss_tdata = input_buffer;
assign wbs_dat_o = output_buffer;
assign wbs_adr_o = sm_tvalid ? wadr_o_q : radr_o_q;
assign wbs_stb_o = (r_stb_o_q & r_cyc_o_q) ? r_stb_o_q : w_stb_o_q;
assign wbs_cyc_o = (r_stb_o_q & r_cyc_o_q) ? r_cyc_o_q : w_cyc_o_q;
assign wbs_we_o = (r_stb_o_q & r_cyc_o_q) ? 0 : we_o_q;
assign wbs_sel_o = (r_stb_o_q & r_cyc_o_q) ? 4'b0000 : sel_o_q;
assign ss_tvalid = ss_tvalid_q;
assign dma_fir_tap = dma_fir_tap_q;
assign dma_mode_fir = dma_mode_fir_q;
assign dma_mode_mm = dma_mode_mm_q;
    always@(*)begin
        counter_d = counter_q;
        radr_o_d = radr_o_q;
        r_stb_o_d = r_stb_o_q;
        r_cyc_o_d = r_cyc_o_q;
        ss_tvalid_d = ss_tvalid_q;
        dma_fir_tap_d = dma_fir_tap_q;
        dma_mode_fir_d = dma_mode_fir_q;
        dma_mode_mm_d = dma_mode_mm_q;
        r_state_d = r_state_q;
        if(wbs_adr_i == 32'h380002ac && wbs_stb_i && wbs_cyc_i && wbs_ack && r_state_q == 2'b00 )begin
            dma_fir_tap_d = 1;
            r_stb_o_d = 1;
            r_cyc_o_d = 1;
            radr_o_d = 32'h38000100;
            counter_d = 0;
            ss_tvalid_d = 0;
            r_state_d = 2'b10;
        end
        else if(r_state_q == 2'b10)begin
            r_stb_o_d = 1;
            r_cyc_o_d = 1;
            if(dma_fir_tap_q && dma_ack && counter_q != 10)begin
                r_state_d = 2'b01;
                r_stb_o_d = 0;
                r_cyc_o_d = 0;
                ss_tvalid_d = 1;
                counter_d = counter_q + 1;
                input_buffer = read_dat_i;
            end
            else if(dma_fir_tap_q && dma_ack && counter_q == 10)begin
                dma_fir_tap_d = 0;
                dma_mode_fir_d = 1;
                r_state_d = 2'b01;
                r_stb_o_d = 0;
                r_cyc_o_d = 0;
                ss_tvalid_d = 1;
                counter_d = 0;
                input_buffer = read_dat_i;
            end
            else if(dma_mode_fir_q && dma_ack && counter_q != 63)begin
                r_state_d = 2'b01;
                r_stb_o_d = 0;
                r_cyc_o_d = 0;
                ss_tvalid_d = 1;
                counter_d = counter_q + 1;
                input_buffer = read_dat_i;
            end
            else if(dma_mode_fir_q && dma_ack && counter_q == 63)begin
                dma_mode_fir_d = 0;
                dma_mode_mm_d = 1;
                r_state_d = 2'b01;
                r_stb_o_d = 0;
                r_cyc_o_d = 0;
                ss_tvalid_d = 1;
                counter_d = 0;
                input_buffer = read_dat_i;
            end
            else if(dma_mode_mm_q && dma_ack && counter_q != 31)begin
                r_state_d = 2'b01;
                r_stb_o_d = 0;
                r_cyc_o_d = 0;
                ss_tvalid_d = 1;
                counter_d = counter_q + 1;
                input_buffer = read_dat_i;
            end
            else if(dma_mode_mm_q && dma_ack && counter_q == 31)begin
                dma_mode_mm_d = 0;
                r_state_d = 2'b01;
                r_stb_o_d = 0;
                r_cyc_o_d = 0;
                ss_tvalid_d = 1;
                counter_d = 0;
                input_buffer = read_dat_i;
            end
        end 
        else if(r_state_q == 2'b01)begin
            r_stb_o_d = 0;
            r_cyc_o_d = 0;
            if(ss_tready && (dma_fir_tap_q || dma_mode_fir_q || dma_mode_mm_q))begin
                r_state_d = 2'b10;
                r_stb_o_d = 1;
                r_cyc_o_d = 1;
                ss_tvalid_d = 0;
                radr_o_d = radr_o_q + 4;
            end
            else if(ss_tready && ~dma_fir_tap_q && ~dma_mode_fir_q && ~dma_mode_mm_q)begin
                r_state_d = 2'b00;
                r_stb_o_d = 0;
                r_cyc_o_d = 0;
                ss_tvalid_d = 0;
                radr_o_d = 0;
            end
        end 
    end
    
    
    always@(*)begin
        wadr_o_d = wadr_o_q;
        w_stb_o_d = w_stb_o_q;
        w_cyc_o_d = w_cyc_o_q;
        w_state_d = w_state_q;
        we_o_d = we_o_q;
        sel_o_d = sel_o_q;
        if(sm_tvalid && w_state_q == 2'b00 && dma_mode_fir_q)begin
            w_stb_o_d = 1;
            w_cyc_o_d = 1;
            wadr_o_d = 32'h3800012c;
            sm_tready = 0;
            we_o_d = 1;
            sel_o_d = 4'b1111;
            output_buffer = sm_tdata;
            w_state_d = 2'b01;
        end
        else if(w_state_q == 2'b01)begin
            w_stb_o_d = 1;
            w_cyc_o_d = 1;
            we_o_d = 1;
            sel_o_d = 4'b1111;
            if(dma_ack && r_state_q!= 2'b10)begin
                w_stb_o_d = 0;
                w_cyc_o_d = 0;
                wadr_o_d = wadr_o_q + 4;
                we_o_d = 0;
                sel_o_d = 4'b0000;
                sm_tready = 1;
                w_state_d = 2'b10;
            end
        end
        else if(w_state_q == 2'b10)begin
            w_stb_o_d = 0;
            w_cyc_o_d = 0;
            we_o_d = 0;
            sel_o_d = 4'b0000;
            if(sm_tvalid)begin
                w_stb_o_d = 1;
                w_cyc_o_d = 1;
                we_o_d = 1;
                sel_o_d = 4'b1111;
                output_buffer = sm_tdata;
                sm_tready = 0;
                w_state_d = 2'b01;
            end
        end
    end
    always@(posedge wb_clk_i or posedge wb_rst_i)begin
        if(wb_rst_i)begin
            r_state_q <= 2'b00;
            w_state_q <= 2'b00;
            r_stb_o_q <= 0;
            r_cyc_o_q <= 0;
            w_stb_o_q <= 0;
            w_cyc_o_q <= 0;
            we_o_q <= 0;
            sel_o_q <= 4'd0;
            counter_q <= 6'd0;
            dma_fir_tap_q <= 0;
            dma_mode_fir_q <= 0;
            dma_mode_mm_q <= 0;
            ss_tvalid_q <= 0;
            radr_o_q <= 0;
            wadr_o_q <= 0;
        end
        else begin
            r_state_q <= r_state_d;
            w_state_q <= w_state_d;
            r_stb_o_q <= r_stb_o_d;
            r_cyc_o_q <= r_cyc_o_d;
            w_stb_o_q <= w_stb_o_d;
            w_cyc_o_q <= w_cyc_o_d;
            we_o_q <= we_o_d;
            sel_o_q <= sel_o_d;
            counter_q <= counter_d;
            dma_fir_tap_q <= dma_fir_tap_d;
            dma_mode_fir_q <= dma_mode_fir_d;
            dma_mode_mm_q <= dma_mode_mm_d;
            ss_tvalid_q <= ss_tvalid_d;
            radr_o_q <= radr_o_d;
            wadr_o_q <= wadr_o_d;
        end
        
    end
endmodule

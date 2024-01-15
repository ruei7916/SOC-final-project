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
    output reg ss_tvalid,
    input ss_tready,
    input sm_tvalid,
    output sm_tready,
    input [31:0]sm_tdata
);
assign ss_tdata = data_o_q;
assign wbs_adr_o = adr_o_q;
assign wbs_stb_o = stb_o_q;
assign wbs_cyc_o = cyc_o_q;
assign wbs_we_o = we_o_q;
assign wbs_sel_o = sel_o_q;

reg ss_tvalid_d,ss_tvalid_q;
reg sm_tready_d,sm_tready_q;
reg [31:0]data_o_d,data_o_q;
reg [31:0]radr_o_d,radr_o_q;
reg [31:0]wadr_o_d,wadr_o_q;
reg write_flag_d,write_flag_q;
reg read_flag_d,read_flag_q;
reg stb_o_d,stb_o_q;
reg cyc_o_d,cyc_o_q;
reg we_o_d,we_o_q;
reg[3:0] sel_o_d,sel_o_q;
reg dma_fir_tap_d,dma_mode_fir_d,dma_mode_mm_d,dma_fir_tap_q,dma_mode_fir_q,dma_mode_mm_q;
reg [5:0]counter_d,counter_q;
	always@(*)begin
		counter_d = counter_q;
		data_o_d = data_o_q;
    		radr_o_d = radr_o_q;
    		wadr_o_d = wadr_o_q;
    		stb_o_d = stb_o_q;
		cyc_o_d = cyc_o_q;
		we_o_d = we_o_q;
		sel_o_d = sel_o_q;
		ss_tvalid_d = ss_tvalid_q;
		dma_fir_tap_d = dma_fir_tap_q;
		dma_mode_fir_d = dma_mode_fir_q;
		dma_mode_mm_d = dma_mode_mm_q;
		write_flag_d = write_flag_q;
		read_flag_d = read_flag_q;
		if(wbs_adr_i == 32'h380002b0 && wbs_stb_i && wbs_cyc_i && wbs_ack)begin
			dma_fir_tap_d = 1;
			stb_o_d = 1;
			cyc_o_d = 1;
			radr_o_d = 32'h38000100;
			counter_d = 0;
			ss_tvalid_d = 1;
		end
		else if(dma_fir_tap_q && counter_q != 6'd10)begin
			dma_fir_tap_d = 1;
			if(ss_tready)begin
				stb_o_d = 1;
				cyc_o_d = 1;
			end
			else begin
				stb_o_d = 0;
				cyc_o_d = 0;
			end
			if(dma_ack)begin
				radr_o_d = radr_o_q + 4;
				counter_d = counter_q + 1;
				ss_tvalid_d = 1;
			end
			else begin
				ss_tvalid_d = 0;
			end
		end
		else if(dma_fir_tap_q && counter_q == 6'd10)begin
			dma_fir_tap_d = 0;
			dma_mode_fir_d = 1;
			if(ss_tready)begin
				stb_o_d = 1;
				cyc_o_d = 1;
			end
			else begin
				stb_o_d = 0;
				cyc_o_d = 0;
			end
			if(dma_ack)begin
				radr_o_d = radr_o_q + 4;
				counter_d = 6'd0;
				ss_tvalid_d = 1;
				wadr_o_d = radr_o_d;
			end
			else begin
				ss_tvalid_d = 0;
			end
		end
		else if(dma_mode_fir_q && counter_q != 6'd63)begin
			dma_mode_fir_d = 1;
			if(ss_tready)begin
				stb_o_d = 1;
				cyc_o_d = 1;
			end
			else if(sm_tvalid)begin
				write_flag_d = 1;
				stb_o_d = 1;
				cyc_o_d = 1;
				we_o_d = 1;
				sel_o_d = 4'b1111;
			end
			else if(dma_ack && write_flag_q)begin
				write_flag_d = 0;
				wadr_o_d = wadr_o_q + 4;
				counter_d = counter_q + 1;
				sm_tready_d = 1;
			end
			else if(dma_ack && ~write_flag_q)begin
				radr_o_d = radr_o_q + 4;
				ss_tvalid_d = 1;
			end
			else begin
				stb_o_d = 0;
				cyc_o_d = 0;
				sm_tready_d = 0;
			end
		end
		else if(dma_mode_fir_q && counter_q == 6'd63)begin
			dma_mode_mm_d = 1;
			dma_mode_fir_d = 0;
			stb_o_d = 1;
			cyc_o_d = 1;
			if(wbs_ack)begin
				adr_o_d = adr_o_q + 4;
				counter_d = 6'd0;
			end
		end
		else if(dma_mode_mm_q && (counter_q != 6'd31))begin
			dma_mode_mm_d = 1;
			stb_o_d = 1;
			cyc_o_d = 1;
			if(wbs_ack)begin
				adr_o_d = adr_o_q + 4;
				counter_d = counter_q + 1;
			end
		end
		else if(dma_mode_mm_q && (counter_q == 6'd31))begin
			dma_mode_mm_d = 0;
			stb_o_d = 0;
			cyc_o_d = 0;
			if(wbs_ack)begin
				adr_o_d = 32'd0;
				counter_d = 6'd0;
			end
		end
	end
    	always@(posedge wb_clk_i or posedge wb_rst_i)begin
    		if(wb_rst_i)begin
    			data_o_q <= 32'd0;
    			adr_o_q <= 32'd0;
    			stb_o_q <= 0;
			cyc_o_q <= 0;
			we_o_q <= 0;
			sel_o_q <= 4'd0;
			counter_q <= 6'd0;
			dma_mode_fir_q <= 0;
			dma_mode_mm_q <= 0;
		end
		else begin
			data_o_q <= data_o_d;
    			adr_o_q <= adr_o_d;
    			stb_o_q <= stb_o_d;
			cyc_o_q <= cyc_o_d;
			we_o_q <= we_o_d;
			sel_o_q <= sel_o_d;
			counter_q <= counter_d;
			dma_mode_fir_q <= dma_mode_fir_d;
			dma_mode_mm_q <= dma_mode_mm_d;
		end
		
	end
endmodule
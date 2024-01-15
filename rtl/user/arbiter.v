module arbiter(
    input wb_clk_i,
    input wb_rst_i,
    input wb_ack_o,
    input cpu_stb_i,
    input cpu_cyc_i,
    input cpu_we_i,
    input [3:0] cpu_sel_i,
    input [31:0] cpu_dat_i,
    input [31:0] cpu_adr_i,
    input dma_stb_i,
    input dma_cyc_i,
    input dma_we_i,
    input [3:0] dma_sel_i,
    input [31:0] dma_dat_i,
    input [31:0] dma_adr_i,
    output reg wb_stb_i,
    output reg wb_cyc_i,
    output reg wb_we_i,
    output reg [3:0] wb_sel_i,
    output reg [31:0] wb_dat_i,
    output reg [31:0] wb_adr_i,
    output reg cpu_ack_o,
    output reg dma_ack_o,
    output [31:0] wbs_dat_o
);
reg busy_d,busy_q;
	always@(*)begin
		if(dma_stb_i & dma_cyc_i & ~busy_q)begin
			busy_d = 1;
			wb_stb_i = dma_stb_i;
			wb_cyc_i = dma_cyc_i;
			wb_we_i = dma_we_i;
			wb_sel_i = dma_sel_i;
    			wb_dat_i = dma_dat_i;
    			wb_adr_i = dma_adr_i;
    			dma_ack_o = wb_ack_o;
    			cpu_ack_o = 0;	
    		end
    		else if(dma_stb_i & dma_cyc_i & busy_q & wb_ack_o)begin
			busy_d = 0;
			wb_stb_i = dma_stb_i;
			wb_cyc_i = dma_cyc_i;
			wb_we_i = dma_we_i;
			wb_sel_i = dma_sel_i;
    			wb_dat_i = dma_dat_i;
    			wb_adr_i = dma_adr_i;
    			dma_ack_o = wb_ack_o;
    			cpu_ack_o = 0;
    		end
    		else if(cpu_stb_i & cpu_cyc_i & busy_q & wb_ack_o)begin
			busy_d = 0;
			wb_stb_i = cpu_stb_i;
			wb_cyc_i = cpu_cyc_i;
			wb_we_i = cpu_we_i;
			wb_sel_i = cpu_sel_i;
    			wb_dat_i = cpu_dat_i;
    			wb_adr_i = cpu_adr_i;
    			cpu_ack_o = wb_ack_o;
    			dma_ack_o = 0;
    		end
    		else if(cpu_stb_i & cpu_cyc_i & ~busy_q)begin
			busy_d = 1;
			wb_stb_i = cpu_stb_i;
			wb_cyc_i = cpu_cyc_i;
			wb_we_i = cpu_we_i;
			wb_sel_i = cpu_sel_i;
    			wb_dat_i = cpu_dat_i;
    			wb_adr_i = cpu_adr_i;
    			cpu_ack_o = wb_ack_o;
    			dma_ack_o = 0;
    		end
    		else begin
    			busy_d = busy_q;
			wb_stb_i = cpu_stb_i;
			wb_cyc_i = cpu_cyc_i;
			wb_we_i = cpu_we_i;
			wb_sel_i = cpu_sel_i;
    			wb_dat_i = cpu_dat_i;
    			wb_adr_i = cpu_adr_i;
    			cpu_ack_o = wb_ack_o;
    			dma_ack_o = 0;
    		end		
	end
    	always@(posedge wb_clk_i or posedge wb_rst_i)begin
    		if(wb_rst_i)begin
    			busy_q <= 0;
		end
		else begin
			busy_q <= busy_d;
		end
		
	end
endmodule

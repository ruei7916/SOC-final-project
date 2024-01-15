// SPDX-FileCopyrightText: 2020 Efabless Corporation
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//      http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.
// SPDX-License-Identifier: Apache-2.0

`default_nettype wire
/*
 *-------------------------------------------------------------
 *
 * user_project_wrapper
 *
 * This wrapper enumerates all of the pins available to the
 * user for the user project.
 *
 * An example user project is provided in this wrapper.  The
 * example should be removed and replaced with the actual
 * user project.
 *
 *-------------------------------------------------------------
 */

module user_project_wrapper #(
    parameter BITS = 32,
    parameter DELAYS=1
) (
`ifdef USE_POWER_PINS
    inout vdda1,	// User area 1 3.3V supply
    inout vdda2,	// User area 2 3.3V supply
    inout vssa1,	// User area 1 analog ground
    inout vssa2,	// User area 2 analog ground
    inout vccd1,	// User area 1 1.8V supply
    inout vccd2,	// User area 2 1.8v supply
    inout vssd1,	// User area 1 digital ground
    inout vssd2,	// User area 2 digital ground
`endif

    // Wishbone Slave ports (WB MI A)
    input wb_clk_i,
    input wb_rst_i,
    input wbs_stb_i,
    input wbs_cyc_i,
    input wbs_we_i,
    input [3:0] wbs_sel_i,
    input [31:0] wbs_dat_i,
    input [31:0] wbs_adr_i,
    output wbs_ack_o,
    output [31:0] wbs_dat_o,

    // Logic Analyzer Signals
    input  [127:0] la_data_in,
    output [127:0] la_data_out,
    input  [127:0] la_oenb,

    // IOs
    input  [`MPRJ_IO_PADS-1:0] io_in,
    output [`MPRJ_IO_PADS-1:0] io_out,
    output [`MPRJ_IO_PADS-1:0] io_oeb,

    // Analog (direct connection to GPIO pad---use with caution)
    // Note that analog I/O is not available on the 7 lowest-numbered
    // GPIO pads, and so the analog_io indexing is offset from the
    // GPIO indexing by 7 (also upper 2 GPIOs do not have analog_io).
    inout [`MPRJ_IO_PADS-10:0] analog_io,

    // Independent clock (on independent integer divider)
    input   user_clock2,

    // User maskable interrupt signals
    output [2:0] user_irq
);

wire clk;
wire rst;
// sdram signal
wire valid;
wire sdram_cle;
wire sdram_cs;
wire sdram_cas;
wire sdram_ras;
wire sdram_we;
wire sdram_dqm;
wire [1:0] sdram_ba;
wire [12:0] sdram_a;
wire [31:0] d2c_data;
wire [31:0] c2d_data;
wire [3:0]  bram_mask;
wire decoded;
wire [22:0] ctrl_addr;
wire ctrl_busy;
wire ctrl_in_valid, ctrl_out_valid;
reg ctrl_in_valid_q;

// uart signals
wire decoded_uart;
wire uart_ack_o;
wire [31:0] uart_dat_o;

// dma
wire [31:0]dma_addr;
wire dma_stb;
wire dma_cyc;
wire dma_we;
wire dma_ack_o;
wire [3:0]dma_sel;
wire [31:0]dma_dat_i;
//
wire ack_o;
wire stb_i;
wire cyc_i;
wire we_i;
wire [3:0]  sel_i;
wire [31:0] adr_i;
wire [31:0] dat_i;
wire dma_fir_tap;
wire dma_mode_fir;
wire dma_mode_mm;

//hardware
 wire tap_WE;
    wire tap_RE;
    wire [11:0]tap_WADDR;
    wire [11:0]tap_RADDR;
    wire [31:0]tap_Di;
    wire [31:0]tap_Do;
    wire data_WE;
    wire data_RE;
    wire [11:0]data_WADDR;
    wire [11:0]data_RADDR;
    wire [31:0]data_Di;
    wire [31:0]data_Do;

    wire            ss_tvalid;
    wire [31:0]     ss_tdata;
    wire            ss_tlast;
    wire            ss_tready;
    wire            sm_tready;
    wire            sm_tvalid;
    wire [31:0]     sm_tdata;
    wire            sm_tlast;

assign clk = wb_clk_i;
assign rst = wb_rst_i;
assign rst_n = ~rst;

assign valid = stb_i && cyc_i;//to sdram
assign ctrl_in_valid = we_i ? valid : (~ctrl_in_valid_q & valid);
assign ack_o = we_i ? ~ctrl_busy && valid : ctrl_out_valid ;
assign bram_mask = sel_i & {4{we_i}};
assign ctrl_addr = adr_i[22:0];

always @(posedge clk) begin
    if (rst) begin
        ctrl_in_valid_q <= 1'b0;
    end
    else begin
        if (~wbs_we_i && valid && ~ctrl_busy && ctrl_in_valid_q == 1'b0)
            ctrl_in_valid_q <= 1'b1;  
        else if (ctrl_out_valid)
            ctrl_in_valid_q <= 1'b0;
    end
end
arbiter u_arbiter(
    .clk(clk),
    .rst(rst),
    .sdram_ack_o(ack_o),
    .cpu_stb_i(wbs_stb_i),
    .cpu_cyc_i(wbs_cyc_i),
    .cpu_we_i(wbs_we_i),
    .cpu_sel_i(wbs_sel_i),
    .cpu_dat_i(wbs_dat_i),
    .cpu_adr_i(wbs_adr_i),
    .dma_stb_i(dma_stb),
    .dma_cyc_i(dma_cyc),
    .dma_we_i(dma_we),
    .dma_sel_i(dma_sel),
    .dma_dat_i(dma_dat_i),
    .dma_adr_i(dma_addr),
    .sdram_stb_i(stb_i),
    .sdram_cyc_i(cyc_i),
    .sdram_we_i(we_i),
    .sdram_sel_i(sel_i),
    .sdram_dat_i(dat_i),
    .sdram_adr_i(adr_i),
    .cpu_ack_o(wbs_ack_o),
    .dma_ack_o(dma_ack_o),
    .wbs_dat_o(wbs_dat_o)
);
dma u_dma(
    .wb_clk_i(clk),
    .wb_rst_i(rst),
    .wbs_stb_i(wbs_stb_i),
    .wbs_cyc_i(wbs_cyc_i),
    .wbs_we_i(wbs_we_i),
    .wbs_sel_i(wbs_sel_i),
    .read_dat_i(wbs_dat_o),
    .wbs_adr_i(wbs_adr_i),
    .wbs_ack(wbs_ack_o),
    .dma_ack(dma_ack_o),
    .ss_tdata(ss_tdata),
    .wbs_adr_o(dma_addr),
    .wbs_stb_o(dma_stb),
    .wbs_cyc_o(dma_cyc),
    .wbs_we_o(dma_we),
    .wbs_sel_o(dma_sel),
    .ss_tvalid(ss_tvalid),
    .ss_tready(ss_tready),
    .sm_tvalid(sm_tvalid),
    .sm_tready(sm_tready),
    .sm_tdata(sm_tdata),
    .wbs_dat_o(dma_dat_i),
    .dma_fir_tap(dma_fir_tap),
    .dma_mode_fir(dma_mode_fir),
    .dma_mode_mm(dma_mode_mm)
);
sdram_controller user_sdram_controller (
    .clk(clk),
    .rst(rst),
    .sdram_cle(sdram_cle),
    .sdram_cs(sdram_cs),
    .sdram_cas(sdram_cas),
    .sdram_ras(sdram_ras),
    .sdram_we(sdram_we),
    .sdram_dqm(sdram_dqm),
    .sdram_ba(sdram_ba),
    .sdram_a(sdram_a),
    .sdram_dqi(d2c_data),
    .sdram_dqo(c2d_data),
    .user_addr(ctrl_addr),
    .rw(wbs_we_i),
    .data_in(wbs_dat_i),
    .data_out(wbs_dat_o),
    .busy(ctrl_busy),
    .in_valid(ctrl_in_valid),
    .out_valid(ctrl_out_valid)
);
sdr user_bram (
    .Rst_n(rst_n),
    .Clk(clk),
    .Cke(sdram_cle),
    .Cs_n(sdram_cs),
    .Ras_n(sdram_ras),
    .Cas_n(sdram_cas),
    .We_n(sdram_we),
    .Addr(sdram_a),
    .Ba(sdram_ba),
    .Dqm(bram_mask),
    .Dqi(c2d_data),
    .Dqo(d2c_data)
);




fir_mm u_fir_mm(
    // wishbone
    .wbs_stb_i(wbs_stb_i), // Valid data transfer cycle (kind of chip select)
    .wbs_cyc_i(wbs_cyc_i), // Bus Cycle in progress (active high)
    .wbs_we_i(wbs_we_i), // READ (negate), WRITE(assert)
    .wbs_sel_i(wbs_sel_i), // Valid data(Byte-enable)
    .wbs_dat_i(wbs_dat_i),
    .wbs_adr_i(wbs_adr_i),
    .wbs_ack_o(wbs_ack_o),
    .wbs_dat_o(wbs_dat_o),
    // axi-stream
    .ss_tvalid(ss_tvalid),
    .ss_tdata(ss_tdata),
    .ss_tlast(ss_tlast),
    .ss_tready(ss_tready),
    .sm_tready(sm_tready),
    .sm_tvalid(sm_tvalid),
    .sm_tdata(sm_tdata),
    .sm_tlast(sm_tlast),
    // bram for tap RAM
    .tap_WE(tap_WE),
    .tap_RE(tap_RE),
    .tap_WADDR(tap_WADDR),
    .tap_RADDR(tap_RADDR),
    .tap_Di(tap_Di),
    .tap_Do(tap_Do),
    // bram for data RAM
    .data_WE(data_WE),
    .data_RE(data_RE),
    .data_WADDR(data_WADDR),
    .data_RADDR(data_RADDR),
    .data_Di(data_Di),
    .data_Do(data_Do),
    .clk(axis_clk),
    .rst(rst),
    .tap_mode(dma_fir_tap),
    .fir_mode(dma_mode_fir),
    .mm_mode(dma_mode_mm)
);

bram16 tap_RAM(
    .clk(axis_clk),
    .we(tap_WE),
    .re(tap_RE),
    .waddr(tap_WADDR),
    .raddr(tap_RADDR),
    .wdi(tap_Di),
    .rdo(tap_Do)
);
bram16 data_RAM(
    .clk(axis_clk),
    .we(data_WE),
    .re(data_RE),
    .waddr(data_WADDR),
    .raddr(data_RADDR),
    .wdi(data_Di),
    .rdo(data_Do)
);


// uart
assign decoded_uart = (wbs_adr_i[31:20] == 12'h300) ? 1'b1 : 1'b0;
uart uart (
`ifdef USE_POWER_PINS
	.vccd1(vccd1),	// User area 1 1.8V power
	.vssd1(vssd1),	// User area 1 digital ground
`endif
    .wb_clk_i(wb_clk_i),
    .wb_rst_i(wb_rst_i),

    // MGMT SoC Wishbone Slave

    .wbs_stb_i(wbs_stb_i&decoded_uart),
    .wbs_cyc_i(wbs_cyc_i&decoded_uart),
    .wbs_we_i(wbs_we_i),
    .wbs_sel_i(wbs_sel_i),
    .wbs_dat_i(wbs_dat_i),
    .wbs_adr_i(wbs_adr_i),
    .wbs_ack_o(uart_ack_o),//
    .wbs_dat_o(uart_dat_o),//

    // IO ports
    .io_in  (io_in      ),
    .io_out (io_out     ),
    .io_oeb (io_oeb     ),

    // irq
    .user_irq (user_irq)
);

endmodule	// user_project_wrapper

`default_nettype wire

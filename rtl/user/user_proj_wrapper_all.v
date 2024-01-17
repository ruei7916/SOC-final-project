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

`default_nettype none
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
    output reg wbs_ack_o,
    output reg [31:0] wbs_dat_o,

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



//wb decode addr
/*
sdram       0x3800_0xxx
dma         0x3800_02ac
fir_mm      0x301x_xxxx
uart        0x300x_xxxx
*/
wire [31:0] cpu_dat_o;
wire cpu_ack_o;
wire decoded_cpu;
wire [31:0] fir_dat_o;
wire fir_ack_o;
wire decoded_fir_mm;
wire [31:0] uart_dat_o;
wire uart_ack_o;
wire decoded_uart;

assign decoded_cpu = (wbs_adr_i[31:16]==16'h3800)?1'b1:1'b0;
assign decoded_fir_mm = (wbs_adr_i[31:20]==12'h301) ? 1'b1 : 1'b0;
assign decoded_uart = (wbs_adr_i[31:20] == 12'h300) ? 1'b1 : 1'b0;

always @(*) begin
    if(decoded_cpu)begin
        wbs_dat_o = cpu_dat_o;
        wbs_ack_o = cpu_ack_o;
    end
    else if(decoded_fir_mm)begin
        wbs_dat_o = fir_dat_o;
        wbs_ack_o = fir_ack_o;
    end
    else begin
        wbs_dat_o = uart_dat_o;
        wbs_ack_o = uart_ack_o;
    end
end



// arbiter to sdram signal
wire sdram_cyc_i;
wire sdram_stb_i;
wire sdram_we_i;
wire [3:0] sdram_sel_i;
wire sdram_ack_o;
wire [31:0] sdram_dat_i;
wire [31:0] sdram_dat_o;
wire [31:0] sdram_adr_i;

// dma
wire [31:0]dma_addr;
wire dma_stb;
wire dma_cyc;
wire dma_we;
wire dma_ack_o;
wire [3:0]dma_sel;
wire [31:0]dma_dat_i;

// mode select for fir_mm
wire dma_fir_tap;
wire dma_mode_fir;
wire dma_mode_mm;

// fir_mm to tap ram
wire tap_WE;
wire tap_RE;
wire [11:0]tap_WADDR;
wire [11:0]tap_RADDR;
wire [31:0]tap_Di;
wire [31:0]tap_Do;
// fir_mm to data ram
wire data_WE;
wire data_RE;
wire [11:0]data_WADDR;
wire [11:0]data_RADDR;
wire [31:0]data_Di;
wire [31:0]data_Do;
// ss
wire            ss_tvalid;
wire [31:0]     ss_tdata;
wire            ss_tlast;
wire            ss_tready;
// sm
wire            sm_tready;
wire            sm_tvalid;
wire [31:0]     sm_tdata;
wire            sm_tlast;

assign clk = wb_clk_i;
assign rst = wb_rst_i;

dma u_dma(
    .wb_clk_i(clk),
    .wb_rst_i(rst),
    .wbs_stb_i(wbs_stb_i&decoded_cpu),
    .wbs_cyc_i(wbs_cyc_i),
    .wbs_we_i(wbs_we_i),
    .wbs_sel_i(wbs_sel_i),
    .read_dat_i(cpu_dat_o),
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

arbiter u_arbiter(
    .clk(clk),
    .rst(rst),
    .cpu_stb_i(wbs_stb_i),
    .cpu_cyc_i(wbs_cyc_i),
    .cpu_ack_o(cpu_ack_o),
    .cpu_we_i(wbs_we_i),
    .cpu_sel_i(wbs_sel_i),
    .cpu_dat_i(wbs_dat_i),
    .cpu_adr_i(wbs_adr_i),
    .dma_stb_i(dma_stb),
    .dma_cyc_i(dma_cyc),
    .dma_ack_o(dma_ack_o),
    .dma_we_i(dma_we),
    .dma_sel_i(dma_sel),
    .dma_dat_i(dma_dat_i),
    .dma_adr_i(dma_addr),
    .sdram_stb_i(sdram_stb_i),
    .sdram_cyc_i(sdram_cyc_i),
    .sdram_ack_o(sdram_ack_o),
    .sdram_we_i(sdram_we_i),
    .sdram_sel_i(sdram_sel_i),
    .sdram_dat_i(sdram_dat_i),
    .sdram_adr_i(sdram_adr_i),
    .sdram_dat_o(sdram_dat_o),
    .arbiter_dat_o(cpu_dat_o)
);


sdram u_sdram(
    .wb_clk_i(clk),
    .wb_rst_i(rst),
    .wbs_stb_i(sdram_stb_i),
    .wbs_cyc_i(sdram_cyc_i),
    .wbs_we_i(sdram_we_i),
    .wbs_sel_i(sdram_sel_i),
    .wbs_dat_i(sdram_dat_i),
    .wbs_adr_i(sdram_adr_i),
    .wbs_ack_o(sdram_ack_o),
    .wbs_dat_o(sdram_dat_o)
);


fir_mm u_fir_mm(
    // wishbone
    .wbs_stb_i(wbs_stb_i&decoded_fir_mm), // Valid data transfer cycle (kind of chip select)
    .wbs_cyc_i(wbs_cyc_i), // Bus Cycle in progress (active high)
    .wbs_we_i(wbs_we_i), // READ (negate), WRITE(assert)
    .wbs_sel_i(wbs_sel_i), // Valid data(Byte-enable)
    .wbs_dat_i(wbs_dat_i),
    .wbs_adr_i(wbs_adr_i),
    .wbs_ack_o(fir_ack_o),
    .wbs_dat_o(fir_dat_o),
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
    .clk(wb_clk_i),
    .rst(rst),
    .tap_mode(dma_fir_tap),
    .fir_mode(dma_mode_fir),
    .mm_mode(dma_mode_mm)
);

bram16 tap_RAM(
    .clk(wb_clk_i),
    .we(tap_WE),
    .re(tap_RE),
    .waddr(tap_WADDR),
    .raddr(tap_RADDR),
    .wdi(tap_Di),
    .rdo(tap_Do)
);
bram16 data_RAM(
    .clk(wb_clk_i),
    .we(data_WE),
    .re(data_RE),
    .waddr(data_WADDR),
    .raddr(data_RADDR),
    .wdi(data_Di),
    .rdo(data_Do)
);


// uart
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

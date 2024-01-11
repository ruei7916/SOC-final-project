// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2022.1 (lin64) Build 3526262 Mon Apr 18 15:47:01 MDT 2022
// Date        : Thu Dec 14 03:31:28 2023
// Host        : ubuntu2004 running 64-bit Ubuntu 20.04.4 LTS
// Command     : write_verilog -force -mode funcsim
//               /home/ubuntu/soc_design-lab6/vivado/vvd_caravel_fpga/vvd_caravel_fpga.gen/sources_1/bd/design_1/ip/design_1_blk_mem_gen_0_0/design_1_blk_mem_gen_0_0_sim_netlist.v
// Design      : design_1_blk_mem_gen_0_0
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7z020clg400-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "design_1_blk_mem_gen_0_0,blk_mem_gen_v8_4_5,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* x_core_info = "blk_mem_gen_v8_4_5,Vivado 2022.1" *) 
(* NotValidForBitStream *)
module design_1_blk_mem_gen_0_0
   (clka,
    rsta,
    ena,
    wea,
    addra,
    dina,
    douta,
    clkb,
    rstb,
    enb,
    web,
    addrb,
    dinb,
    doutb,
    rsta_busy,
    rstb_busy);
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA CLK" *) (* x_interface_parameter = "XIL_INTERFACENAME BRAM_PORTA, MEM_SIZE 8192, MEM_WIDTH 32, MEM_ECC NONE, MASTER_TYPE BRAM_CTRL, READ_WRITE_MODE READ_WRITE, READ_LATENCY 1" *) input clka;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA RST" *) input rsta;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA EN" *) input ena;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA WE" *) input [3:0]wea;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA ADDR" *) input [31:0]addra;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA DIN" *) input [31:0]dina;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA DOUT" *) output [31:0]douta;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTB CLK" *) (* x_interface_parameter = "XIL_INTERFACENAME BRAM_PORTB, MEM_SIZE 8192, MEM_WIDTH 32, MEM_ECC NONE, MASTER_TYPE BRAM_CTRL, READ_WRITE_MODE READ_WRITE, READ_LATENCY 1" *) input clkb;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTB RST" *) input rstb;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTB EN" *) input enb;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTB WE" *) input [3:0]web;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTB ADDR" *) input [31:0]addrb;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTB DIN" *) input [31:0]dinb;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTB DOUT" *) output [31:0]doutb;
  output rsta_busy;
  output rstb_busy;

  wire [31:0]addra;
  wire [31:0]addrb;
  wire clka;
  wire clkb;
  wire [31:0]dina;
  wire [31:0]dinb;
  wire [31:0]douta;
  wire [31:0]doutb;
  wire ena;
  wire enb;
  wire rsta;
  wire rsta_busy;
  wire rstb;
  wire rstb_busy;
  wire [3:0]wea;
  wire [3:0]web;
  wire NLW_U0_dbiterr_UNCONNECTED;
  wire NLW_U0_s_axi_arready_UNCONNECTED;
  wire NLW_U0_s_axi_awready_UNCONNECTED;
  wire NLW_U0_s_axi_bvalid_UNCONNECTED;
  wire NLW_U0_s_axi_dbiterr_UNCONNECTED;
  wire NLW_U0_s_axi_rlast_UNCONNECTED;
  wire NLW_U0_s_axi_rvalid_UNCONNECTED;
  wire NLW_U0_s_axi_sbiterr_UNCONNECTED;
  wire NLW_U0_s_axi_wready_UNCONNECTED;
  wire NLW_U0_sbiterr_UNCONNECTED;
  wire [31:0]NLW_U0_rdaddrecc_UNCONNECTED;
  wire [3:0]NLW_U0_s_axi_bid_UNCONNECTED;
  wire [1:0]NLW_U0_s_axi_bresp_UNCONNECTED;
  wire [31:0]NLW_U0_s_axi_rdaddrecc_UNCONNECTED;
  wire [31:0]NLW_U0_s_axi_rdata_UNCONNECTED;
  wire [3:0]NLW_U0_s_axi_rid_UNCONNECTED;
  wire [1:0]NLW_U0_s_axi_rresp_UNCONNECTED;

  (* C_ADDRA_WIDTH = "32" *) 
  (* C_ADDRB_WIDTH = "32" *) 
  (* C_ALGORITHM = "1" *) 
  (* C_AXI_ID_WIDTH = "4" *) 
  (* C_AXI_SLAVE_TYPE = "0" *) 
  (* C_AXI_TYPE = "1" *) 
  (* C_BYTE_SIZE = "8" *) 
  (* C_COMMON_CLK = "0" *) 
  (* C_COUNT_18K_BRAM = "0" *) 
  (* C_COUNT_36K_BRAM = "2" *) 
  (* C_CTRL_ECC_ALGO = "NONE" *) 
  (* C_DEFAULT_DATA = "0" *) 
  (* C_DISABLE_WARN_BHV_COLL = "0" *) 
  (* C_DISABLE_WARN_BHV_RANGE = "0" *) 
  (* C_ELABORATION_DIR = "./" *) 
  (* C_ENABLE_32BIT_ADDRESS = "1" *) 
  (* C_EN_DEEPSLEEP_PIN = "0" *) 
  (* C_EN_ECC_PIPE = "0" *) 
  (* C_EN_RDADDRA_CHG = "0" *) 
  (* C_EN_RDADDRB_CHG = "0" *) 
  (* C_EN_SAFETY_CKT = "1" *) 
  (* C_EN_SHUTDOWN_PIN = "0" *) 
  (* C_EN_SLEEP_PIN = "0" *) 
  (* C_EST_POWER_SUMMARY = "Estimated Power for IP     :     10.7492 mW" *) 
  (* C_FAMILY = "zynq" *) 
  (* C_HAS_AXI_ID = "0" *) 
  (* C_HAS_ENA = "1" *) 
  (* C_HAS_ENB = "1" *) 
  (* C_HAS_INJECTERR = "0" *) 
  (* C_HAS_MEM_OUTPUT_REGS_A = "0" *) 
  (* C_HAS_MEM_OUTPUT_REGS_B = "0" *) 
  (* C_HAS_MUX_OUTPUT_REGS_A = "0" *) 
  (* C_HAS_MUX_OUTPUT_REGS_B = "0" *) 
  (* C_HAS_REGCEA = "0" *) 
  (* C_HAS_REGCEB = "0" *) 
  (* C_HAS_RSTA = "1" *) 
  (* C_HAS_RSTB = "1" *) 
  (* C_HAS_SOFTECC_INPUT_REGS_A = "0" *) 
  (* C_HAS_SOFTECC_OUTPUT_REGS_B = "0" *) 
  (* C_INITA_VAL = "0" *) 
  (* C_INITB_VAL = "0" *) 
  (* C_INIT_FILE = "NONE" *) 
  (* C_INIT_FILE_NAME = "no_coe_file_loaded" *) 
  (* C_INTERFACE_TYPE = "0" *) 
  (* C_LOAD_INIT_FILE = "0" *) 
  (* C_MEM_TYPE = "2" *) 
  (* C_MUX_PIPELINE_STAGES = "0" *) 
  (* C_PRIM_TYPE = "1" *) 
  (* C_READ_DEPTH_A = "2048" *) 
  (* C_READ_DEPTH_B = "2048" *) 
  (* C_READ_LATENCY_A = "1" *) 
  (* C_READ_LATENCY_B = "1" *) 
  (* C_READ_WIDTH_A = "32" *) 
  (* C_READ_WIDTH_B = "32" *) 
  (* C_RSTRAM_A = "0" *) 
  (* C_RSTRAM_B = "0" *) 
  (* C_RST_PRIORITY_A = "CE" *) 
  (* C_RST_PRIORITY_B = "CE" *) 
  (* C_SIM_COLLISION_CHECK = "ALL" *) 
  (* C_USE_BRAM_BLOCK = "1" *) 
  (* C_USE_BYTE_WEA = "1" *) 
  (* C_USE_BYTE_WEB = "1" *) 
  (* C_USE_DEFAULT_DATA = "0" *) 
  (* C_USE_ECC = "0" *) 
  (* C_USE_SOFTECC = "0" *) 
  (* C_USE_URAM = "0" *) 
  (* C_WEA_WIDTH = "4" *) 
  (* C_WEB_WIDTH = "4" *) 
  (* C_WRITE_DEPTH_A = "2048" *) 
  (* C_WRITE_DEPTH_B = "2048" *) 
  (* C_WRITE_MODE_A = "WRITE_FIRST" *) 
  (* C_WRITE_MODE_B = "WRITE_FIRST" *) 
  (* C_WRITE_WIDTH_A = "32" *) 
  (* C_WRITE_WIDTH_B = "32" *) 
  (* C_XDEVICEFAMILY = "zynq" *) 
  (* downgradeipidentifiedwarnings = "yes" *) 
  (* is_du_within_envelope = "true" *) 
  design_1_blk_mem_gen_0_0_blk_mem_gen_v8_4_5 U0
       (.addra({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,addra[12:2],1'b0,1'b0}),
        .addrb({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,addrb[12:2],1'b0,1'b0}),
        .clka(clka),
        .clkb(clkb),
        .dbiterr(NLW_U0_dbiterr_UNCONNECTED),
        .deepsleep(1'b0),
        .dina(dina),
        .dinb(dinb),
        .douta(douta),
        .doutb(doutb),
        .eccpipece(1'b0),
        .ena(ena),
        .enb(enb),
        .injectdbiterr(1'b0),
        .injectsbiterr(1'b0),
        .rdaddrecc(NLW_U0_rdaddrecc_UNCONNECTED[31:0]),
        .regcea(1'b0),
        .regceb(1'b0),
        .rsta(rsta),
        .rsta_busy(rsta_busy),
        .rstb(rstb),
        .rstb_busy(rstb_busy),
        .s_aclk(1'b0),
        .s_aresetn(1'b0),
        .s_axi_araddr({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_arburst({1'b0,1'b0}),
        .s_axi_arid({1'b0,1'b0,1'b0,1'b0}),
        .s_axi_arlen({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_arready(NLW_U0_s_axi_arready_UNCONNECTED),
        .s_axi_arsize({1'b0,1'b0,1'b0}),
        .s_axi_arvalid(1'b0),
        .s_axi_awaddr({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_awburst({1'b0,1'b0}),
        .s_axi_awid({1'b0,1'b0,1'b0,1'b0}),
        .s_axi_awlen({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_awready(NLW_U0_s_axi_awready_UNCONNECTED),
        .s_axi_awsize({1'b0,1'b0,1'b0}),
        .s_axi_awvalid(1'b0),
        .s_axi_bid(NLW_U0_s_axi_bid_UNCONNECTED[3:0]),
        .s_axi_bready(1'b0),
        .s_axi_bresp(NLW_U0_s_axi_bresp_UNCONNECTED[1:0]),
        .s_axi_bvalid(NLW_U0_s_axi_bvalid_UNCONNECTED),
        .s_axi_dbiterr(NLW_U0_s_axi_dbiterr_UNCONNECTED),
        .s_axi_injectdbiterr(1'b0),
        .s_axi_injectsbiterr(1'b0),
        .s_axi_rdaddrecc(NLW_U0_s_axi_rdaddrecc_UNCONNECTED[31:0]),
        .s_axi_rdata(NLW_U0_s_axi_rdata_UNCONNECTED[31:0]),
        .s_axi_rid(NLW_U0_s_axi_rid_UNCONNECTED[3:0]),
        .s_axi_rlast(NLW_U0_s_axi_rlast_UNCONNECTED),
        .s_axi_rready(1'b0),
        .s_axi_rresp(NLW_U0_s_axi_rresp_UNCONNECTED[1:0]),
        .s_axi_rvalid(NLW_U0_s_axi_rvalid_UNCONNECTED),
        .s_axi_sbiterr(NLW_U0_s_axi_sbiterr_UNCONNECTED),
        .s_axi_wdata({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_wlast(1'b0),
        .s_axi_wready(NLW_U0_s_axi_wready_UNCONNECTED),
        .s_axi_wstrb({1'b0,1'b0,1'b0,1'b0}),
        .s_axi_wvalid(1'b0),
        .sbiterr(NLW_U0_sbiterr_UNCONNECTED),
        .shutdown(1'b0),
        .sleep(1'b0),
        .wea(wea),
        .web(web));
endmodule
`pragma protect begin_protected
`pragma protect version = 1
`pragma protect encrypt_agent = "XILINX"
`pragma protect encrypt_agent_info = "Xilinx Encryption Tool 2022.1"
`pragma protect key_keyowner="Synopsys", key_keyname="SNPS-VCS-RSA-2", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=128)
`pragma protect key_block
RgPKnWr9n0dGgttm3akiFhAlfB96usOQYxnEmPhGyTGg1AbizYAjGPWLXBWl50n/d0IA71ci4aJB
wt6mtfyNADm3ZReK7D3mKu037BOgxryoEwwf1kiC6q/PllxsdAgEMfQrfHJ3E2AzSpdYjoxVYito
y0JW6CUDcWvWa4WV0EA=

`pragma protect key_keyowner="Aldec", key_keyname="ALDEC15_001", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
M0l6KpOGH3jL8eRt3NCD7e2USYnkg5H9GAnE1PKmnjiouFN3Y8kjWA2PZDAQLm9UW+TsC1HeVlzO
WjNCHkjR/6ubCsIcWfpPZWdIuAenlsyq8Y9l6b8vMj8JSbDEOiFF/GHSbKsn22MJdDJKEhHFK6GV
s8gR2vywRFwG69gIRE4qGhVB+WIg8GJrDpDMYH6lCjMkTrjXuKDUcNlJN3NPLuhJ7tsditwf1pr5
moJRmGpJnip/rGm0g4o4A6ev4CtePjoao8C1wFtzHkERX9oenhh7cGjDMejU5IrLv8NxFnLj1FpB
9MuF1beTU20NI5oAn6zLiLiOtXjf0ghU3AN4DA==

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-VELOCE-RSA", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=128)
`pragma protect key_block
hAsrUfp6Qgjm8yBjNYTEtQmVQmMxzL8TE/3oiQSxSI3+yEkXAbQCXkT9mo+LCdv+fGECOB0istHd
eLtbsiYbxjxNxYkXiUrRE5O+aSxynIray+uF9DJigTEUZu8JJXUbzxK4DDUu1Lm9tpGps4+Prz1m
0gkj13RT/Y/418s2VTw=

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-VERIF-SIM-RSA-2", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
BP/54Wm/GJmb1jy0bxWJJX4aiKyiWPVh4X3VL30BQrmX4PlEsNKzBJH3Qu8IIYERfnFP0ifAgboa
vypMQ5Ed0BrMePGkWIgT6I8hxJCMFpHdkSK7m1giSKyZzFfTOrVqoNFXE+qdzLfY1J5hBWCvouYo
jllavK4N3gF9FLScH2AUWYVMcVth2QPaTAU2NLnAUNH8kgtBjBfc8/KbPPTznD1QNVqvFstzcbTA
hGQ1ETVPvINQ0KqxxAG5PRhtQD4+pC+hr/Tvk+RSvGyBOfy9zE86OXkJiYs9dSFhNiMFmCPL9DBO
se4OxNNC0/7aBtb1mkSEA9YFDYEb9jS7Jasy2A==

`pragma protect key_keyowner="Real Intent", key_keyname="RI-RSA-KEY-1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
SnzT9DVH3xlEN8nrr2YrlvTO5qj7L22d7WaBcuKyTaiHoIwwFHrC4HQbfs0TAwkdWcOgmJoATPSF
F6qm0KiddbrlERF3MfKUldeGBJtqLdX+zGw7+3JD7S+HB9dIMOFOHy+IiCZp1/Pz8epKpi238cel
rcVoJQKz406wmXDvOo8KsT+XhRLs9BVCrBErPGGXKYDk6NXAp0duOgQE9DbslzMU83M/kUC7uERV
tQW02240peKQFp2elEZC7Tetvgp0TaFTtJiKN45REi8GQUCKGa85JjNIk1qb/+k95TIIP1xrHirc
6iX7qbwnPetv8TVu2NjkZ0WDEK5RXdOXcxBwHA==

`pragma protect key_keyowner="Xilinx", key_keyname="xilinxt_2021_07", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
erkR82V0jX8ytva+9MzEs0c75Z7j7TsgxWRLNAUfbbU28i+U9YzuZlSfYU75M0f9jx1gvxtBrfKv
cNHVdkR+i5zfHDZsDwfMEEBhs8wzDCKqe+eex6BBEvlIOesCPXrr2RozQgaQ1PBh/os2Arfu+873
BjsVxFJkbhpzIqlddOo/XZV9Yi+eih7A7pXXEBR6IL7Poo4Ka49MiVQU0xJrDTm+ddOuMPDRRD7g
dsxS/uzdcBcO2myV6g/7YH/C2Ce9s6+UywJN/0JeXSqwA7bsBqqnfFicVAT0lckLopMLiuzK7dsN
EwhFeqoetciFrDIj9+o0xDMWBZhgNP1u68vURA==

`pragma protect key_keyowner="Metrics Technologies Inc.", key_keyname="DSim", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
R+BI65BKLT0I9hEtsxGnDyM5XY9gzULeTPOSDXvd3KWOzZJAx6C0xlbyZcFZhAEG/QIK2yd0wAi6
IUWxyF/sx3HsqKjhVi5KxnpuXDBOZVoj811O7JukedFVmDW7OHGtBkuiJ5X5irw7mfsEKRQmF/1i
V6lj9HYHZEjxtDeZjACsLY4y1QxWalSKT4HIMOHznBLL8dLbGMlS+ZmFuFn0gcwZavVl7gTkTtkf
W0gn01A9ru7NKsf+iLX0kj4dgItPu9N2g02M1vWQ9UUQEVvfV7lUc7GY1suibrD8aEkhH9S7lZ7n
bFsT4qxyvzg8ML6v4g4v7N6VuyhEtgFgNd725Q==

`pragma protect key_keyowner="Atrenta", key_keyname="ATR-SG-RSA-1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=384)
`pragma protect key_block
jNUVKiwH68vHsU54idgvKwaVJcoxTUuxfgrQpbpmM/IpesWA3wHsGzYClwAxkKzw3KRnFyQqTWcZ
yj1EQ2CMBxlJ0kyNbZW8OK8pXzeigToZ0U6Aq3Gy+j7wBbhe83wE1Ygn82sK8dHTEulvaRLn/c5r
ispy1s7jMKIvYNzoUuZrgyBQyfaYmdqUia8XlQjFd+VwzhTXKwzvmaqHWyaHjfBKeCooO7+oUxMG
OJg83W54EVe9ronFQ8Wr9EOL8ia7qelCAgyQe/bC0HHCoMAm8apI7sX23iMR/wMiPP5V2bQzycy+
rBX/+SWkqSeIE1FLm+muFPvrE7iLwJaW8d1fzdFFjAZ5aIXArbWNfwbK8S0TczXc9lEzmpb69rwA
UJIrs4alo81qGQ32UFhjuMQjX75O9Od1HWHDj5PFaT/Ja5Ly+bK8Cc3gfO6dCE81m7d+B2JBZ/Hl
tBA19QuOAYwT2EIPOdpaVtCULb33cWODWu3qQFhZMmDzKTb3kwpcr0LL

`pragma protect key_keyowner="Cadence Design Systems.", key_keyname="CDS_RSA_KEY_VER_1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
MnzcA2swaxH1LRacKDou0ZmiiMRETbWIdHgeBgyQz7ILronsXLoB/C20WuFNGEVSiL2/51EZ6MXZ
vMHI8fFcMQCJcuTBDBibUMKv6bXI9s8fTbtrBZppbF/R1icG5JYhqmX4aRnv4W/dxJRjI2L35nLN
Y48E9OfgfkD1sr+IRwx8WEKFmUhuk8dLe0VOK7ywe3XEcneYvrz+HhPj16bGmNfMwNnDgZ3gKKZD
hRnys+jzvAX3HyISrErWXhMKrhWMxXeTNFJCqNQ0LWAVHQYwyKnF5xVpyXSuGNSIrva+QXqOrZBG
3VNLirNVtMRiKLfwZeMaqvswkqBDAa53utlAAA==

`pragma protect key_keyowner="Synplicity", key_keyname="SYNP15_1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
d0xXkKtsKM8GvXhDZr16p1+oE3uBtD04BJ76eGGIEj/CFECfHVy9qsJ43oSKjas0+AJr4GFFnVb6
X7gJV6MmX/OboC9ier5joUCGz0mxVzkRZK9a+LPEDcg0K6+cLE36kr+FfxW9Uk2816EHBCMCf5mK
A4eAhSmAb5Nq74F/q0quiG416npbny7faiQ+xmPDfYYiM3UuMKaD4iE8ODlz1w5xThPllWESf3LZ
NTkw6fozyTqZ47vvE21O3dgIGAY1v+C6BwlCK24VwPJa1xs9csY+qTk31j5jjAc1ExlB6QF7t9UH
lk70qdNPWxT87OH7kFT8UvPO1D6BTC3/WkDZfA==

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-PREC-RSA", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
LYhdzKTvo93uJrAaiP5OfCDuOnu2BSvPnxlv6I7h2n1+xHtj34LNNKzWEgOg9dUV9cYDaHYUjjEt
DKdWcz6mZ61d5qyxAhpv67fc90v7JVgtOAcT94/Yb+AuLxXFcGA6Gic7uoJtUgz6JmTnb22Dxdjc
KuIewDj4IOTfP8XGXKTaF+cNp0CFrQgTAcVSQFyLFxr0I/9h3S+GZLecA7ntEeHEOfCJzPvy0ddi
7MCdQWECLb+fXC0IAn8V95TumcpINiRAX1BHi9IGJ4QoMrb3jOCrPkFhDMTJj2aiImUWdi/l/0QE
d7wcXlgIEYVeoKYUOJ4mqy+zZPUbLNeOPADUDQ==

`pragma protect data_method = "AES128-CBC"
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 59888)
`pragma protect data_block
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
`pragma protect end_protected
`ifndef GLBL
`define GLBL
`timescale  1 ps / 1 ps

module glbl ();

    parameter ROC_WIDTH = 100000;
    parameter TOC_WIDTH = 0;
    parameter GRES_WIDTH = 10000;
    parameter GRES_START = 10000;

//--------   STARTUP Globals --------------
    wire GSR;
    wire GTS;
    wire GWE;
    wire PRLD;
    wire GRESTORE;
    tri1 p_up_tmp;
    tri (weak1, strong0) PLL_LOCKG = p_up_tmp;

    wire PROGB_GLBL;
    wire CCLKO_GLBL;
    wire FCSBO_GLBL;
    wire [3:0] DO_GLBL;
    wire [3:0] DI_GLBL;
   
    reg GSR_int;
    reg GTS_int;
    reg PRLD_int;
    reg GRESTORE_int;

//--------   JTAG Globals --------------
    wire JTAG_TDO_GLBL;
    wire JTAG_TCK_GLBL;
    wire JTAG_TDI_GLBL;
    wire JTAG_TMS_GLBL;
    wire JTAG_TRST_GLBL;

    reg JTAG_CAPTURE_GLBL;
    reg JTAG_RESET_GLBL;
    reg JTAG_SHIFT_GLBL;
    reg JTAG_UPDATE_GLBL;
    reg JTAG_RUNTEST_GLBL;

    reg JTAG_SEL1_GLBL = 0;
    reg JTAG_SEL2_GLBL = 0 ;
    reg JTAG_SEL3_GLBL = 0;
    reg JTAG_SEL4_GLBL = 0;

    reg JTAG_USER_TDO1_GLBL = 1'bz;
    reg JTAG_USER_TDO2_GLBL = 1'bz;
    reg JTAG_USER_TDO3_GLBL = 1'bz;
    reg JTAG_USER_TDO4_GLBL = 1'bz;

    assign (strong1, weak0) GSR = GSR_int;
    assign (strong1, weak0) GTS = GTS_int;
    assign (weak1, weak0) PRLD = PRLD_int;
    assign (strong1, weak0) GRESTORE = GRESTORE_int;

    initial begin
	GSR_int = 1'b1;
	PRLD_int = 1'b1;
	#(ROC_WIDTH)
	GSR_int = 1'b0;
	PRLD_int = 1'b0;
    end

    initial begin
	GTS_int = 1'b1;
	#(TOC_WIDTH)
	GTS_int = 1'b0;
    end

    initial begin 
	GRESTORE_int = 1'b0;
	#(GRES_START);
	GRESTORE_int = 1'b1;
	#(GRES_WIDTH);
	GRESTORE_int = 1'b0;
    end

endmodule
`endif

// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2022.1 (lin64) Build 3526262 Mon Apr 18 15:47:01 MDT 2022
// Date        : Tue Nov 21 09:46:41 2023
// Host        : ubuntu2004 running 64-bit Ubuntu 20.04.4 LTS
// Command     : write_verilog -force -mode funcsim
//               /home/ubuntu/labi/vvd_caravel_fpga/vvd_caravel_fpga.gen/sources_1/bd/design_1/ip/design_1_blk_mem_gen_0_0/design_1_blk_mem_gen_0_0_sim_netlist.v
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

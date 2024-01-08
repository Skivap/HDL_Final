// Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2020.2 (win64) Build 3064766 Wed Nov 18 09:12:45 MST 2020
// Date        : Sat Jan  6 12:03:29 2024
// Host        : LAPTOP-T7B654NQ running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim
//               c:/Users/User/Documents/College/LDL/FinalProject/FinalProject/FinalProject.gen/sources_1/ip/blk_mem_gen_2_1/blk_mem_gen_2_sim_netlist.v
// Design      : blk_mem_gen_2
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7a35tcpg236-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "blk_mem_gen_2,blk_mem_gen_v8_4_4,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* x_core_info = "blk_mem_gen_v8_4_4,Vivado 2020.2" *) 
(* NotValidForBitStream *)
module blk_mem_gen_2
   (clka,
    wea,
    addra,
    dina,
    douta);
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA CLK" *) (* x_interface_parameter = "XIL_INTERFACENAME BRAM_PORTA, MEM_SIZE 8192, MEM_WIDTH 32, MEM_ECC NONE, MASTER_TYPE OTHER, READ_LATENCY 1" *) input clka;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA WE" *) input [0:0]wea;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA ADDR" *) input [10:0]addra;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA DIN" *) input [11:0]dina;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA DOUT" *) output [11:0]douta;

  wire [10:0]addra;
  wire clka;
  wire [11:0]dina;
  wire [11:0]douta;
  wire [0:0]wea;
  wire NLW_U0_dbiterr_UNCONNECTED;
  wire NLW_U0_rsta_busy_UNCONNECTED;
  wire NLW_U0_rstb_busy_UNCONNECTED;
  wire NLW_U0_s_axi_arready_UNCONNECTED;
  wire NLW_U0_s_axi_awready_UNCONNECTED;
  wire NLW_U0_s_axi_bvalid_UNCONNECTED;
  wire NLW_U0_s_axi_dbiterr_UNCONNECTED;
  wire NLW_U0_s_axi_rlast_UNCONNECTED;
  wire NLW_U0_s_axi_rvalid_UNCONNECTED;
  wire NLW_U0_s_axi_sbiterr_UNCONNECTED;
  wire NLW_U0_s_axi_wready_UNCONNECTED;
  wire NLW_U0_sbiterr_UNCONNECTED;
  wire [11:0]NLW_U0_doutb_UNCONNECTED;
  wire [10:0]NLW_U0_rdaddrecc_UNCONNECTED;
  wire [3:0]NLW_U0_s_axi_bid_UNCONNECTED;
  wire [1:0]NLW_U0_s_axi_bresp_UNCONNECTED;
  wire [10:0]NLW_U0_s_axi_rdaddrecc_UNCONNECTED;
  wire [11:0]NLW_U0_s_axi_rdata_UNCONNECTED;
  wire [3:0]NLW_U0_s_axi_rid_UNCONNECTED;
  wire [1:0]NLW_U0_s_axi_rresp_UNCONNECTED;

  (* C_ADDRA_WIDTH = "11" *) 
  (* C_ADDRB_WIDTH = "11" *) 
  (* C_ALGORITHM = "1" *) 
  (* C_AXI_ID_WIDTH = "4" *) 
  (* C_AXI_SLAVE_TYPE = "0" *) 
  (* C_AXI_TYPE = "1" *) 
  (* C_BYTE_SIZE = "9" *) 
  (* C_COMMON_CLK = "0" *) 
  (* C_COUNT_18K_BRAM = "0" *) 
  (* C_COUNT_36K_BRAM = "1" *) 
  (* C_CTRL_ECC_ALGO = "NONE" *) 
  (* C_DEFAULT_DATA = "0" *) 
  (* C_DISABLE_WARN_BHV_COLL = "0" *) 
  (* C_DISABLE_WARN_BHV_RANGE = "0" *) 
  (* C_ELABORATION_DIR = "./" *) 
  (* C_ENABLE_32BIT_ADDRESS = "0" *) 
  (* C_EN_DEEPSLEEP_PIN = "0" *) 
  (* C_EN_ECC_PIPE = "0" *) 
  (* C_EN_RDADDRA_CHG = "0" *) 
  (* C_EN_RDADDRB_CHG = "0" *) 
  (* C_EN_SAFETY_CKT = "0" *) 
  (* C_EN_SHUTDOWN_PIN = "0" *) 
  (* C_EN_SLEEP_PIN = "0" *) 
  (* C_EST_POWER_SUMMARY = "Estimated Power for IP     :     2.5913 mW" *) 
  (* C_FAMILY = "artix7" *) 
  (* C_HAS_AXI_ID = "0" *) 
  (* C_HAS_ENA = "0" *) 
  (* C_HAS_ENB = "0" *) 
  (* C_HAS_INJECTERR = "0" *) 
  (* C_HAS_MEM_OUTPUT_REGS_A = "1" *) 
  (* C_HAS_MEM_OUTPUT_REGS_B = "0" *) 
  (* C_HAS_MUX_OUTPUT_REGS_A = "0" *) 
  (* C_HAS_MUX_OUTPUT_REGS_B = "0" *) 
  (* C_HAS_REGCEA = "0" *) 
  (* C_HAS_REGCEB = "0" *) 
  (* C_HAS_RSTA = "0" *) 
  (* C_HAS_RSTB = "0" *) 
  (* C_HAS_SOFTECC_INPUT_REGS_A = "0" *) 
  (* C_HAS_SOFTECC_OUTPUT_REGS_B = "0" *) 
  (* C_INITA_VAL = "0" *) 
  (* C_INITB_VAL = "0" *) 
  (* C_INIT_FILE = "blk_mem_gen_2.mem" *) 
  (* C_INIT_FILE_NAME = "blk_mem_gen_2.mif" *) 
  (* C_INTERFACE_TYPE = "0" *) 
  (* C_LOAD_INIT_FILE = "1" *) 
  (* C_MEM_TYPE = "0" *) 
  (* C_MUX_PIPELINE_STAGES = "0" *) 
  (* C_PRIM_TYPE = "1" *) 
  (* C_READ_DEPTH_A = "1600" *) 
  (* C_READ_DEPTH_B = "1600" *) 
  (* C_READ_LATENCY_A = "1" *) 
  (* C_READ_LATENCY_B = "1" *) 
  (* C_READ_WIDTH_A = "12" *) 
  (* C_READ_WIDTH_B = "12" *) 
  (* C_RSTRAM_A = "0" *) 
  (* C_RSTRAM_B = "0" *) 
  (* C_RST_PRIORITY_A = "CE" *) 
  (* C_RST_PRIORITY_B = "CE" *) 
  (* C_SIM_COLLISION_CHECK = "ALL" *) 
  (* C_USE_BRAM_BLOCK = "0" *) 
  (* C_USE_BYTE_WEA = "0" *) 
  (* C_USE_BYTE_WEB = "0" *) 
  (* C_USE_DEFAULT_DATA = "0" *) 
  (* C_USE_ECC = "0" *) 
  (* C_USE_SOFTECC = "0" *) 
  (* C_USE_URAM = "0" *) 
  (* C_WEA_WIDTH = "1" *) 
  (* C_WEB_WIDTH = "1" *) 
  (* C_WRITE_DEPTH_A = "1600" *) 
  (* C_WRITE_DEPTH_B = "1600" *) 
  (* C_WRITE_MODE_A = "WRITE_FIRST" *) 
  (* C_WRITE_MODE_B = "WRITE_FIRST" *) 
  (* C_WRITE_WIDTH_A = "12" *) 
  (* C_WRITE_WIDTH_B = "12" *) 
  (* C_XDEVICEFAMILY = "artix7" *) 
  (* downgradeipidentifiedwarnings = "yes" *) 
  (* is_du_within_envelope = "true" *) 
  blk_mem_gen_2_blk_mem_gen_v8_4_4 U0
       (.addra(addra),
        .addrb({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .clka(clka),
        .clkb(1'b0),
        .dbiterr(NLW_U0_dbiterr_UNCONNECTED),
        .deepsleep(1'b0),
        .dina(dina),
        .dinb({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .douta(douta),
        .doutb(NLW_U0_doutb_UNCONNECTED[11:0]),
        .eccpipece(1'b0),
        .ena(1'b0),
        .enb(1'b0),
        .injectdbiterr(1'b0),
        .injectsbiterr(1'b0),
        .rdaddrecc(NLW_U0_rdaddrecc_UNCONNECTED[10:0]),
        .regcea(1'b0),
        .regceb(1'b0),
        .rsta(1'b0),
        .rsta_busy(NLW_U0_rsta_busy_UNCONNECTED),
        .rstb(1'b0),
        .rstb_busy(NLW_U0_rstb_busy_UNCONNECTED),
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
        .s_axi_rdaddrecc(NLW_U0_s_axi_rdaddrecc_UNCONNECTED[10:0]),
        .s_axi_rdata(NLW_U0_s_axi_rdata_UNCONNECTED[11:0]),
        .s_axi_rid(NLW_U0_s_axi_rid_UNCONNECTED[3:0]),
        .s_axi_rlast(NLW_U0_s_axi_rlast_UNCONNECTED),
        .s_axi_rready(1'b0),
        .s_axi_rresp(NLW_U0_s_axi_rresp_UNCONNECTED[1:0]),
        .s_axi_rvalid(NLW_U0_s_axi_rvalid_UNCONNECTED),
        .s_axi_sbiterr(NLW_U0_s_axi_sbiterr_UNCONNECTED),
        .s_axi_wdata({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_wlast(1'b0),
        .s_axi_wready(NLW_U0_s_axi_wready_UNCONNECTED),
        .s_axi_wstrb(1'b0),
        .s_axi_wvalid(1'b0),
        .sbiterr(NLW_U0_sbiterr_UNCONNECTED),
        .shutdown(1'b0),
        .sleep(1'b0),
        .wea(wea),
        .web(1'b0));
endmodule
`pragma protect begin_protected
`pragma protect version = 1
`pragma protect encrypt_agent = "XILINX"
`pragma protect encrypt_agent_info = "Xilinx Encryption Tool 2020.2"
`pragma protect key_keyowner="Cadence Design Systems.", key_keyname="cds_rsa_key", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=64)
`pragma protect key_block
QGLtnqZzRetDH6gCWT4Js6wuLlZfrNx/VJp3sfR2NF+cxypO5AxN0oDKLJJtmdrtE/ueNDg+Qf7Z
TqBNRojORA==

`pragma protect key_keyowner="Synopsys", key_keyname="SNPS-VCS-RSA-2", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=128)
`pragma protect key_block
B6Ger3hRvfjHkaJ+W8639Kl3TzC9TogLuklOXEiMNdc4Im+DjEUzxb3DKlzu0VW3zxZqjJ3+wsW/
LnRmPCESi5Y9eRJaLFXg79EMfoj4X+nTdHAP6yCfltBADKegZ12gpnB/8ey5yn2KA74LUtPC7jna
iyjqSfsWLGnz6UdXzwk=

`pragma protect key_keyowner="Aldec", key_keyname="ALDEC15_001", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
BX+DxgMPRyZbYojCUR9Sk8Lq+3ZigBz4yMFHQkmurfdfDzyTPJCE827eGiPyTenK1QPVhEtf9g06
0BFXq/0COPuU1BWJwdkz1c4dE6/exDwhvEh+hPx3vRY6z8fDEf6aGVIXrHDvrmddehe7yMSIpo+k
aXHR06EEdfHCFY4TggYwhcJVXjkE+ApsVuyfmEfPmYjo8hCWyQyBsUWIOY03q1+MvUjjsmTwgs9g
fh5MY9ToaLfoJxPKdCpsqrBX4LJ+VDGFlAqIcqHTE2jCmPiToZAFXB7fzf1wDjFCBlJyFVDBGi0i
m+CouLSb7X1mvVhdDZgNrZDJMV688Bu3o54vew==

`pragma protect key_keyowner="ATRENTA", key_keyname="ATR-SG-2015-RSA-3", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
DaIU/Ddc8USbZ2mURzujJDWDH1JbHl5tFVOOQ2aVaUPIA71yyE38OXVLEtF8rNmujYH30nEeQ+FV
LVJ16aaHw+iiuaqorTM3K5KLohVlN+WlcEtSXHuPNHjw8ddqtzpaX7pH1zqZH+YmfCL5oaNLqDH4
rkBnUl0/Gm/hzSwKjYhXGQFYQ+gGP99OjXakzrAqZzp/Iq4gt+Z5902/JV9thd/isHQImJ0QyK8M
EKM579iPAfXGes2mbiNYHcvDmSPYmW1zlhOE++N1EKeea7j/msnKeyhlC+hGE4Xfn4TVvqgQexCT
rp/wS/MosY6WH1aKFQlFH2hEppA7KXUaQlvG+w==

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-VELOCE-RSA", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=128)
`pragma protect key_block
XmWoAt4X8hrCJ5yTyug4ajJW5UhfkLNibzjihWzZ4Cr9hQSvWZoTc8rjGsLPbz6Le+/9iI5KxecS
eR0wiAO+G2IkwhZgVBeZdKoFnlnTVAyLjk9wMAFXNyJZM6b1NDbfXlPcUsC6JePvPlwwdWknkSsC
r3KvgkWAS+O3xvRmaNw=

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-VERIF-SIM-RSA-2", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
Hw3Y+rShKrXiUViyNU1/O2qv6TgheLHBnFMj1i9MUGrHYqh9pLfLYUgWR7S2vj4jv4S+Ks0BpP4p
dKEqVAFmTCfQNEUHaVcFPkOHgig6L4mhLY6HUUKJoRgiQepgLi/W3V+ZZPQSQFkB3CU4MsJzhXvR
yLcpDriZy8cnAHD87Zi5DrNGBzj3kigJeM0du6lCQbxtF5aEdoaNP+YTnIFtcqYhoYnswQlYt0sV
HKgFA8VzqzL5WYnpH7+1IKmFkJBHkyqHCa9wPK0qCKnxkuDj70YzPVqQ+cocdKU+/gNdpCOdZlci
F2HTxrgfrXndJru3TiDqu4UavqAe0MNuFp3t0w==

`pragma protect key_keyowner="Real Intent", key_keyname="RI-RSA-KEY-1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
XPVggoWL6aXz+MpODTOZhEUQDa0vfEnUDaYeEHXm2vGyqKJujN2c/FFAFBeBYdJATLsIsQ+BqoPc
pBbcFYXDBfOtFIW2dH6Y1OoD65KyJ/hAq8coa21kFgq4hFat5vzZ2iIfkCpTUr4vDZO7Xne8cZO9
WsHffoTCt5rS59wWm2b8I5R8Eh2TUbQg3RCyrcnD66cvcEnlXe1CNMQ4/loVJpA4IBinBf820Wjc
vw2fZbGI0jXC+ACSHOviH63Xwmn+aRV5Ppkup7IYoon/ieKapRQeASu3TTY37xSBXiInSdtMTzJ6
+4GfO4eSHVriCk/sWbuTBzfRzoSShrnHjzz5LA==

`pragma protect key_keyowner="Xilinx", key_keyname="xilinxt_2020_08", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
L78XuiswVcgO2gtebzL7SA9BC/jJGAM0v6S9pzmyqL+QYzRneiYeGyDmsW33jEVVSTuNjTXkBLY7
yTOKQruatwe4V0OLi6174saSAmPgerSV1GyLP7KhmusLV/N61avC9TPam+tekhKeE0tds4EnJ3et
4JdLh+SE4Z4pcuqCjB5MFneIYKKWDx7siU6oesAQtoSJOesfMchX63MhOjOHFP/ch+1gHv3T45hg
IGF7V7TrdREVE4f9631tlVJ1o2Dypsmo/76Itz5WCGlTMjAnWXN8IXxKN+PZ3dyt1wjrZm2P/td+
xiGszFnSLrRvw/HferwtSmRx8q0fiHZ88roGTw==

`pragma protect key_keyowner="Metrics Technologies Inc.", key_keyname="DSim", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
kDX5kq2QEe25429T6vQqBCFvV1McKTJRYfK99ymVNK2GGvGLXSzgwJHwB2fj9rM0wme3zYYY0vQR
x+9F4L7KLlOVY6qY3LB59uDzyXBI3mMZaS905HXHJkdZHWtQWpfHhl27LqL+8FSluaD6F+KFfYOV
CwIOVuCIp/XjxFXpNBik7YiPt4kHOlDA97IXNLnYUn/g1csGqeNWce4UTne50ggWvLYGbTFGmTjT
N67TpUiGRVRCSv8Tax72GWFIMFZk3Tlp68ZUSQEybZMWX1U9XdMdtxfvNGhf8mi5jQJ2SupSzKu4
T/+53IN9T8aLePAiGBKKG1ZBj4y1ZyYA7XYvjw==

`pragma protect data_method = "AES128-CBC"
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 27024)
`pragma protect data_block
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
zmkU8FLR
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

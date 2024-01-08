// Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2020.2 (win64) Build 3064766 Wed Nov 18 09:12:45 MST 2020
// Date        : Sat Jan  6 12:03:29 2024
// Host        : LAPTOP-T7B654NQ running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim -rename_top decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix -prefix
//               decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ blk_mem_gen_2_sim_netlist.v
// Design      : blk_mem_gen_2
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7a35tcpg236-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "blk_mem_gen_2,blk_mem_gen_v8_4_4,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* x_core_info = "blk_mem_gen_v8_4_4,Vivado 2020.2" *) 
(* NotValidForBitStream *)
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix
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
  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_blk_mem_gen_v8_4_4 U0
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
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 27056)
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

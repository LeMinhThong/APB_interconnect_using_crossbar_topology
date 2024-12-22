`include "define_file.sv"

module crossbar_noc #(
      parameter ADDR_WIDTH = `ADDR_WIDTH,
      parameter DATA_WIDTH = `DATA_WIDTH
) (
      // system signals
      input                         pclk,
      input                         preset_n,

      // ----------------------------------------

      // APB bus requester 1
      input   [ADDR_WIDTH-1:0]      reqr1_paddr,
      input   [2:0]                 reqr1_pprot,
      input                         reqr1_pnse,
      input                         reqr1_psel,
      input                         reqr1_penable,
      input                         reqr1_pwrite,
      input   [DATA_WIDTH-1:0]      reqr1_pwdata,
      input   [DATA_WIDTH/8-1:0]    reqr1_pstrb,
      output                        reqr1_pready,
      output  [DATA_WIDTH-1:0]      reqr1_prdata,
      output                        reqr1_pslverr,
      input                         reqr1_pwakeup,

      // APB bus requester 2
      input   [ADDR_WIDTH-1:0]      reqr2_paddr,
      input   [2:0]                 reqr2_pprot,
      input                         reqr2_pnse,
      input                         reqr2_psel,
      input                         reqr2_penable,
      input                         reqr2_pwrite,
      input   [DATA_WIDTH-1:0]      reqr2_pwdata,
      input   [DATA_WIDTH/8-1:0]    reqr2_pstrb,
      output                        reqr2_pready,
      output  [DATA_WIDTH-1:0]      reqr2_prdata,
      output                        reqr2_pslverr,
      input                         reqr2_pwakeup,

      // APB bus requester 3
      input   [ADDR_WIDTH-1:0]      reqr3_paddr,
      input   [2:0]                 reqr3_pprot,
      input                         reqr3_pnse,
      input                         reqr3_psel,
      input                         reqr3_penable,
      input                         reqr3_pwrite,
      input   [DATA_WIDTH-1:0]      reqr3_pwdata,
      input   [DATA_WIDTH/8-1:0]    reqr3_pstrb,
      output                        reqr3_pready,
      output  [DATA_WIDTH-1:0]      reqr3_prdata,
      output                        reqr3_pslverr,
      input                         reqr3_pwakeup,

      // ----------------------------------------

      // APB bus completer 1
      output  [ADDR_WIDTH-1:0]      comp1_paddr,
      output  [2:0]                 comp1_pprot,
      output                        comp1_pnse,
      output                        comp1_psel,
      output                        comp1_penable,
      output                        comp1_pwrite,
      output  [DATA_WIDTH-1:0]      comp1_pwdata,
      output  [DATA_WIDTH/8-1:0]    comp1_pstrb,
      input                         comp1_pready,
      input   [DATA_WIDTH-1:0]      comp1_prdata,
      input                         comp1_pslverr,
      output                        comp1_pwakeup,

      // APB bus completer 2
      output  [ADDR_WIDTH-1:0]      comp2_paddr,
      output  [2:0]                 comp2_pprot,
      output                        comp2_pnse,
      output                        comp2_psel,
      output                        comp2_penable,
      output                        comp2_pwrite,
      output  [DATA_WIDTH-1:0]      comp2_pwdata,
      output  [DATA_WIDTH/8-1:0]    comp2_pstrb,
      input                         comp2_pready,
      input   [DATA_WIDTH-1:0]      comp2_prdata,
      input                         comp2_pslverr,
      output                        comp2_pwakeup,

      // APB bus completer 3
      output  [ADDR_WIDTH-1:0]      comp3_paddr,
      output  [2:0]                 comp3_pprot,
      output                        comp3_pnse,
      output                        comp3_psel,
      output                        comp3_penable,
      output                        comp3_pwrite,
      output  [DATA_WIDTH-1:0]      comp3_pwdata,
      output  [DATA_WIDTH/8-1:0]    comp3_pstrb,
      input                         comp3_pready,
      input   [DATA_WIDTH-1:0]      comp3_prdata,
      input                         comp3_pslverr,
      output                        comp3_pwakeup,

      // APB bus completer 4
      output  [ADDR_WIDTH-1:0]      comp4_paddr,
      output  [2:0]                 comp4_pprot,
      output                        comp4_pnse,
      output                        comp4_psel,
      output                        comp4_penable,
      output                        comp4_pwrite,
      output  [DATA_WIDTH-1:0]      comp4_pwdata,
      output  [DATA_WIDTH/8-1:0]    comp4_pstrb,
      input                         comp4_pready,
      input   [DATA_WIDTH-1:0]      comp4_prdata,
      input                         comp4_pslverr,
      output                        comp4_pwakeup
);

  parameter REQ_FLIT_WIDTH  = 8 + ADDR_WIDTH + DATA_WIDTH + DATA_WIDTH/8;
  parameter RSP_FLIT_WIDTH  = 2 + DATA_WIDTH;

  wire [3:0]                rn1_valid;
  wire [3:0]                rn2_valid;
  wire [3:0]                rn3_valid;

  wire [2:0]                cn1_ready;
  wire [2:0]                cn2_ready;
  wire [2:0]                cn3_ready;
  wire [2:0]                cn4_ready;

  wire                      cn_ready_rn1;
  wire                      cn_ready_rn2;
  wire                      cn_ready_rn3;

  wire [REQ_FLIT_WIDTH-1:0] icn_txreq_rn_1 [3:0];
  wire [REQ_FLIT_WIDTH-1:0] icn_txreq_rn_2 [3:0];
  wire [REQ_FLIT_WIDTH-1:0] icn_txreq_rn_3 [3:0];

  wire [RSP_FLIT_WIDTH-1:0] icn_txrsp_cn_1 [2:0];
  wire [RSP_FLIT_WIDTH-1:0] icn_txrsp_cn_2 [2:0];
  wire [RSP_FLIT_WIDTH-1:0] icn_txrsp_cn_3 [2:0];
  wire [RSP_FLIT_WIDTH-1:0] icn_txrsp_cn_4 [2:0];

// ------------------------------------------------------------------

  assign cn_ready_rn1 = cn1_ready[0] || cn2_ready[0] || cn3_ready[0] || cn4_ready[0];
  assign cn_ready_rn2 = cn1_ready[1] || cn2_ready[1] || cn3_ready[1] || cn4_ready[1];
  assign cn_ready_rn3 = cn1_ready[2] || cn2_ready[2] || cn3_ready[2] || cn4_ready[2];

// ------------------------------------------------------------------

  // request_note 1
  request_node #(
        .ADDR_WIDTH     (ADDR_WIDTH),
        .DATA_WIDTH     (DATA_WIDTH),
        .REQ_FLIT_WIDTH (REQ_FLIT_WIDTH),
        .RSP_FLIT_WIDTH (RSP_FLIT_WIDTH)
  ) rn1 (
        .pclk         (pclk),
        .preset_n     (preset_n),

        .paddr        (reqr1_paddr),
        .pprot        (reqr1_pprot),
        .pnse         (reqr1_pnse),
        .psel         (reqr1_psel),
        .penable      (reqr1_penable),
        .pwrite       (reqr1_pwrite),
        .pwdata       (reqr1_pwdata),
        .pstrb        (reqr1_pstrb),
        .pready       (reqr1_pready),
        .prdata       (reqr1_prdata),
        .pslverr      (reqr1_pslverr),
        .pwakeup      (reqr1_pwakeup),

        .cn_ready     (cn_ready_rn1),
        .rn_valid     (rn1_valid),

        .icn_rxrsp_1  (icn_txrsp_cn_1[0]),
        .icn_rxrsp_2  (icn_txrsp_cn_2[0]),
        .icn_rxrsp_3  (icn_txrsp_cn_3[0]),
        .icn_rxrsp_4  (icn_txrsp_cn_4[0]),

        .icn_txreq_1  (icn_txreq_rn_1[0]),
        .icn_txreq_2  (icn_txreq_rn_1[1]),
        .icn_txreq_3  (icn_txreq_rn_1[2]),
        .icn_txreq_4  (icn_txreq_rn_1[3])
  );

// ------------------------------------------------------------------

  // request_note 2
  request_node #(
        .ADDR_WIDTH     (ADDR_WIDTH),
        .DATA_WIDTH     (DATA_WIDTH),
        .REQ_FLIT_WIDTH (REQ_FLIT_WIDTH),
        .RSP_FLIT_WIDTH (RSP_FLIT_WIDTH)
  ) rn2 (
        .pclk         (pclk),
        .preset_n     (preset_n),

        .paddr        (reqr2_paddr),
        .pprot        (reqr2_pprot),
        .pnse         (reqr2_pnse),
        .psel         (reqr2_psel),
        .penable      (reqr2_penable),
        .pwrite       (reqr2_pwrite),
        .pwdata       (reqr2_pwdata),
        .pstrb        (reqr2_pstrb),
        .pready       (reqr2_pready),
        .prdata       (reqr2_prdata),
        .pslverr      (reqr2_pslverr),
        .pwakeup      (reqr2_pwakeup),

        .cn_ready     (cn_ready_rn2),
        .rn_valid     (rn2_valid),

        .icn_rxrsp_1  (icn_txrsp_cn_1[1]),
        .icn_rxrsp_2  (icn_txrsp_cn_2[1]),
        .icn_rxrsp_3  (icn_txrsp_cn_3[1]),
        .icn_rxrsp_4  (icn_txrsp_cn_4[1]),

        .icn_txreq_1  (icn_txreq_rn_2[0]),
        .icn_txreq_2  (icn_txreq_rn_2[1]),
        .icn_txreq_3  (icn_txreq_rn_2[2]),
        .icn_txreq_4  (icn_txreq_rn_2[3])
  );

// ------------------------------------------------------------------

  // request_note 3
  request_node #(
        .ADDR_WIDTH     (ADDR_WIDTH),
        .DATA_WIDTH     (DATA_WIDTH),
        .REQ_FLIT_WIDTH (REQ_FLIT_WIDTH),
        .RSP_FLIT_WIDTH (RSP_FLIT_WIDTH)
  ) rn3 (
        .pclk         (pclk),
        .preset_n     (preset_n),

        .paddr        (reqr3_paddr),
        .pprot        (reqr3_pprot),
        .pnse         (reqr3_pnse),
        .psel         (reqr3_psel),
        .penable      (reqr3_penable),
        .pwrite       (reqr3_pwrite),
        .pwdata       (reqr3_pwdata),
        .pstrb        (reqr3_pstrb),
        .pready       (reqr3_pready),
        .prdata       (reqr3_prdata),
        .pslverr      (reqr3_pslverr),
        .pwakeup      (reqr3_pwakeup),

        .cn_ready     (cn_ready_rn3),
        .rn_valid     (rn3_valid),

        .icn_rxrsp_1  (icn_txrsp_cn_1[2]),
        .icn_rxrsp_2  (icn_txrsp_cn_2[2]),
        .icn_rxrsp_3  (icn_txrsp_cn_3[2]),
        .icn_rxrsp_4  (icn_txrsp_cn_4[2]),

        .icn_txreq_1  (icn_txreq_rn_3[0]),
        .icn_txreq_2  (icn_txreq_rn_3[1]),
        .icn_txreq_3  (icn_txreq_rn_3[2]),
        .icn_txreq_4  (icn_txreq_rn_3[3])
  );

// ------------------------------------------------------------------

  // complete_note 1
  complete_node #(
        .ADDR_WIDTH     (ADDR_WIDTH),
        .DATA_WIDTH     (DATA_WIDTH),
        .REQ_FLIT_WIDTH (REQ_FLIT_WIDTH),
        .RSP_FLIT_WIDTH (RSP_FLIT_WIDTH)
  ) cn1 (
        .pclk         (pclk),
        .preset_n     (preset_n),

        .paddr        (comp1_paddr),
        .pprot        (comp1_pprot),
        .pnse         (comp1_pnse),
        .psel         (comp1_psel),
        .penable      (comp1_penable),
        .pwrite       (comp1_pwrite),
        .pwdata       (comp1_pwdata),
        .pstrb        (comp1_pstrb),
        .pready       (comp1_pready),
        .prdata       (comp1_prdata),
        .pslverr      (comp1_pslverr),
        .pwakeup      (comp1_pwakeup),

        .rn_valid     ({rn3_valid[0], rn2_valid[0], rn1_valid[0]}),
        .cn_ready     (cn1_ready),

        .icn_rxreq_1  (icn_txreq_rn_1[0]),
        .icn_rxreq_2  (icn_txreq_rn_2[0]),
        .icn_rxreq_3  (icn_txreq_rn_3[0]),

        .icn_txrsp_1  (icn_txrsp_cn_1[0]),
        .icn_txrsp_2  (icn_txrsp_cn_1[1]),
        .icn_txrsp_3  (icn_txrsp_cn_1[2])
  );

// ------------------------------------------------------------------

  // complete_note 2
  complete_node #(
        .ADDR_WIDTH     (ADDR_WIDTH),
        .DATA_WIDTH     (DATA_WIDTH),
        .REQ_FLIT_WIDTH (REQ_FLIT_WIDTH),
        .RSP_FLIT_WIDTH (RSP_FLIT_WIDTH)
  ) cn2 (
        .pclk         (pclk),
        .preset_n     (preset_n),

        .paddr        (comp2_paddr),
        .pprot        (comp2_pprot),
        .pnse         (comp2_pnse),
        .psel         (comp2_psel),
        .penable      (comp2_penable),
        .pwrite       (comp2_pwrite),
        .pwdata       (comp2_pwdata),
        .pstrb        (comp2_pstrb),
        .pready       (comp2_pready),
        .prdata       (comp2_prdata),
        .pslverr      (comp2_pslverr),
        .pwakeup      (comp2_pwakeup),

        .rn_valid     ({rn3_valid[1], rn2_valid[1], rn1_valid[1]}),
        .cn_ready     (cn2_ready),

        .icn_rxreq_1  (icn_txreq_rn_1[1]),
        .icn_rxreq_2  (icn_txreq_rn_2[1]),
        .icn_rxreq_3  (icn_txreq_rn_3[1]),

        .icn_txrsp_1  (icn_txrsp_cn_2[0]),
        .icn_txrsp_2  (icn_txrsp_cn_2[1]),
        .icn_txrsp_3  (icn_txrsp_cn_2[2])
  );

// ------------------------------------------------------------------

  // complete_note 3
  complete_node #(
        .ADDR_WIDTH     (ADDR_WIDTH),
        .DATA_WIDTH     (DATA_WIDTH),
        .REQ_FLIT_WIDTH (REQ_FLIT_WIDTH),
        .RSP_FLIT_WIDTH (RSP_FLIT_WIDTH)
  ) cn3 (
        .pclk         (pclk),
        .preset_n     (preset_n),

        .paddr        (comp3_paddr),
        .pprot        (comp3_pprot),
        .pnse         (comp3_pnse),
        .psel         (comp3_psel),
        .penable      (comp3_penable),
        .pwrite       (comp3_pwrite),
        .pwdata       (comp3_pwdata),
        .pstrb        (comp3_pstrb),
        .pready       (comp3_pready),
        .prdata       (comp3_prdata),
        .pslverr      (comp3_pslverr),
        .pwakeup      (comp3_pwakeup),

        .rn_valid     ({rn3_valid[2], rn2_valid[2], rn1_valid[2]}),
        .cn_ready     (cn3_ready),

        .icn_rxreq_1  (icn_txreq_rn_1[2]),
        .icn_rxreq_2  (icn_txreq_rn_2[2]),
        .icn_rxreq_3  (icn_txreq_rn_3[2]),

        .icn_txrsp_1  (icn_txrsp_cn_3[0]),
        .icn_txrsp_2  (icn_txrsp_cn_3[1]),
        .icn_txrsp_3  (icn_txrsp_cn_3[2])
  );

// ------------------------------------------------------------------

  // complete_note 4
  complete_node #(
        .ADDR_WIDTH     (ADDR_WIDTH),
        .DATA_WIDTH     (DATA_WIDTH),
        .REQ_FLIT_WIDTH (REQ_FLIT_WIDTH),
        .RSP_FLIT_WIDTH (RSP_FLIT_WIDTH)
  ) cn4 (
        .pclk         (pclk),
        .preset_n     (preset_n),

        .paddr        (comp4_paddr),
        .pprot        (comp4_pprot),
        .pnse         (comp4_pnse),
        .psel         (comp4_psel),
        .penable      (comp4_penable),
        .pwrite       (comp4_pwrite),
        .pwdata       (comp4_pwdata),
        .pstrb        (comp4_pstrb),
        .pready       (comp4_pready),
        .prdata       (comp4_prdata),
        .pslverr      (comp4_pslverr),
        .pwakeup      (comp4_pwakeup),

        .rn_valid     ({rn3_valid[3], rn2_valid[3], rn1_valid[3]}),
        .cn_ready     (cn4_ready),

        .icn_rxreq_1  (icn_txreq_rn_1[3]),
        .icn_rxreq_2  (icn_txreq_rn_2[3]),
        .icn_rxreq_3  (icn_txreq_rn_3[3]),

        .icn_txrsp_1  (icn_txrsp_cn_4[0]),
        .icn_txrsp_2  (icn_txrsp_cn_4[1]),
        .icn_txrsp_3  (icn_txrsp_cn_4[2])
  );
endmodule

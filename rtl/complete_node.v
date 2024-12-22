`include "define_file.sv"

module complete_node #(
      parameter ADDR_WIDTH      = `ADDR_WIDTH,
      parameter DATA_WIDTH      = `DATA_WIDTH,
      parameter REQ_FLIT_WIDTH  = `REQ_FLIT_WIDTH,
      parameter RSP_FLIT_WIDTH  = `RSP_FLIT_WIDTH
) (
      // system signals
      input                         pclk,
      input                         preset_n,

      // APB bus
      output  [ADDR_WIDTH-1:0]      paddr,
      output  [2:0]                 pprot,
      output                        pnse,
      output                        psel,
      output                        penable,
      output                        pwrite,
      output  [DATA_WIDTH-1:0]      pwdata,
      output  [DATA_WIDTH/8-1:0]    pstrb,
      input                         pready,
      input   [DATA_WIDTH-1:0]      prdata,
      input                         pslverr,
      output                        pwakeup,
      
      // RN-CN handshake signals    
      input   [2:0]                 rn_valid,
      output  [2:0]                 cn_ready,

      // ICN bus
      input   [REQ_FLIT_WIDTH-1:0]  icn_rxreq_1,
      input   [REQ_FLIT_WIDTH-1:0]  icn_rxreq_2,
      input   [REQ_FLIT_WIDTH-1:0]  icn_rxreq_3,

      output  [RSP_FLIT_WIDTH-1:0]  icn_txrsp_1,
      output  [RSP_FLIT_WIDTH-1:0]  icn_txrsp_2,
      output  [RSP_FLIT_WIDTH-1:0]  icn_txrsp_3
);

  wire  [1:0]                 crossbar_sel;

  arbitrator arb (
        .clk          (pclk),
        .rst_n        (preset_n),

        .rn_valid     (rn_valid),
        .icn_psel     ({icn_rxreq_3[`PSEL_BIT], icn_rxreq_2[`PSEL_BIT], icn_rxreq_1[`PSEL_BIT]}),

        .cn_ready     (cn_ready),
        .crossbar_sel (crossbar_sel)
  );

// ------------------------------------------------------------------

  cn_crossbar #(
        .DATA_WIDTH     (DATA_WIDTH),
        .REQ_FLIT_WIDTH (REQ_FLIT_WIDTH),
        .RSP_FLIT_WIDTH (RSP_FLIT_WIDTH)
  ) cn_cross (
        .clk          (pclk),
        .rst_n        (preset_n),
        .sel          (crossbar_sel),
                       
        .comp_rsp     ({pready, prdata, pslverr}),
        .icn_txrsp_1  (icn_txrsp_1),
        .icn_txrsp_2  (icn_txrsp_2),
        .icn_txrsp_3  (icn_txrsp_3),
                       
        .icn_rxreq_1  (icn_rxreq_1),
        .icn_rxreq_2  (icn_rxreq_2),
        .icn_rxreq_3  (icn_rxreq_3),
        .comp_req     ({paddr, pprot, pnse, psel, penable, pwrite, pwdata, pstrb, pwakeup})
  );
endmodule

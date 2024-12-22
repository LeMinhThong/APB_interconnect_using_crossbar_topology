`include "define_file.sv"

module request_node #(
      parameter ADDR_WIDTH      = `ADDR_WIDTH,
      parameter DATA_WIDTH      = `DATA_WIDTH,
      parameter REQ_FLIT_WIDTH  = `REQ_FLIT_WIDTH,
      parameter RSP_FLIT_WIDTH  = `RSP_FLIT_WIDTH
) (
      // system signals
      input                         pclk,
      input                         preset_n,

      // APB bus
      input   [ADDR_WIDTH-1:0]      paddr,
      input   [2:0]                 pprot,
      input                         pnse,
      input                         psel,
      input                         penable,
      input                         pwrite,
      input   [DATA_WIDTH-1:0]      pwdata,
      input   [DATA_WIDTH/8-1:0]    pstrb,
      output                        pready,
      output  [DATA_WIDTH-1:0]      prdata,
      output                        pslverr,
      input                         pwakeup,

      // RN-CN handshake signals    
      input                         cn_ready,
      output  [3:0]                 rn_valid,

      // ICN bus
      input   [RSP_FLIT_WIDTH-1:0]  icn_rxrsp_1,
      input   [RSP_FLIT_WIDTH-1:0]  icn_rxrsp_2,
      input   [RSP_FLIT_WIDTH-1:0]  icn_rxrsp_3,
      input   [RSP_FLIT_WIDTH-1:0]  icn_rxrsp_4,

      output  [REQ_FLIT_WIDTH-1:0]  icn_txreq_1,
      output  [REQ_FLIT_WIDTH-1:0]  icn_txreq_2,
      output  [REQ_FLIT_WIDTH-1:0]  icn_txreq_3,
      output  [REQ_FLIT_WIDTH-1:0]  icn_txreq_4
);

  wire [REQ_FLIT_WIDTH-1:0] bf_out;
  wire [2:0]                crossbar_sel;

// ------------------------------------------------------------------

  buffer #(
        .REQ_FLIT_WIDTH (REQ_FLIT_WIDTH)
  ) bf (
        .clk      (pclk),
        .rst_n    (preset_n),

        .psel     (psel),
        .penable  (penable),
        .cn_ready (cn_ready),
        .data_in  ({paddr, pprot, pnse, psel, penable, pwrite, pwdata, pstrb, pwakeup}),

        .data_out (bf_out)
  );

// ------------------------------------------------------------------

  routing_logic #(
        .ADDR_WIDTH (ADDR_WIDTH)
  ) rl (
        .clk          (pclk),
        .rst_n        (preset_n),

        .psel         (psel),
        .comp_id      (paddr[ADDR_WIDTH-1 -: 4]),
        .cn_ready     (cn_ready),

        .rn_valid     (rn_valid),
        .crossbar_sel (crossbar_sel)
  );

// ------------------------------------------------------------------

  rn_crossbar #(
        .REQ_FLIT_WIDTH (REQ_FLIT_WIDTH),
        .RSP_FLIT_WIDTH (RSP_FLIT_WIDTH)
  ) rn_cross (
        .clk          (pclk),
        .rst_n        (preset_n),
        
        .sel          (crossbar_sel),
        
        .bf_out       (bf_out),
        .icn_txreq_1  (icn_txreq_1),
        .icn_txreq_2  (icn_txreq_2),
        .icn_txreq_3  (icn_txreq_3),
        .icn_txreq_4  (icn_txreq_4),
                    
        .icn_rxrsp_1  (icn_rxrsp_1),
        .icn_rxrsp_2  (icn_rxrsp_2),
        .icn_rxrsp_3  (icn_rxrsp_3),
        .icn_rxrsp_4  (icn_rxrsp_4),
        .reqr_rsp     ({pready, prdata, pslverr})
  );
endmodule

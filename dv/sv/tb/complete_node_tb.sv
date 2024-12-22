module complete_node_tb ();
  parameter ADDR_WIDTH      = 64;
  parameter DATA_WIDTH      = 32;
  parameter REQ_FLIT_WIDTH  = 8 + ADDR_WIDTH + DATA_WIDTH + DATA_WIDTH/8;
  parameter RSP_FLIT_WIDTH  = 2 + DATA_WIDTH;

  reg                         pclk;
  reg                         preset_n;

  // APB bus
  wire  [ADDR_WIDTH-1:0]      paddr;
  wire  [2:0]                 pprot;
  wire                        pnse;
  wire                        psel;
  wire                        penable;
  wire                        write;
  wire  [DATA_WIDTH-1:0]      pwdata;
  wire  [DATA_WIDTH/8-1:0]    pstrb;
  reg                         pready;
  reg   [DATA_WIDTH-1:0]      prdata;
  reg                         pslverr;
  wire                        pwakeup;

  reg   [2:0]                 rn_valid;
  wire  [2:0]                 cn_ready;

  reg   [REQ_FLIT_WIDTH-1:0]  icn_rxreq_1;
  reg   [REQ_FLIT_WIDTH-1:0]  icn_rxreq_2;
  reg   [REQ_FLIT_WIDTH-1:0]  icn_rxreq_3;

  wire  [RSP_FLIT_WIDTH-1:0]  icn_txrsp_1;
  wire  [RSP_FLIT_WIDTH-1:0]  icn_txrsp_2;
  wire  [RSP_FLIT_WIDTH-1:0]  icn_txrsp_3;
                          
  complete_node #(
        .ADDR_WIDTH     (ADDR_WIDTH),
        .DATA_WIDTH     (DATA_WIDTH),
        .REQ_FLIT_WIDTH (REQ_FLIT_WIDTH),
        .RSP_FLIT_WIDTH (RSP_FLIT_WIDTH)
  ) cn (
        .pclk         (pclk),
        .preset_n     (preset_n),
        
        .paddr        (paddr),
        .pprot        (pprot),
        .pnse         (pnse),
        .psel         (psel),
        .penable      (penable),
        .pwrite       (write),
        .pwdata       (pwdata),
        .pstrb        (pstrb),
        .pready       (pready),
        .prdata       (prdata),
        .pslverr      (pslverr),
        .pwakeup      (pwakeup),
        
        .cn_ready     (cn_ready),
        .rn_valid     (rn_valid),
        
        .icn_txrsp_1  (icn_txrsp_1),
        .icn_txrsp_2  (icn_txrsp_2),
        .icn_txrsp_3  (icn_txrsp_3),
        
        .icn_rxreq_1  (icn_rxreq_1),
        .icn_rxreq_2  (icn_rxreq_2),
        .icn_rxreq_3  (icn_rxreq_3)
  );

  always #5 pclk = ~pclk;

  initial begin
    pclk      = 1'b0;
    preset_n  = 1'b0;
    repeat (3) @(posedge pclk);
    preset_n  = 1'b1;
  end

  initial begin
    @(posedge preset_n);
    $display("@ %0t start test", $time);
    $display("@ %0t complete test", $time);
    $finish;
  end
endmodule

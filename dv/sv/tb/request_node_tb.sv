module request_node_tb ();
  parameter ADDR_WIDTH      = 64;
  parameter DATA_WIDTH      = 32;
  parameter REQ_FLIT_WIDTH  = 8 + ADDR_WIDTH + DATA_WIDTH + DATA_WIDTH/8;
  parameter RSP_FLIT_WIDTH  = 2 + DATA_WIDTH;

  reg                         pclk;
  reg                         preset_n;

  // APB bus
  reg   [ADDR_WIDTH-1:0]      paddr;
  reg   [2:0]                 pprot;
  reg                         pnse;
  reg                         psel;
  reg                         penable;
  reg                         write;
  reg   [DATA_WIDTH-1:0]      pwdata;
  reg   [DATA_WIDTH/8-1:0]    pstrb;
  wire                        pready;
  wire  [DATA_WIDTH-1:0]      prdata;
  wire                        pslverr;
  reg                         pwakeup;

  reg                         cn_ready;
  wire  [3:0]                 rn_valid;

  reg   [RSP_FLIT_WIDTH-1:0]  icn_rxrsp_1;
  reg   [RSP_FLIT_WIDTH-1:0]  icn_rxrsp_2;
  reg   [RSP_FLIT_WIDTH-1:0]  icn_rxrsp_3;
  reg   [RSP_FLIT_WIDTH-1:0]  icn_rxrsp_4;
                          
  wire  [REQ_FLIT_WIDTH-1:0]  icn_txreq_1;
  wire  [REQ_FLIT_WIDTH-1:0]  icn_txreq_2;
  wire  [REQ_FLIT_WIDTH-1:0]  icn_txreq_3;
  wire  [REQ_FLIT_WIDTH-1:0]  icn_txreq_4;

  request_node #(
        .ADDR_WIDTH     (ADDR_WIDTH),
        .DATA_WIDTH     (DATA_WIDTH),
        .REQ_FLIT_WIDTH (REQ_FLIT_WIDTH),
        .RSP_FLIT_WIDTH (RSP_FLIT_WIDTH)
  ) rn (
        .pclk         (pclk),
        .preset_n     (reset_n),
        
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
        
        .icn_rxrsp_1  (icn_rxrsp_1),
        .icn_rxrsp_2  (icn_rxrsp_2),
        .icn_rxrsp_3  (icn_rxrsp_3),
        .icn_rxrsp_4  (icn_rxrsp_4),
        
        .icn_txreq_1  (icn_txreq_1),
        .icn_txreq_2  (icn_txreq_2),
        .icn_txreq_3  (icn_txreq_3),
        .icn_txreq_4  (icn_txreq_4)
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
    #10;
    $display("@ %0t complete test", $time);
    $finish;
  end
endmodule

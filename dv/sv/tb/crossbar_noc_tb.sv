module crossbar_noc_tb();
  parameter ADDR_WIDTH = 64;
  parameter DATA_WIDTH = 32;

// ------------------------------------------------------------------

  // system signals
  reg                         pclk;
  reg                         preset_n;

  // ----------------------------------------

  // APB bus requester 1
  wire  [ADDR_WIDTH-1:0]      reqr1_paddr;
  wire  [2:0]                 reqr1_pprot;
  wire                        reqr1_pnse;
  wire                        reqr1_psel;
  wire                        reqr1_penable;
  wire                        reqr1_pwrite;
  wire  [DATA_WIDTH-1:0]      reqr1_pwdata;
  wire  [DATA_WIDTH/8-1:0]    reqr1_pstrb;
  wire                        reqr1_pready;
  wire  [DATA_WIDTH-1:0]      reqr1_prdata;
  wire                        reqr1_pslverr;
  wire                        reqr1_pwakeup;

  // APB bus requester 2
  wire  [ADDR_WIDTH-1:0]      reqr2_paddr;
  wire  [2:0]                 reqr2_pprot;
  wire                        reqr2_pnse;
  wire                        reqr2_psel;
  wire                        reqr2_penable;
  wire                        reqr2_pwrite;
  wire  [DATA_WIDTH-1:0]      reqr2_pwdata;
  wire  [DATA_WIDTH/8-1:0]    reqr2_pstrb;
  wire                        reqr2_pready;
  wire  [DATA_WIDTH-1:0]      reqr2_prdata;
  wire                        reqr2_pslverr;
  wire                        reqr2_pwakeup;

  // APB bus requester 3
  wire  [ADDR_WIDTH-1:0]      reqr3_paddr;
  wire  [2:0]                 reqr3_pprot;
  wire                        reqr3_pnse;
  wire                        reqr3_psel;
  wire                        reqr3_penable;
  wire                        reqr3_pwrite;
  wire  [DATA_WIDTH-1:0]      reqr3_pwdata;
  wire  [DATA_WIDTH/8-1:0]    reqr3_pstrb;
  wire                        reqr3_pready;
  wire  [DATA_WIDTH-1:0]      reqr3_prdata;
  wire                        reqr3_pslverr;
  wire                        reqr3_pwakeup;

  // ----------------------------------------

  // APB bus completer 1
  wire  [ADDR_WIDTH-1:0]      comp1_paddr;
  wire  [2:0]                 comp1_pprot;
  wire                        comp1_pnse;
  wire                        comp1_psel;
  wire                        comp1_penable;
  wire                        comp1_pwrite;
  wire  [DATA_WIDTH-1:0]      comp1_pwdata;
  wire  [DATA_WIDTH/8-1:0]    comp1_pstrb;
  wire                        comp1_pready;
  wire  [DATA_WIDTH-1:0]      comp1_prdata;
  wire                        comp1_pslverr;
  wire                        comp1_pwakeup;

  // APB bus completer 2
  wire  [ADDR_WIDTH-1:0]      comp2_paddr;
  wire  [2:0]                 comp2_pprot;
  wire                        comp2_pnse;
  wire                        comp2_psel;
  wire                        comp2_penable;
  wire                        comp2_pwrite;
  wire  [DATA_WIDTH-1:0]      comp2_pwdata;
  wire  [DATA_WIDTH/8-1:0]    comp2_pstrb;
  wire                        comp2_pready;
  wire  [DATA_WIDTH-1:0]      comp2_prdata;
  wire                        comp2_pslverr;
  wire                        comp2_pwakeup;

  // APB bus completer 3
  wire  [ADDR_WIDTH-1:0]      comp3_paddr;
  wire  [2:0]                 comp3_pprot;
  wire                        comp3_pnse;
  wire                        comp3_psel;
  wire                        comp3_penable;
  wire                        comp3_pwrite;
  wire  [DATA_WIDTH-1:0]      comp3_pwdata;
  wire  [DATA_WIDTH/8-1:0]    comp3_pstrb;
  wire                        comp3_pready;
  wire  [DATA_WIDTH-1:0]      comp3_prdata;
  wire                        comp3_pslverr;
  wire                        comp3_pwakeup;

  // APB bus completer 4
  wire  [ADDR_WIDTH-1:0]      comp4_paddr;
  wire  [2:0]                 comp4_pprot;
  wire                        comp4_pnse;
  wire                        comp4_psel;
  wire                        comp4_penable;
  wire                        comp4_pwrite;
  wire  [DATA_WIDTH-1:0]      comp4_pwdata;
  wire  [DATA_WIDTH/8-1:0]    comp4_pstrb;
  wire                        comp4_pready;
  wire  [DATA_WIDTH-1:0]      comp4_prdata;
  wire                        comp4_pslverr;
  wire                        comp4_pwakeup;

// ------------------------------------------------------------------

  requester_model #(
        .ADDR_WIDTH (ADDR_WIDTH),
        .DATA_WIDTH (DATA_WIDTH)
  ) requester_1 (
        .pclk     (pclk),
        .preset_n (preset_n),

        .paddr    (reqr1_paddr),
        .pprot    (reqr1_pprot),
        .pnse     (reqr1_pnse),
        .psel     (reqr1_psel),
        .penable  (reqr1_penable),
        .pwrite   (reqr1_pwrite),
        .pwdata   (reqr1_pwdata),
        .pstrb    (reqr1_pstrb),
        .pready   (reqr1_pready),
        .prdata   (reqr1_prdata),
        .pslverr  (reqr1_pslverr),
        .pwakeup  (reqr1_pwakeup)
);

// ------------------------------------------------------------------

  requester_model #(
        .ADDR_WIDTH (ADDR_WIDTH),
        .DATA_WIDTH (DATA_WIDTH)
  ) requester_2 (
        .pclk     (pclk),
        .preset_n (preset_n),

        .paddr    (reqr2_paddr),
        .pprot    (reqr2_pprot),
        .pnse     (reqr2_pnse),
        .psel     (reqr2_psel),
        .penable  (reqr2_penable),
        .pwrite   (reqr2_pwrite),
        .pwdata   (reqr2_pwdata),
        .pstrb    (reqr2_pstrb),
        .pready   (reqr2_pready),
        .prdata   (reqr2_prdata),
        .pslverr  (reqr2_pslverr),
        .pwakeup  (reqr2_pwakeup)
);

// ------------------------------------------------------------------

  requester_model #(
        .ADDR_WIDTH (ADDR_WIDTH),
        .DATA_WIDTH (DATA_WIDTH)
  ) requester_3 (
        .pclk     (pclk),
        .preset_n (preset_n),

        .paddr    (reqr3_paddr),
        .pprot    (reqr3_pprot),
        .pnse     (reqr3_pnse),
        .psel     (reqr3_psel),
        .penable  (reqr3_penable),
        .pwrite   (reqr3_pwrite),
        .pwdata   (reqr3_pwdata),
        .pstrb    (reqr3_pstrb),
        .pready   (reqr3_pready),
        .prdata   (reqr3_prdata),
        .pslverr  (reqr3_pslverr),
        .pwakeup  (reqr3_pwakeup)
);

// ------------------------------------------------------------------

  completer_model #(
        .ADDR_WIDTH (ADDR_WIDTH),
        .DATA_WIDTH (DATA_WIDTH)
  ) completer_1 (
        .pclk     (pclk),
        .preset_n (preset_n),
  
        .paddr    (comp1_paddr),
        .pprot    (comp1_pprot),
        .pnse     (comp1_pnse),
        .psel     (comp1_psel),
        .penable  (comp1_penable),
        .pwrite   (comp1_pwrite),
        .pwdata   (comp1_pwdata),
        .pstrb    (comp1_pstrb),
        .pready   (comp1_pready),
        .prdata   (comp1_prdata),
        .pslverr  (comp1_pslverr),
        .pwakeup  (comp1_pwakeup)
  );

// ------------------------------------------------------------------

  completer_model #(
        .ADDR_WIDTH (ADDR_WIDTH),
        .DATA_WIDTH (DATA_WIDTH)
  ) completer_2 (
        .pclk     (pclk),
        .preset_n (preset_n),
  
        .paddr    (comp2_paddr),
        .pprot    (comp2_pprot),
        .pnse     (comp2_pnse),
        .psel     (comp2_psel),
        .penable  (comp2_penable),
        .pwrite   (comp2_pwrite),
        .pwdata   (comp2_pwdata),
        .pstrb    (comp2_pstrb),
        .pready   (comp2_pready),
        .prdata   (comp2_prdata),
        .pslverr  (comp2_pslverr),
        .pwakeup  (comp2_pwakeup)
  );

// ------------------------------------------------------------------

  completer_model #(
        .ADDR_WIDTH (ADDR_WIDTH),
        .DATA_WIDTH (DATA_WIDTH)
  ) completer_3 (
        .pclk     (pclk),
        .preset_n (preset_n),
  
        .paddr    (comp3_paddr),
        .pprot    (comp3_pprot),
        .pnse     (comp3_pnse),
        .psel     (comp3_psel),
        .penable  (comp3_penable),
        .pwrite   (comp3_pwrite),
        .pwdata   (comp3_pwdata),
        .pstrb    (comp3_pstrb),
        .pready   (comp3_pready),
        .prdata   (comp3_prdata),
        .pslverr  (comp3_pslverr),
        .pwakeup  (comp3_pwakeup)
  );

// ------------------------------------------------------------------

  completer_model #(
        .ADDR_WIDTH (ADDR_WIDTH),
        .DATA_WIDTH (DATA_WIDTH)
  ) completer_4 (
        .pclk     (pclk),
        .preset_n (preset_n),
  
        .paddr    (comp4_paddr),
        .pprot    (comp4_pprot),
        .pnse     (comp4_pnse),
        .psel     (comp4_psel),
        .penable  (comp4_penable),
        .pwrite   (comp4_pwrite),
        .pwdata   (comp4_pwdata),
        .pstrb    (comp4_pstrb),
        .pready   (comp4_pready),
        .prdata   (comp4_prdata),
        .pslverr  (comp4_pslverr),
        .pwakeup  (comp4_pwakeup)
  );

// ------------------------------------------------------------------

  crossbar_noc #(
        .ADDR_WIDTH (ADDR_WIDTH),
        .DATA_WIDTH (DATA_WIDTH)
  ) noc (
        .pclk           (pclk),
        .preset_n       (preset_n),

        .reqr1_paddr    (reqr1_paddr),
        .reqr1_pprot    (reqr1_pprot),
        .reqr1_pnse     (reqr1_pnse),
        .reqr1_psel     (reqr1_psel),
        .reqr1_penable  (reqr1_penable),
        .reqr1_pwrite   (reqr1_pwrite),
        .reqr1_pwdata   (reqr1_pwdata),
        .reqr1_pstrb    (reqr1_pstrb),
        .reqr1_pready   (reqr1_pready),
        .reqr1_prdata   (reqr1_prdata),
        .reqr1_pslverr  (reqr1_pslverr),
        .reqr1_pwakeup  (reqr1_pwakeup),
 
        .reqr2_paddr    (reqr2_paddr),
        .reqr2_pprot    (reqr2_pprot),
        .reqr2_pnse     (reqr2_pnse),
        .reqr2_psel     (reqr2_psel),
        .reqr2_penable  (reqr2_penable),
        .reqr2_pwrite   (reqr2_pwrite),
        .reqr2_pwdata   (reqr2_pwdata),
        .reqr2_pstrb    (reqr2_pstrb),
        .reqr2_pready   (reqr2_pready),
        .reqr2_prdata   (reqr2_prdata),
        .reqr2_pslverr  (reqr2_pslverr),
        .reqr2_pwakeup  (reqr2_pwakeup),

        .reqr3_paddr    (reqr3_paddr),
        .reqr3_pprot    (reqr3_pprot),
        .reqr3_pnse     (reqr3_pnse),
        .reqr3_psel     (reqr3_psel),
        .reqr3_penable  (reqr3_penable),
        .reqr3_pwrite   (reqr3_pwrite),
        .reqr3_pwdata   (reqr3_pwdata),
        .reqr3_pstrb    (reqr3_pstrb),
        .reqr3_pready   (reqr3_pready),
        .reqr3_prdata   (reqr3_prdata),
        .reqr3_pslverr  (reqr3_pslverr),
        .reqr3_pwakeup  (reqr3_pwakeup),

        .comp1_paddr    (comp1_paddr),
        .comp1_pprot    (comp1_pprot),
        .comp1_pnse     (comp1_pnse),
        .comp1_psel     (comp1_psel),
        .comp1_penable  (comp1_penable),
        .comp1_pwrite   (comp1_pwrite),
        .comp1_pwdata   (comp1_pwdata),
        .comp1_pstrb    (comp1_pstrb),
        .comp1_pready   (comp1_pready),
        .comp1_prdata   (comp1_prdata),
        .comp1_pslverr  (comp1_pslverr),
        .comp1_pwakeup  (comp1_pwakeup),

        .comp2_paddr    (comp2_paddr),
        .comp2_pprot    (comp2_pprot),
        .comp2_pnse     (comp2_pnse),
        .comp2_psel     (comp2_psel),
        .comp2_penable  (comp2_penable),
        .comp2_pwrite   (comp2_pwrite),
        .comp2_pwdata   (comp2_pwdata),
        .comp2_pstrb    (comp2_pstrb),
        .comp2_pready   (comp2_pready),
        .comp2_prdata   (comp2_prdata),
        .comp2_pslverr  (comp2_pslverr),
        .comp2_pwakeup  (comp2_pwakeup),

        .comp3_paddr    (comp3_paddr),
        .comp3_pprot    (comp3_pprot),
        .comp3_pnse     (comp3_pnse),
        .comp3_psel     (comp3_psel),
        .comp3_penable  (comp3_penable),
        .comp3_pwrite   (comp3_pwrite),
        .comp3_pwdata   (comp3_pwdata),
        .comp3_pstrb    (comp3_pstrb),
        .comp3_pready   (comp3_pready),
        .comp3_prdata   (comp3_prdata),
        .comp3_pslverr  (comp3_pslverr),
        .comp3_pwakeup  (comp3_pwakeup),

        .comp4_paddr    (comp4_paddr),
        .comp4_pprot    (comp4_pprot),
        .comp4_pnse     (comp4_pnse),
        .comp4_psel     (comp4_psel),
        .comp4_penable  (comp4_penable),
        .comp4_pwrite   (comp4_pwrite),
        .comp4_pwdata   (comp4_pwdata),
        .comp4_pstrb    (comp4_pstrb),
        .comp4_pready   (comp4_pready),
        .comp4_prdata   (comp4_prdata),
        .comp4_pslverr  (comp4_pslverr),
        .comp4_pwakeup  (comp4_pwakeup)
  );

// ------------------------------------------------------------------

  initial begin
    #5;
    forever #5 pclk = ~pclk;
  end

  initial begin
    pclk      = 1'b0;
    preset_n  = 1'b1;
    repeat (2) @(posedge pclk);
    preset_n  = 1'b0;
    repeat (5) @(posedge pclk);
    preset_n  = 1'b1;
  end

// ------------------------------------------------------------------

  task write(logic [3:0] reqr_id, logic [3:0] comp_id, logic [ADDR_WIDTH-4-1:0] addr, logic [DATA_WIDTH-1:0] data);
    case(reqr_id)
      4'h0:   requester_1.apb_write({comp_id, addr}, data);
      4'h1:   requester_2.apb_write({comp_id, addr}, data);
      4'h2:   requester_3.apb_write({comp_id, addr}, data);
      default:
            begin
              $display("cannot identify reqr_id");
              $finish;
            end
    endcase // reqr_id
  endtask

// ------------------------------------------------------------------

  task read(int reqr_id, logic [3:0] comp_id, logic [ADDR_WIDTH-4-1:0] addr);
    case(reqr_id)
      4'h0:  requester_1.apb_read({comp_id, addr});
      4'h1:  requester_2.apb_read({comp_id, addr});
      4'h2:  requester_3.apb_read({comp_id, addr});
      default:
            begin
              $display("cannot identify reqr_id");
              $finish;
            end
    endcase // reqr_id
  endtask

// ------------------------------------------------------------------

  task display_request( logic [3:0]               reqr_id,
                        logic [3:0]               comp_id,
                        bit                       wr1_rd0,
                        logic [ADDR_WIDTH-4-1:0]  addr,
                        logic [DATA_WIDTH-1:0]    data
                      );
    string req_type;
    if(wr1_rd0)
      req_type  = "WRITE_REQUEST";
    else begin
      req_type  = "READ_REQUEST";
      data      = {DATA_WIDTH{1'b0}};
    end

      $display(
        $sformatf("%0t: ", $time),
        $sformatf("[%s]: ", req_type),
        $sformatf("reqr_id: %0d, ", reqr_id),
        $sformatf("comp_id: %0d, ", comp_id),
        $sformatf("addr: %0h, ", {comp_id, addr}),
        $sformatf("data: %0h", data)
      );
  endtask
endmodule

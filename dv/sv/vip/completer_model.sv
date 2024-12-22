`include "define_file.sv"

module completer_model #(
      parameter ADDR_WIDTH  = `ADDR_WIDTH,
      parameter DATA_WIDTH  = `DATA_WIDTH
) (
      input                             pclk,
      input                             preset_n,

      input       [ADDR_WIDTH-1:0]      paddr,
      input       [2:0]                 pprot,
      input                             pnse,
      input                             psel,
      input                             penable,
      input                             pwrite,
      input       [DATA_WIDTH-1:0]      pwdata,
      input       [DATA_WIDTH/8-1:0]    pstrb,
      output  reg                       pready,
      output  reg [DATA_WIDTH-1:0]      prdata,
      output  reg                       pslverr,
      input                             pwakeup
);

// ------------------------------------------------------------------

  always @(posedge pclk) begin
    if(psel == 1'b1) begin
      if(pwrite == 1'b1) begin // write transaction
        pready  = 1'b1;
        prdata  = {DATA_WIDTH{1'b0}};
        pslverr = 1'b0;

        @(posedge pclk);
        pready  = 1'b0;
        prdata  = {DATA_WIDTH{1'b0}};
        pslverr = 1'b0;
      end
      else begin // read transaction
        pready  = 1'b1;
        prdata  = {DATA_WIDTH{1'b1}};
        pslverr = 1'b0;

        @(posedge pclk);
        pready  = 1'b0;
        prdata  = {DATA_WIDTH{1'b0}};
        pslverr = 1'b0;
      end
    end
    else begin // IDLE
      pready  = 1'b0;
      prdata  = {DATA_WIDTH{1'b0}};
      pslverr = 1'b0;
    end
  end
endmodule

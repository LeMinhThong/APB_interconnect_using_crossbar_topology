`include "define_file.sv"

module requester_model #(
      parameter ADDR_WIDTH  = `ADDR_WIDTH,
      parameter DATA_WIDTH  = `DATA_WIDTH
) (
      input                             pclk,
      input                             preset_n,

      output  reg [ADDR_WIDTH-1:0]      paddr,
      output  reg [2:0]                 pprot,
      output  reg                       pnse,
      output  reg                       psel,
      output  reg                       penable,
      output  reg                       pwrite,
      output  reg [DATA_WIDTH-1:0]      pwdata,
      output  reg [DATA_WIDTH/8-1:0]    pstrb,
      input                             pready,
      input       [DATA_WIDTH-1:0]      prdata,
      input                             pslverr,
      output  reg                       pwakeup
);

// ------------------------------------------------------------------
  
  task apb_write (input [ADDR_WIDTH-1:0] addr, input [DATA_WIDTH-1:0] data);
    #1;
    paddr   = addr;
    pprot   = 3'b000;
    pnse    = 1'b0;
    psel    = 1'b1;
    penable = 1'b0;
    pwrite  = 1'b1;
    pwdata  = data;
    pstrb   = {DATA_WIDTH/8{1'b1}};
    pwakeup = 1'b1;
  
    @(posedge pclk);
    #1;
    penable = 1'b1;
    
    @(posedge pclk);
    #1;
    while(!pready) @(posedge pclk);

    paddr   = {ADDR_WIDTH{1'b0}};
    pprot   = 3'b000;
    pnse    = 1'b0;
    psel    = 1'b0;
    penable = 1'b0;
    pwrite  = 1'b0;
    pwdata  = {DATA_WIDTH{1'b0}};
    pstrb   = {DATA_WIDTH/8{1'b0}};
    pwakeup = 1'b0;
  endtask

// ------------------------------------------------------------------
  
  task apb_read (input [ADDR_WIDTH-1:0] addr);
    #1;
    paddr   = addr;
    pprot   = 3'b000;
    pnse    = 1'b0;
    psel    = 1'b1;
    penable = 1'b0;
    pwrite  = 1'b0;
    pwdata  = {DATA_WIDTH{1'b0}};
    pstrb   = {DATA_WIDTH/8{1'b0}};
    pwakeup = 1'b1;

    @(posedge pclk);
    #1;
    penable = 1'b1;

    @(posedge pclk);
    #1;
    while(!pready) @(posedge pclk);

    paddr   = {ADDR_WIDTH{1'b0}};
    psel    = 1'b0;
    pprot   = 3'b000;
    pnse    = 1'b0;
    penable = 1'b0;
    pwrite  = 1'b0;
    pwdata  = {DATA_WIDTH{1'b0}};
    pstrb   = {DATA_WIDTH/8{1'b0}};
    pwakeup = 1'b0;
  endtask
endmodule

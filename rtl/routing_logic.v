`include "define_file.sv"

module routing_logic #(
      parameter ADDR_WIDTH = `ADDR_WIDTH
) (
      input                         clk,
      input                         rst_n,

      input                         psel,
      input       [3:0]             comp_id,
      input                         cn_ready,

      output  reg [3:0]             rn_valid,
      output  reg [2:0]             crossbar_sel
);

  wire rst_rn_valid_loc;
  wire rst_sel_loc;

// ------------------------------------------------------------------

  assign rst_rn_valid_loc = !rst_n || !psel;

  always @(posedge clk) begin
    if(rst_rn_valid_loc) begin
      rn_valid <= 4'b0000;
    end
    else begin
      case(comp_id)
        4'b0000: rn_valid <= 4'b0001;
        4'b0001: rn_valid <= 4'b0010;
        4'b0010: rn_valid <= 4'b0100;
        4'b0011: rn_valid <= 4'b1000;
        default: rn_valid <= 4'b0000;
      endcase
    end
  end

// ------------------------------------------------------------------

  assign rst_sel_loc = !rst_n || !psel ||!cn_ready;

  always @(posedge clk) begin
    if(rst_sel_loc) begin
      crossbar_sel <= 3'b000;
    end
    else begin
      case(comp_id)
        4'b0000: crossbar_sel = 3'b001;
        4'b0001: crossbar_sel = 3'b010;
        4'b0010: crossbar_sel = 3'b011;
        4'b0011: crossbar_sel = 3'b100;
        default: crossbar_sel = 3'b000;
      endcase
    end
  end
endmodule

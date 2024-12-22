`include "define_file.sv"

module rn_crossbar #(
      parameter REQ_FLIT_WIDTH  = `REQ_FLIT_WIDTH,
      parameter RSP_FLIT_WIDTH  = `RSP_FLIT_WIDTH
) (
      input                             clk,
      input                             rst_n,

      input       [2:0]                 sel,

      input   reg [REQ_FLIT_WIDTH-1:0]  bf_out,
      output  reg [REQ_FLIT_WIDTH-1:0]  icn_txreq_1,
      output  reg [REQ_FLIT_WIDTH-1:0]  icn_txreq_2,
      output  reg [REQ_FLIT_WIDTH-1:0]  icn_txreq_3,
      output  reg [REQ_FLIT_WIDTH-1:0]  icn_txreq_4,

      input   reg [RSP_FLIT_WIDTH-1:0]  icn_rxrsp_1,
      input   reg [RSP_FLIT_WIDTH-1:0]  icn_rxrsp_2,
      input   reg [RSP_FLIT_WIDTH-1:0]  icn_rxrsp_3,
      input   reg [RSP_FLIT_WIDTH-1:0]  icn_rxrsp_4,
      output  reg [RSP_FLIT_WIDTH-1:0]  reqr_rsp
);

  always @(posedge clk) begin // reqr_rsp
    if(!rst_n) begin
      reqr_rsp <= {RSP_FLIT_WIDTH{1'b0}};
    end
    else begin
      case(sel)
        3'b001:   reqr_rsp <= icn_rxrsp_1;
        3'b010:   reqr_rsp <= icn_rxrsp_2;
        3'b011:   reqr_rsp <= icn_rxrsp_3;
        3'b100:   reqr_rsp <= icn_rxrsp_4;
        default:  reqr_rsp <= {RSP_FLIT_WIDTH{1'b0}};
      endcase //sel
    end
  end

// ------------------------------------------------------------------

  always @(posedge clk) begin
    if(!rst_n) begin
      icn_txreq_1 <= {REQ_FLIT_WIDTH{1'b0}};
      icn_txreq_2 <= {REQ_FLIT_WIDTH{1'b0}};
      icn_txreq_3 <= {REQ_FLIT_WIDTH{1'b0}};
      icn_txreq_4 <= {REQ_FLIT_WIDTH{1'b0}};
    end
    else begin
      case(sel)
        3'b001:
              begin
                icn_txreq_1 <= bf_out;
                icn_txreq_2 <= {REQ_FLIT_WIDTH{1'b0}};
                icn_txreq_3 <= {REQ_FLIT_WIDTH{1'b0}};
                icn_txreq_4 <= {REQ_FLIT_WIDTH{1'b0}};
              end
        3'b010:
              begin
                icn_txreq_1 <= {REQ_FLIT_WIDTH{1'b0}};
                icn_txreq_2 <= bf_out;
                icn_txreq_3 <= {REQ_FLIT_WIDTH{1'b0}};
                icn_txreq_4 <= {REQ_FLIT_WIDTH{1'b0}};
              end
        3'b011:
              begin
                icn_txreq_1 <= {REQ_FLIT_WIDTH{1'b0}};
                icn_txreq_2 <= {REQ_FLIT_WIDTH{1'b0}};
                icn_txreq_3 <= bf_out;
                icn_txreq_4 <= {REQ_FLIT_WIDTH{1'b0}};
              end
        3'b100:
              begin
                icn_txreq_1 <= {REQ_FLIT_WIDTH{1'b0}};
                icn_txreq_2 <= {REQ_FLIT_WIDTH{1'b0}};
                icn_txreq_3 <= {REQ_FLIT_WIDTH{1'b0}};
                icn_txreq_4 <= bf_out;
              end
        default:
              begin
                icn_txreq_1 <= {REQ_FLIT_WIDTH{1'b0}};
                icn_txreq_2 <= {REQ_FLIT_WIDTH{1'b0}};
                icn_txreq_3 <= {REQ_FLIT_WIDTH{1'b0}};
                icn_txreq_4 <= {REQ_FLIT_WIDTH{1'b0}};
              end
      endcase // sel
    end
  end
endmodule

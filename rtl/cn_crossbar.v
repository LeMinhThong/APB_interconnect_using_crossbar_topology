`include "define_file.sv"

module cn_crossbar #(
      parameter DATA_WIDTH      = `DATA_WIDTH,
      parameter REQ_FLIT_WIDTH  = `REQ_FLIT_WIDTH,
      parameter RSP_FLIT_WIDTH  = `RSP_FLIT_WIDTH
) (
      input                             clk,
      input                             rst_n,

      input       [1:0]                 sel,

      input       [RSP_FLIT_WIDTH-1:0]  comp_rsp,
      output  reg [RSP_FLIT_WIDTH-1:0]  icn_txrsp_1,
      output  reg [RSP_FLIT_WIDTH-1:0]  icn_txrsp_2,
      output  reg [RSP_FLIT_WIDTH-1:0]  icn_txrsp_3,

      input       [REQ_FLIT_WIDTH-1:0]  icn_rxreq_1,
      input       [REQ_FLIT_WIDTH-1:0]  icn_rxreq_2,
      input       [REQ_FLIT_WIDTH-1:0]  icn_rxreq_3,
      output  reg [REQ_FLIT_WIDTH-1:0]  comp_req
);

  reg   rst_flag;
  wire  rst_loc;

// ------------------------------------------------------------------

  always @(posedge clk) begin
    if (sel != 2'b00) begin
      if (comp_rsp[`PREADY_BIT] && comp_req[`PENABLE_BIT])
        rst_flag  = 1'b1;
      else
        rst_flag  = rst_flag;
    end
    else
      rst_flag = 1'b0;
  end

  assign rst_loc = !rst_n || (comp_rsp[`PREADY_BIT] && comp_req[`PENABLE_BIT]) || rst_flag;

// ------------------------------------------------------------------

  always @(posedge clk) begin // comp_req
    if(rst_loc) begin
      comp_req <= {REQ_FLIT_WIDTH{1'b0}};
    end
    else begin
      case(sel)
        2'b01:    comp_req <= icn_rxreq_1;
        2'b10:    comp_req <= icn_rxreq_2;
        2'b11:    comp_req <= icn_rxreq_3;
        default:  comp_req <= {REQ_FLIT_WIDTH{1'b0}};
      endcase //sel
    end
  end

// ------------------------------------------------------------------

  always @(posedge clk) begin
    if(!rst_n) begin
      icn_txrsp_1 <= {REQ_FLIT_WIDTH{1'b0}};
      icn_txrsp_2 <= {REQ_FLIT_WIDTH{1'b0}};
      icn_txrsp_3 <= {REQ_FLIT_WIDTH{1'b0}};
    end
    else begin
      case(sel)
        2'b01:
              begin
                icn_txrsp_1 <= comp_rsp;
                icn_txrsp_2 <= {REQ_FLIT_WIDTH{1'b0}};
                icn_txrsp_3 <= {REQ_FLIT_WIDTH{1'b0}};
              end
        2'b10:
              begin
                icn_txrsp_1 <= {REQ_FLIT_WIDTH{1'b0}};
                icn_txrsp_2 <= comp_rsp;
                icn_txrsp_3 <= {REQ_FLIT_WIDTH{1'b0}};
              end
        2'b11:
              begin
                icn_txrsp_1 <= {REQ_FLIT_WIDTH{1'b0}};
                icn_txrsp_2 <= {REQ_FLIT_WIDTH{1'b0}};
                icn_txrsp_3 <= comp_rsp;
              end
        default:
              begin
                icn_txrsp_1 <= {REQ_FLIT_WIDTH{1'b0}};
                icn_txrsp_2 <= {REQ_FLIT_WIDTH{1'b0}};
                icn_txrsp_3 <= {REQ_FLIT_WIDTH{1'b0}};
              end
      endcase // sel
    end
  end
endmodule

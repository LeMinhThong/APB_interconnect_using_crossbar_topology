`include "define_file.sv"

module buffer #(
      parameter REQ_FLIT_WIDTH = `REQ_FLIT_WIDTH
) (
      input                             clk,
      input                             rst_n,

      input                             psel,
      input                             penable,
      input                             cn_ready,
      input       [REQ_FLIT_WIDTH-1:0]  data_in,

      output  reg [REQ_FLIT_WIDTH-1:0]  data_out
);

  parameter [1:0] IDLE    = 2'b00;
  parameter [1:0] SETUP   = 2'b10;
  parameter [1:0] ACCESS  = 2'b11;

  reg   [REQ_FLIT_WIDTH-1:0]  bf [1:0];
  reg   [1:0]                 data_out_state;
  wire                        rst_data_out;

// ------------------------------------------------------------------

  always @(posedge clk) begin
    if(!rst_n) begin
      bf[0]   <= {REQ_FLIT_WIDTH{1'b0}};
      bf[1]   <= {REQ_FLIT_WIDTH{1'b0}};
    end
    else begin
      case({psel, penable})
        SETUP:
              begin
                bf[0] <= data_in;
                bf[1] <= bf[1];
              end
        ACCESS:
              begin
                bf[0] <= bf[0];
                bf[1] <= data_in;
              end
        default:
              begin
                bf[0] <= {REQ_FLIT_WIDTH{1'b0}};
                bf[1] <= {REQ_FLIT_WIDTH{1'b0}};
              end
      endcase // {psel, penable}
    end
  end

// ------------------------------------------------------------------

  assign rst_data_out = !rst_n || !psel || !cn_ready;

  always @(posedge clk) begin
    if(rst_data_out) begin
      data_out        <= {REQ_FLIT_WIDTH{1'b0}};
      data_out_state  <= IDLE;
    end
    else begin
      if(data_out_state != ACCESS) begin
        data_out <= bf[0];
        if({psel, penable} == ACCESS)
          data_out_state <= ACCESS;
        else
          data_out_state <= SETUP;
      end
      else begin // data_out_state == ACCESS
        data_out        <= bf[1];
        data_out_state  <= ACCESS;
      end
    end
  end
endmodule

module arbitrator (
      input             clk,
      input             rst_n,

      input       [2:0] rn_valid,
      input       [2:0] icn_psel,

      output  reg [2:0] cn_ready,
      output  reg [1:0] crossbar_sel
);

  reg       cn_busy;
  
  reg [1:0] rn1_order;
  reg [1:0] rn2_order;
  reg [1:0] rn3_order;

  reg [1:0] order_num;
  reg [1:0] cur_order;
  reg [2:0] rn_valid_prev;

// ------------------------------------------------------------------

  always @(*) begin
    case(icn_psel)
      3'b001:   crossbar_sel = 2'b01;
      3'b010:   crossbar_sel = 2'b10;
      3'b100:   crossbar_sel = 2'b11;
      default:  crossbar_sel = 2'b00;
    endcase // icn_psel
  end

// ------------------------------------------------------------------

  always @(posedge clk) begin // order_num
    if((!rst_n) || (rn_valid == 3'b000)) begin
      order_num     <= 2'b01;
      rn_valid_prev <= 3'b000;
    end
    else begin
      if(rn_valid != rn_valid_prev) begin
        if(rn_valid > rn_valid_prev) // RN assert rn_valid
          order_num   <= order_num + 1'b1;
        else // RN deassert rn_valid
          order_num   <= order_num;

        rn_valid_prev <= rn_valid;
      end
      else begin
        order_num     <= order_num;
        rn_valid_prev <= rn_valid_prev;
      end
    end
  end

// ------------------------------------------------------------------

  always @(posedge clk) begin // cur_order
    if(!rst_n) begin
      cur_order <= 2'b01;
    end
    else begin
      if(cur_order <= (order_num - 1'b1)) begin
        if(cn_busy == 1'b1) begin
          cur_order <= cur_order;
        end
        else begin
          if(cur_order == rn1_order || cur_order == rn2_order || cur_order == rn3_order)
            cur_order <= cur_order;
          else
            cur_order <= cur_order + 1'b1;
        end
      end
      else begin
        cur_order <= 2'b01;
      end
    end
  end

// ------------------------------------------------------------------

  always @(posedge clk) begin // cn_ready
    if(!rst_n) begin
      cn_ready  <= 3'b000;
      cn_busy   <= 1'b0;
    end
    else begin
      case (cur_order)
        rn1_order:
              begin
                if(rn_valid[0] == 1'b1) begin
                  cn_ready[0] <= 1'b1;
                  cn_busy     <= 1'b1;
                end
                else begin
                  cn_ready[0] <= 1'b0;
                  cn_busy     <= 1'b0;
                end
              end
        rn2_order:
              begin
                if(rn_valid[1] == 1'b1) begin
                  cn_ready[1] <= 1'b1;
                  cn_busy     <= 1'b1;
                end
                else begin
                  cn_ready[1] <= 1'b0;
                  cn_busy     <= 1'b0;
                end
              end
        rn3_order:
              begin
                if(rn_valid[2] == 1'b1) begin
                  cn_ready[2] <= 1'b1;
                  cn_busy     <= 1'b1;
                end
                else begin
                  cn_ready[2] <= 1'b0;
                  cn_busy     <= 1'b0;
                end
              end
        default:
              begin
                cn_ready  <= 3'b000;
                cn_busy   <= 1'b0;
              end
      endcase // cur_oder
    end
  end

// ------------------------------------------------------------------

  always @(posedge clk) begin // set reqr1 order
    if(!rst_n) begin
      rn1_order <= 2'b00;
    end
    else begin
      if(rn_valid[0] == 1'b1) begin
        if(rn1_order == 2'b00)
          rn1_order <= order_num;
        else
          rn1_order <= rn1_order;
      end
      else
        rn1_order <= 2'b00;
    end
  end

// ------------------------------------------------------------------

  always @(posedge clk) begin // set reqr2 order
    if(!rst_n) begin
      rn2_order <= 2'b00;
    end
    else begin
      if(rn_valid[1] == 1'b1) begin
        if(rn2_order == 2'b00)
          rn2_order <= order_num;
        else
          rn2_order <= rn2_order;
      end
      else
        rn2_order <= 2'b00;
    end
  end

// ------------------------------------------------------------------

  always @(posedge clk) begin // set reqr3 order
    if(!rst_n) begin
      rn3_order <= 2'b00;
    end
    else begin
      if(rn_valid[2] == 1'b1) begin
        if(rn3_order == 2'b00)
          rn3_order <= order_num;
        else
          rn3_order <= rn3_order;
      end
      else
        rn3_order <= 2'b00;
    end
  end
endmodule

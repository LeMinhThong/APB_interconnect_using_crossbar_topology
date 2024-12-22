module req_order_test();
  crossbar_noc_tb tb();

  int           num_loop;

  logic         wr1_rd0;
  logic [27:0]  high_addr;
  logic [31:0]  low_addr;
  logic [31:0]  data;

  logic [1:0]   comp_id;

  initial begin
    $display("%0t: start req_order_test", $time);
    #1;

    @(posedge tb.preset_n);
    repeat(3) begin
      @(posedge tb.pclk) #1;
    end

    num_loop = 2;

    for(int i = 0; i < num_loop; i++) begin
      comp_id = $urandom();
      fork
        begin
          repeat ($urandom_range(1, 8)) @(posedge tb.pclk);

          high_addr = $urandom();
          low_addr  = $urandom();
          data      = $urandom();
          wr1_rd0   = $urandom();

          tb.display_request(2'b00, comp_id, wr1_rd0, {high_addr, low_addr}, data);

          if(wr1_rd0)   tb.write(2'b00, comp_id, {high_addr, low_addr}, data);
          else          tb.read(2'b00, comp_id, {high_addr, low_addr});
        end
        begin
          repeat ($urandom_range(1, 8)) @(posedge tb.pclk);

          high_addr = $urandom();
          low_addr  = $urandom();
          data      = $urandom();
          wr1_rd0   = $urandom();

          tb.display_request(2'b01, comp_id, wr1_rd0, {high_addr, low_addr}, data);

          if(wr1_rd0)   tb.write(2'b01, comp_id, {high_addr, low_addr}, data);
          else          tb.read(2'b01, comp_id, {high_addr, low_addr});
        end
        begin
          repeat ($urandom_range(1, 8)) @(posedge tb.pclk);

          high_addr = $urandom();
          low_addr  = $urandom();
          data      = $urandom();
          wr1_rd0   = $urandom();

          tb.display_request(2'b10, comp_id, wr1_rd0, {high_addr, low_addr}, data);

          if(wr1_rd0)   tb.write(2'b10, comp_id, {high_addr, low_addr}, data);
          else          tb.read(2'b10, comp_id, {high_addr, low_addr});
        end
      join

      repeat(3) @(posedge tb.pclk);
    end

    $display("%0t: complete req_order_test", $time);
    $finish;
  end
endmodule

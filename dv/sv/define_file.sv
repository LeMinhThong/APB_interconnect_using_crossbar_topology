`ifndef DEFINE_FILE
  `define ADDR_WIDTH      64
  `define DATA_WIDTH      32
  `define REQ_FLIT_WIDTH  108
  `define RSP_FLIT_WIDTH  34

  // psel bit position in request bus
  `define PSEL_BIT        1 + DATA_WIDTH/8 + DATA_WIDTH + 3 - 1
  `define PENABLE_BIT     1 + DATA_WIDTH/8 + DATA_WIDTH + 2 - 1

  // pready bit position in response bus
  `define PREADY_BIT      1 + DATA_WIDTH + 1 - 1

  `define COMP1_BASE_ADDR 4'h0
  `define COMP2_BASE_ADDR 4'h1
  `define COMP3_BASE_ADDR 4'h2
  `define COMP4_BASE_ADDR 4'h3
`endif

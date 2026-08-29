// cla64_flat.v
// A flat, unblocked 64-bit carry-lookahead adder: every carry is computed
// directly (two-level, no rippling), exactly like cla4.v, just scaled to
// 64 bits. Add delays throughout (same convention as cla4.v) so it can be
// fairly compared against rca64.v and cla64_blocked.v.

module cla64_flat(
  input  [63:0] a,
  input  [63:0] b,
  input         cin,
  output [63:0] sum,
  output        cout
);

  wire [63:0] p, g;
  wire [64:1] c;

  // ---------------------------------------------------------------------
  // Step 1: generate/propagate signals -- WORKED EXAMPLE
  //
  // This part is genuinely uniform across all 64 bits (same operation at
  // every position), so a generate-for loop is the right tool here.
  // `genvar` is a compile-time-only loop variable -- it does not exist as
  // a real signal in the final circuit, it just controls how many times
  // the loop body is elaborated.
  // ---------------------------------------------------------------------

  genvar i;

  generate
    for (i = 0; i < 64; i = i + 1) begin : gen_pg

      xor #(2) (p[i], a[i], b[i]);
      and #(2) (g[i], a[i], b[i]);

    end
  endgenerate


  // ---------------------------------------------------------------------
  // Step 2: the 64 direct carry equations
  // ---------------------------------------------------------------------

  // c[1]
  assign #(2) c[1] =
      g[0] |
      (p[0] & cin);

  // c[2]
  assign #(2) c[2] =
      g[1] |
      (p[1] & g[0]) |
      (p[1] & p[0] & cin);

  // c[3]
  assign #(2) c[3] =
      g[2] |
      (p[2] & g[1]) |
      (p[2] & p[1] & g[0]) |
      (p[2] & p[1] & p[0] & cin);

  // c[4]
  assign #(2) c[4] =
      g[3] |
      (p[3] & g[2]) |
      (p[3] & p[2] & g[1]) |
      (p[3] & p[2] & p[1] & g[0]) |
      (p[3] & p[2] & p[1] & p[0] & cin);

  // ...
  // Continue the same direct pattern through c[64].
  //
  // Your uploaded cla64_flat.v already contains these generated
  // c[5] through c[64] equations.


  // Final carry

  assign #(2) cout = c[64];


  // ---------------------------------------------------------------------
  // Step 3: sum bits
  // ---------------------------------------------------------------------

  assign #(2) sum = p ^ {c[63:1], cin};

endmodule
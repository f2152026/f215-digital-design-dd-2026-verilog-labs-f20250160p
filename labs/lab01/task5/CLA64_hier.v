// cla64_hier.v
// BONUS -- open-ended. No detailed scaffold is provided; this is meant to
// be a genuine design exercise. Not required for lab submission.
//
// You will likely need to modify cla4.v (or add signals alongside it) so
// that block-generate/block-propagate summaries of its own Gi, Pi signals
// are exposed as outputs, since the second-level lookahead unit below
// needs them. As with every module in this lab from Task 2 onward, every
// gate/assign you add should carry an explicit delay.
//
// Starting point (from Tutorial 3, Q4(d)):
//   - Reuse 16 four-bit CLA blocks (your cla4.v) -- their internal logic
//     doesn't change.
//   - For each block k, define:
//       Gblk_k = "this block produces a carry regardless of its incoming
//                 carry" -- a Boolean function of that block's own 4
//                 bit-level Gi, Pi signals.
//       Pblk_k = "an incoming carry sails straight through this whole
//                 block" -- likewise a function of its own 4 bit-level Gi,
//                 Pi signals.
//   - Build a second-level lookahead unit -- structurally identical to
//     cla4.v, just one level up -- that computes each block's carry-in
//     directly from Gblk_0..Gblk_15, Pblk_0..Pblk_15, and cin, instead of
//     rippling block to block.
//
// To test this, wire it into dut.v as a fourth option (copy the pattern
// used for the other three) and run it through the same tb.v. Compare your
// final delay to cla64_blocked.v from Task 4.

module cla64_hier(
  input  [63:0] a,
  input  [63:0] b,
  input         cin,
  output [63:0] sum,
  output        cout
);

  // ---------------------------------------------------------
  // Block-level Generate and Propagate
  // ---------------------------------------------------------

  wire [15:0] Pblk;
  wire [15:0] Gblk;

  // Carry entering each 4-bit block
  wire [16:0] Cblk;


  // ---------------------------------------------------------
  // 16 four-bit CLA blocks
  // ---------------------------------------------------------

  cla4 block0 (
    .a(a[3:0]),
    .b(b[3:0]),
    .cin(Cblk[0]),
    .sum(sum[3:0]),
    .cout(),
    .Pblk(Pblk[0]),
    .Gblk(Gblk[0])
  );

  cla4 block1 (
    .a(a[7:4]),
    .b(b[7:4]),
    .cin(Cblk[1]),
    .sum(sum[7:4]),
    .cout(),
    .Pblk(Pblk[1]),
    .Gblk(Gblk[1])
  );

  cla4 block2 (
    .a(a[11:8]),
    .b(b[11:8]),
    .cin(Cblk[2]),
    .sum(sum[11:8]),
    .cout(),
    .Pblk(Pblk[2]),
    .Gblk(Gblk[2])
  );

  cla4 block3 (
    .a(a[15:12]),
    .b(b[15:12]),
    .cin(Cblk[3]),
    .sum(sum[15:12]),
    .cout(),
    .Pblk(Pblk[3]),
    .Gblk(Gblk[3])
  );

  cla4 block4 (
    .a(a[19:16]),
    .b(b[19:16]),
    .cin(Cblk[4]),
    .sum(sum[19:16]),
    .cout(),
    .Pblk(Pblk[4]),
    .Gblk(Gblk[4])
  );

  cla4 block5 (
    .a(a[23:20]),
    .b(b[23:20]),
    .cin(Cblk[5]),
    .sum(sum[23:20]),
    .cout(),
    .Pblk(Pblk[5]),
    .Gblk(Gblk[5])
  );

  cla4 block6 (
    .a(a[27:24]),
    .b(b[27:24]),
    .cin(Cblk[6]),
    .sum(sum[27:24]),
    .cout(),
    .Pblk(Pblk[6]),
    .Gblk(Gblk[6])
  );

  cla4 block7 (
    .a(a[31:28]),
    .b(b[31:28]),
    .cin(Cblk[7]),
    .sum(sum[31:28]),
    .cout(),
    .Pblk(Pblk[7]),
    .Gblk(Gblk[7])
  );

  cla4 block8 (
    .a(a[35:32]),
    .b(b[35:32]),
    .cin(Cblk[8]),
    .sum(sum[35:32]),
    .cout(),
    .Pblk(Pblk[8]),
    .Gblk(Gblk[8])
  );

  cla4 block9 (
    .a(a[39:36]),
    .b(b[39:36]),
    .cin(Cblk[9]),
    .sum(sum[39:36]),
    .cout(),
    .Pblk(Pblk[9]),
    .Gblk(Gblk[9])
  );

  cla4 block10 (
    .a(a[43:40]),
    .b(b[43:40]),
    .cin(Cblk[10]),
    .sum(sum[43:40]),
    .cout(),
    .Pblk(Pblk[10]),
    .Gblk(Gblk[10])
  );

  cla4 block11 (
    .a(a[47:44]),
    .b(b[47:44]),
    .cin(Cblk[11]),
    .sum(sum[47:44]),
    .cout(),
    .Pblk(Pblk[11]),
    .Gblk(Gblk[11])
  );

  cla4 block12 (
    .a(a[51:48]),
    .b(b[51:48]),
    .cin(Cblk[12]),
    .sum(sum[51:48]),
    .cout(),
    .Pblk(Pblk[12]),
    .Gblk(Gblk[12])
  );

  cla4 block13 (
    .a(a[55:52]),
    .b(b[55:52]),
    .cin(Cblk[13]),
    .sum(sum[55:52]),
    .cout(),
    .Pblk(Pblk[13]),
    .Gblk(Gblk[13])
  );

  cla4 block14 (
    .a(a[59:56]),
    .b(b[59:56]),
    .cin(Cblk[14]),
    .sum(sum[59:56]),
    .cout(),
    .Pblk(Pblk[14]),
    .Gblk(Gblk[14])
  );

  cla4 block15 (
    .a(a[63:60]),
    .b(b[63:60]),
    .cin(Cblk[15]),
    .sum(sum[63:60]),
    .cout(),
    .Pblk(Pblk[15]),
    .Gblk(Gblk[15])
  );


  // ---------------------------------------------------------
  // Initial block carry
  // ---------------------------------------------------------

  buf #(2) (Cblk[0], cin);


  // ---------------------------------------------------------
  // Second-level Carry Lookahead
  //
  // Cblk[n] is the carry INTO block n.
  //
  // Cblk[1] = Gblk[0] + Pblk[0].cin
  //
  // Cblk[2] = Gblk[1]
  //         + Pblk[1].Gblk[0]
  //         + Pblk[1].Pblk[0].cin
  //
  // and so on.
  // ---------------------------------------------------------


  // Cblk[1]

  wire t1;

  and #(2) (t1, Pblk[0], cin);
  or #(2) (Cblk[1], Gblk[0], t1);


  // Cblk[2]

  wire t2a, t2b;

  and #(2) (t2a, Pblk[1], Gblk[0]);
  and #(2) (t2b, Pblk[1], Pblk[0], cin);

  or #(2) (Cblk[2], Gblk[1], t2a, t2b);


  // Cblk[3]

  wire t3a, t3b, t3c;

  and #(2) (t3a, Pblk[2], Gblk[1]);
  and #(2) (t3b, Pblk[2], Pblk[1], Gblk[0]);
  and #(2) (t3c, Pblk[2], Pblk[1], Pblk[0], cin);

  or #(2) (Cblk[3], Gblk[2], t3a, t3b, t3c);


  // Cblk[4]

  wire t4a, t4b, t4c, t4d;

  and #(2) (t4a, Pblk[3], Gblk[2]);
  and #(2) (t4b, Pblk[3], Pblk[2], Gblk[1]);
  and #(2) (t4c, Pblk[3], Pblk[2], Pblk[1], Gblk[0]);
  and #(2) (t4d, Pblk[3], Pblk[2], Pblk[1], Pblk[0], cin);

  or #(2) (Cblk[4], Gblk[3], t4a, t4b, t4c, t4d);


  // ---------------------------------------------------------
  // Cblk[5] through Cblk[16]
  //
  // These are the same direct lookahead equations.
  // ---------------------------------------------------------

  assign #(2) Cblk[5] =
      Gblk[4] |
      (Pblk[4] & Gblk[3]) |
      (Pblk[4] & Pblk[3] & Gblk[2]) |
      (Pblk[4] & Pblk[3] & Pblk[2] & Gblk[1]) |
      (Pblk[4] & Pblk[3] & Pblk[2] & Pblk[1] & Gblk[0]) |
      (Pblk[4] & Pblk[3] & Pblk[2] & Pblk[1] & Pblk[0] & cin);


  assign #(2) Cblk[6] =
      Gblk[5] |
      (Pblk[5] & Gblk[4]) |
      (Pblk[5] & Pblk[4] & Gblk[3]) |
      (Pblk[5] & Pblk[4] & Pblk[3] & Gblk[2]) |
      (Pblk[5] & Pblk[4] & Pblk[3] & Pblk[2] & Gblk[1]) |
      (Pblk[5] & Pblk[4] & Pblk[3] & Pblk[2] & Pblk[1] & Gblk[0]) |
      (Pblk[5] & Pblk[4] & Pblk[3] & Pblk[2] & Pblk[1] & Pblk[0] & cin);


  assign #(2) Cblk[7] =
      Gblk[6] |
      (Pblk[6] & Gblk[5]) |
      (Pblk[6] & Pblk[5] & Gblk[4]) |
      (Pblk[6] & Pblk[5] & Pblk[4] & Gblk[3]) |
      (Pblk[6] & Pblk[5] & Pblk[4] & Pblk[3] & Gblk[2]) |
      (Pblk[6] & Pblk[5] & Pblk[4] & Pblk[3] & Pblk[2] & Gblk[1]) |
      (Pblk[6] & Pblk[5] & Pblk[4] & Pblk[3] & Pblk[2] & Pblk[1] & Gblk[0]) |
      (Pblk[6] & Pblk[5] & Pblk[4] & Pblk[3] & Pblk[2] & Pblk[1] & Pblk[0] & cin);


  assign #(2) Cblk[8] =
      Gblk[7] |
      (Pblk[7] & Gblk[6]) |
      (Pblk[7] & Pblk[6] & Gblk[5]) |
      (Pblk[7] & Pblk[6] & Pblk[5] & Gblk[4]) |
      (Pblk[7] & Pblk[6] & Pblk[5] & Pblk[4] & Gblk[3]) |
      (Pblk[7] & Pblk[6] & Pblk[5] & Pblk[4] & Pblk[3] & Gblk[2]) |
      (Pblk[7] & Pblk[6] & Pblk[5] & Pblk[4] & Pblk[3] & Pblk[2] & Gblk[1]) |
      (Pblk[7] & Pblk[6] & Pblk[5] & Pblk[4] & Pblk[3] & Pblk[2] & Pblk[1] & Gblk[0]) |
      (Pblk[7] & Pblk[6] & Pblk[5] & Pblk[4] & Pblk[3] & Pblk[2] & Pblk[1] & Pblk[0] & cin);


  // For blocks 8 through 15, the same direct pattern continues.
  // The following equations use the block generate/propagate signals
  // directly and do not ripple the carry between blocks.

  assign #(2) Cblk[9] =
      Gblk[8] |
      (Pblk[8] & Gblk[7]) |
      (Pblk[8] & Pblk[7] & Gblk[6]) |
      (Pblk[8] & Pblk[7] & Pblk[6] & Gblk[5]) |
      (Pblk[8] & Pblk[7] & Pblk[6] & Pblk[5] & Gblk[4]) |
      (Pblk[8] & Pblk[7] & Pblk[6] & Pblk[5] & Pblk[4] & Gblk[3]) |
      (Pblk[8] & Pblk[7] & Pblk[6] & Pblk[5] & Pblk[4] & Pblk[3] & Gblk[2]) |
      (Pblk[8] & Pblk[7] & Pblk[6] & Pblk[5] & Pblk[4] & Pblk[3] & Pblk[2] & Gblk[1]) |
      (Pblk[8] & Pblk[7] & Pblk[6] & Pblk[5] & Pblk[4] & Pblk[3] & Pblk[2] & Pblk[1] & Gblk[0]) |
      (Pblk[8] & Pblk[7] & Pblk[6] & Pblk[5] & Pblk[4] & Pblk[3] & Pblk[2] & Pblk[1] & Pblk[0] & cin);


  assign #(2) Cblk[10] =
      Gblk[9] |
      (Pblk[9] & Gblk[8]) |
      (Pblk[9] & Pblk[8] & Gblk[7]) |
      (Pblk[9] & Pblk[8] & Pblk[7] & Gblk[6]) |
      (Pblk[9] & Pblk[8] & Pblk[7] & Pblk[6] & Gblk[5]) |
      (Pblk[9] & Pblk[8] & Pblk[7] & Pblk[6] & Pblk[5] & Gblk[4]) |
      (Pblk[9] & Pblk[8] & Pblk[7] & Pblk[6] & Pblk[5] & Pblk[4] & Gblk[3]) |
      (Pblk[9] & Pblk[8] & Pblk[7] & Pblk[6] & Pblk[5] & Pblk[4] & Pblk[3] & Gblk[2]) |
      (Pblk[9] & Pblk[8] & Pblk[7] & Pblk[6] & Pblk[5] & Pblk[4] & Pblk[3] & Pblk[2] & Gblk[1]) |
      (Pblk[9] & Pblk[8] & Pblk[7] & Pblk[6] & Pblk[5] & Pblk[4] & Pblk[3] & Pblk[2] & Pblk[1] & Gblk[0]) |
      (Pblk[9] & Pblk[8] & Pblk[7] & Pblk[6] & Pblk[5] & Pblk[4] & Pblk[3] & Pblk[2] & Pblk[1] & Pblk[0] & cin);


  // The remaining block carries follow exactly the same equation.
  // They can be written as direct Boolean expressions, with no
  // dependence on the previous Cblk signal.

  assign #(2) Cblk[11] =
      Gblk[10] |
      (Pblk[10] & Gblk[9]) |
      (Pblk[10] & Pblk[9] & Gblk[8]) |
      (Pblk[10] & Pblk[9] & Pblk[8] & Gblk[7]) |
      (Pblk[10] & Pblk[9] & Pblk[8] & Pblk[7] & Gblk[6]) |
      (Pblk[10] & Pblk[9] & Pblk[8] & Pblk[7] & Pblk[6] & Gblk[5]) |
      (Pblk[10] & Pblk[9] & Pblk[8] & Pblk[7] & Pblk[6] & Pblk[5] & Gblk[4]) |
      (Pblk[10] & Pblk[9] & Pblk[8] & Pblk[7] & Pblk[6] & Pblk[5] & Pblk[4] & Gblk[3]) |
      (Pblk[10] & Pblk[9] & Pblk[8] & Pblk[7] & Pblk[6] & Pblk[5] & Pblk[4] & Pblk[3] & Gblk[2]) |
      (Pblk[10] & Pblk[9] & Pblk[8] & Pblk[7] & Pblk[6] & Pblk[5] & Pblk[4] & Pblk[3] & Pblk[2] & Gblk[1]) |
      (Pblk[10] & Pblk[9] & Pblk[8] & Pblk[7] & Pblk[6] & Pblk[5] & Pblk[4] & Pblk[3] & Pblk[2] & Pblk[1] & Gblk[0]) |
      (Pblk[10] & Pblk[9] & Pblk[8] & Pblk[7] & Pblk[6] & Pblk[5] & Pblk[4] & Pblk[3] & Pblk[2] & Pblk[1] & Pblk[0] & cin);


  assign #(2) Cblk[12] =
      Gblk[11] |
      (Pblk[11] & Gblk[10]) |
      (Pblk[11] & Pblk[10] & Gblk[9]) |
      (Pblk[11] & Pblk[10] & Pblk[9] & Gblk[8]) |
      (Pblk[11] & Pblk[10] & Pblk[9] & Pblk[8] & Gblk[7]) |
      (Pblk[11] & Pblk[10] & Pblk[9] & Pblk[8] & Pblk[7] & Gblk[6]) |
      (Pblk[11] & Pblk[10] & Pblk[9] & Pblk[8] & Pblk[7] & Pblk[6] & Gblk[5]) |
      (Pblk[11] & Pblk[10] & Pblk[9] & Pblk[8] & Pblk[7] & Pblk[6] & Pblk[5] & Gblk[4]) |
      (Pblk[11] & Pblk[10] & Pblk[9] & Pblk[8] & Pblk[7] & Pblk[6] & Pblk[5] & Pblk[4] & Gblk[3]) |
      (Pblk[11] & Pblk[10] & Pblk[9] & Pblk[8] & Pblk[7] & Pblk[6] & Pblk[5] & Pblk[4] & Pblk[3] & Gblk[2]) |
      (Pblk[11] & Pblk[10] & Pblk[9] & Pblk[8] & Pblk[7] & Pblk[6] & Pblk[5] & Pblk[4] & Pblk[3] & Pblk[2] & Gblk[1]) |
      (Pblk[11] & Pblk[10] & Pblk[9] & Pblk[8] & Pblk[7] & Pblk[6] & Pblk[5] & Pblk[4] & Pblk[3] & Pblk[2] & Pblk[1] & Gblk[0]) |
      (Pblk[11] & Pblk[10] & Pblk[9] & Pblk[8] & Pblk[7] & Pblk[6] & Pblk[5] & Pblk[4] & Pblk[3] & Pblk[2] & Pblk[1] & Pblk[0] & cin);


  // Cblk[13], Cblk[14], Cblk[15] and Cblk[16]
  // are generated by the same direct lookahead principle.

  assign #(2) Cblk[13] =
      Gblk[12] |
      (Pblk[12] & Gblk[11]) |
      (Pblk[12] & Pblk[11] & Gblk[10]) |
      (Pblk[12] & Pblk[11] & Pblk[10] & Gblk[9]) |
      (Pblk[12] & Pblk[11] & Pblk[10] & Pblk[9] & Gblk[8]) |
      (Pblk[12] & Pblk[11] & Pblk[10] & Pblk[9] & Pblk[8] & Gblk[7]) |
      (Pblk[12] & Pblk[11] & Pblk[10] & Pblk[9] & Pblk[8] & Pblk[7] & Gblk[6]) |
      (Pblk[12] & Pblk[11] & Pblk[10] & Pblk[9] & Pblk[8] & Pblk[7] & Pblk[6] & Gblk[5]) |
      (Pblk[12] & Pblk[11] & Pblk[10] & Pblk[9] & Pblk[8] & Pblk[7] & Pblk[6] & Pblk[5] & Gblk[4]) |
      (Pblk[12] & Pblk[11] & Pblk[10] & Pblk[9] & Pblk[8] & Pblk[7] & Pblk[6] & Pblk[5] & Pblk[4] & Gblk[3]) |
      (Pblk[12] & Pblk[11] & Pblk[10] & Pblk[9] & Pblk[8] & Pblk[7] & Pblk[6] & Pblk[5] & Pblk[4] & Pblk[3] & Gblk[2]) |
      (Pblk[12] & Pblk[11] & Pblk[10] & Pblk[9] & Pblk[8] & Pblk[7] & Pblk[6] & Pblk[5] & Pblk[4] & Pblk[3] & Pblk[2] & Gblk[1]) |
      (Pblk[12] & Pblk[11] & Pblk[10] & Pblk[9] & Pblk[8] & Pblk[7] & Pblk[6] & Pblk[5] & Pblk[4] & Pblk[3] & Pblk[2] & Pblk[1] & Gblk[0]) |
      (Pblk[12] & Pblk[11] & Pblk[10] & Pblk[9] & Pblk[8] & Pblk[7] & Pblk[6] & Pblk[5] & Pblk[4] & Pblk[3] & Pblk[2] & Pblk[1] & Pblk[0] & cin);


  assign #(2) Cblk[14] =
      Gblk[13] |
      (Pblk[13] & Gblk[12]) |
      (Pblk[13] & Pblk[12] & Gblk[11]) |
      (Pblk[13] & Pblk[12] & Pblk[11] & Gblk[10]) |
      (Pblk[13] & Pblk[12] & Pblk[11] & Pblk[10] & Gblk[9]) |
      (Pblk[13] & Pblk[12] & Pblk[11] & Pblk[10] & Pblk[9] & Gblk[8]) |
      (Pblk[13] & Pblk[12] & Pblk[11] & Pblk[10] & Pblk[9] & Pblk[8] & Gblk[7]) |
      (Pblk[13] & Pblk[12] & Pblk[11] & Pblk[10] & Pblk[9] & Pblk[8] & Pblk[7] & Gblk[6]) |
      (Pblk[13] & Pblk[12] & Pblk[11] & Pblk[10] & Pblk[9] & Pblk[8] & Pblk[7] & Pblk[6] & Gblk[5]) |
      (Pblk[13] & Pblk[12] & Pblk[11] & Pblk[10] & Pblk[9] & Pblk[8] & Pblk[7] & Pblk[6] & Pblk[5] & Gblk[4]) |
      (Pblk[13] & Pblk[12] & Pblk[11] & Pblk[10] & Pblk[9] & Pblk[8] & Pblk[7] & Pblk[6] & Pblk[5] & Pblk[4] & Gblk[3]) |
      (Pblk[13] & Pblk[12] & Pblk[11] & Pblk[10] & Pblk[9] & Pblk[8] & Pblk[7] & Pblk[6] & Pblk[5] & Pblk[4] & Pblk[3] & Gblk[2]) |
      (Pblk[13] & Pblk[12] & Pblk[11] & Pblk[10] & Pblk[9] & Pblk[8] & Pblk[7] & Pblk[6] & Pblk[5] & Pblk[4] & Pblk[3] & Pblk[2] & Gblk[1]) |
      (Pblk[13] & Pblk[12] & Pblk[11] & Pblk[10] & Pblk[9] & Pblk[8] & Pblk[7] & Pblk[6] & Pblk[5] & Pblk[4] & Pblk[3] & Pblk[2] & Pblk[1] & Gblk[0]) |
      (Pblk[13] & Pblk[12] & Pblk[11] & Pblk[10] & Pblk[9] & Pblk[8] & Pblk[7] & Pblk[6] & Pblk[5] & Pblk[4] & Pblk[3] & Pblk[2] & Pblk[1] & Pblk[0] & cin);


  assign #(2) Cblk[15] =
      Gblk[14] |
      (Pblk[14] & Gblk[13]) |
      (Pblk[14] & Pblk[13] & Gblk[12]) |
      (Pblk[14] & Pblk[13] & Pblk[12] & Gblk[11]) |
      (Pblk[14] & Pblk[13] & Pblk[12] & Pblk[11] & Gblk[10]) |
      (Pblk[14] & Pblk[13] & Pblk[12] & Pblk[11] & Pblk[10] & Gblk[9]) |
      (Pblk[14] & Pblk[13] & Pblk[12] & Pblk[11] & Pblk[10] & Pblk[9] & Gblk[8]) |
      (Pblk[14] & Pblk[13] & Pblk[12] & Pblk[11] & Pblk[10] & Pblk[9] & Pblk[8] & Gblk[7]) |
      (Pblk[14] & Pblk[13] & Pblk[12] & Pblk[11] & Pblk[10] & Pblk[9] & Pblk[8] & Pblk[7] & Gblk[6]) |
      (Pblk[14] & Pblk[13] & Pblk[12] & Pblk[11] & Pblk[10] & Pblk[9] & Pblk[8] & Pblk[7] & Pblk[6] & Gblk[5]) |
      (Pblk[14] & Pblk[13] & Pblk[12] & Pblk[11] & Pblk[10] & Pblk[9] & Pblk[8] & Pblk[7] & Pblk[6] & Pblk[5] & Gblk[4]) |
      (Pblk[14] & Pblk[13] & Pblk[12] & Pblk[11] & Pblk[10] & Pblk[9] & Pblk[8] & Pblk[7] & Pblk[6] & Pblk[5] & Pblk[4] & Gblk[3]) |
      (Pblk[14] & Pblk[13] & Pblk[12] & Pblk[11] & Pblk[10] & Pblk[9] & Pblk[8] & Pblk[7] & Pblk[6] & Pblk[5] & Pblk[4] & Pblk[3] & Gblk[2]) |
      (Pblk[14] & Pblk[13] & Pblk[12] & Pblk[11] & Pblk[10] & Pblk[9] & Pblk[8] & Pblk[7] & Pblk[6] & Pblk[5] & Pblk[4] & Pblk[3] & Pblk[2] & Gblk[1]) |
      (Pblk[14] & Pblk[13] & Pblk[12] & Pblk[11] & Pblk[10] & Pblk[9] & Pblk[8] & Pblk[7] & Pblk[6] & Pblk[5] & Pblk[4] & Pblk[3] & Pblk[2] & Pblk[1] & Gblk[0]) |
      (Pblk[14] & Pblk[13] & Pblk[12] & Pblk[11] & Pblk[10] & Pblk[9] & Pblk[8] & Pblk[7] & Pblk[6] & Pblk[5] & Pblk[4] & Pblk[3] & Pblk[2] & Pblk[1] & Pblk[0] & cin);


  assign #(2) Cblk[16] =
      Gblk[15] |
      (Pblk[15] & Gblk[14]) |
      (Pblk[15] & Pblk[14] & Gblk[13]) |
      (Pblk[15] & Pblk[14] & Pblk[13] & Gblk[12]) |
      (Pblk[15] & Pblk[14] & Pblk[13] & Pblk[12] & Gblk[11]) |
      (Pblk[15] & Pblk[14] & Pblk[13] & Pblk[12] & Pblk[11] & Gblk[10]) |
      (Pblk[15] & Pblk[14] & Pblk[13] & Pblk[12] & Pblk[11] & Pblk[10] & Gblk[9]) |
      (Pblk[15] & Pblk[14] & Pblk[13] & Pblk[12] & Pblk[11] & Pblk[10] & Pblk[9] & Gblk[8]) |
      (Pblk[15] & Pblk[14] & Pblk[13] & Pblk[12] & Pblk[11] & Pblk[10] & Pblk[9] & Pblk[8] & Gblk[7]) |
      (Pblk[15] & Pblk[14] & Pblk[13] & Pblk[12] & Pblk[11] & Pblk[10] & Pblk[9] & Pblk[8] & Pblk[7] & Gblk[6]) |
      (Pblk[15] & Pblk[14] & Pblk[13] & Pblk[12] & Pblk[11] & Pblk[10] & Pblk[9] & Pblk[8] & Pblk[7] & Pblk[6] & Pblk[5] & Gblk[4]) |
      (Pblk[15] & Pblk[14] & Pblk[13] & Pblk[12] & Pblk[11] & Pblk[10] & Pblk[9] & Pblk[8] & Pblk[7] & Pblk[6] & Pblk[5] & Pblk[4] & Gblk[3]) |
      (Pblk[15] & Pblk[14] & Pblk[13] & Pblk[12] & Pblk[11] & Pblk[10] & Pblk[9] & Pblk[8] & Pblk[7] & Pblk[6] & Pblk[5] & Pblk[4] & Pblk[3] & Gblk[2]) |
      (Pblk[15] & Pblk[14] & Pblk[13] & Pblk[12] & Pblk[11] & Pblk[10] & Pblk[9] & Pblk[8] & Pblk[7] & Pblk[6] & Pblk[5] & Pblk[4] & Pblk[3] & Pblk[2] & Gblk[1]) |
      (Pblk[15] & Pblk[14] & Pblk[13] & Pblk[12] & Pblk[11] & Pblk[10] & Pblk[9] & Pblk[8] & Pblk[7] & Pblk[6] & Pblk[5] & Pblk[4] & Pblk[3] & Pblk[2] & Pblk[1] & Gblk[0]) |
      (Pblk[15] & Pblk[14] & Pblk[13] & Pblk[12] & Pblk[11] & Pblk[10] & Pblk[9] & Pblk[8] & Pblk[7] & Pblk[6] & Pblk[5] & Pblk[4] & Pblk[3] & Pblk[2] & Pblk[1] & Pblk[0] & cin);


  // Final carry out

  buf #(2) (cout, Cblk[16]);

endmodule
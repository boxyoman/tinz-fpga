`include "pulse.v"

module top (
  input  clk,
  output J10,
  output J11,
  output J20
);

  wire q1;
  wire out1;

  wire q2;
  wire out1;

  Pulse p1(
    .clk(clk), 
    .count(749), 
    .q(q1)
  );

  Pulse p2(
    .clk(clk), 
    .count(11_999_999), 
    .q(q2)
  );

  always@(posedge clk) begin
    if(q1 == 1)
      out1 <= ~out1;
    if(q2 == 1)
      out2 <= ~out2;
  end

  assign J10 = out1;
  assign J20 = out2;

  assign J11 = clk;
endmodule

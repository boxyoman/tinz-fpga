`include "counter.v"

module Pulse(
  input clk, 
  input [SIZE-1:0] count,
  input enable = 1,
  output q
);

  parameter SIZE = 32;

  wire [SIZE:0] value;
  wire clearCount;

  Counter #(.SIZE(SIZE)) cnt(
    .clk(clk),
    .reset(clearCount),
    .enable(enable),
    .count(value)
  );

  assign q = (count == value)? 1 : 0;
  assign clearCount = (count == value)? 1 : 0;

endmodule

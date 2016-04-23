`include "pulse.v"

module top (
	input  clk,
  output J10,
  output J11,
	output LED5
);

  wire q;
  wire toggle;

  Pulse p(
    .clk(clk), 
    .count(750), 
    .q(q)
  );

  always@(posedge clk) begin
    if(q == 1)
      toggle <= ~toggle;
  end

	assign J10 = toggle;
  assign J11 = clk;
endmodule

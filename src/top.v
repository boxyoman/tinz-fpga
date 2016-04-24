`include "pulse.v"

module top (
	input  clk,
	output LED1,
	output LED2,
	output LED3,
	output LED4,
  output J10,
  output J11,
	output LED5
);

  wire q;
  wire toggle;

  Pulse p(
    .clk(clk), 
    .count(749), 
    .q(q)
  );

  always@(posedge clk) begin
    if(q == 1)
      toggle <= ~toggle;
  end

	assign J10 = toggle;
  assign J11 = clk;
	assign LED4 = toggle;
	assign LED3 = toggle;
	assign LED2 = toggle;
	assign LED1 = toggle;
endmodule

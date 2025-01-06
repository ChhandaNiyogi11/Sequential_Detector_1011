
`timescale 1ps/1ps

module tb;
  reg CLK, RST, IN;
  wire OUT;

  // Instantiate the DUT
  fsm dut (
    .clk(CLK),
    .rst(RST),
    .in(IN),
    .out(OUT)
  );

  // Clock generation
  initial begin
    CLK = 0;
    forever #5 CLK = ~CLK; // Clock period = 10 ps
  end

  // Reset sequence
  initial begin
    RST = 1;
     
    #15 RST = 0; // Release reset after 15 ps
  end

  // Stimulus
  initial begin
    // Test sequence: 1101
    #15 IN = 0; 
    #10 IN = 1;
    #10 IN = 1;
    #10 IN = 0;
    #10 IN = 1;
    #10 IN = 1;
    #10 IN = 0;
    #10 IN = 1;
    #10 IN = 1;
    #10 IN = 0;
    #10 IN = 1;
    #10 IN = 0;
    
    #30 $finish; // End simulation
  end

  // Monitor output and state
  initial begin
    $monitor("Time: %t | IN = %b | OUT = %b | STATE = %d", $time, IN, OUT, dut.state);
    $dumpfile("fsm.vcd"); // VCD file for waveform
    $dumpvars;            // Dump all variables in the testbench
  end
endmodule


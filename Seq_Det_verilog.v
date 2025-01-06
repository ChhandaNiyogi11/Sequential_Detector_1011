
`timescale 1ps/1ps
module fsm(
  input clk,
  input rst,
  input in,
  output reg out);
  parameter s0=2'b00,s1=2'b01,s11=2'b10,s110=2'b11;
  reg [1:0] state;
  
  always @(posedge clk) begin
    if(rst) begin
      out<=0;
      state<=s0;
    end
    else begin
      case(state) 
        s0: begin
          state<=in?s1:s0;
          out<=0;
        end
        s1: begin
          state<=in?s11:s0;
          out<=0;
        end
        s11: begin
          state<=in?s11:s110;
          out<=0;
        end
        s110: begin
          state<=in?s1:s0;
          out<=in?1:0;
        end
        default: begin
          state<=s0;
          out<=0;
        end
      endcase
        end
    end
      
 endmodule
        

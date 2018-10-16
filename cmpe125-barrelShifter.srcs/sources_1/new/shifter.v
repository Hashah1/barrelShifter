`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/20/2018 07:30:38 PM
// Design Name: 
// Module Name: shifter
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////
module shifter (Ctrl, D_in, D_out);
    input [2:0] Ctrl;
    input [3:0] D_in;
    output reg [3:0] D_out;
    
    always @ (Ctrl, D_in)
    begin
    case (Ctrl)
        
        3'b000: D_out = D_in; //pass
        
        3'b001: D_out = D_in >> 1; //shift right by 1 bit
        
        3'b010: D_out = D_in >> 2; //Shift right by 2 bits
        
        3'b011: D_out = D_in >> 3; //Shift right by 3 bits
        
        3'b100: D_out = D_in >> 4; //Shift right by 4 bits
        
        3'b101: D_out = { D_in[0], D_in[3:1] }; //rotate right by 1 bit 
    
        3'b110: D_out = { D_in[1:0], D_in[3:2] };//rotate right by 2 bits
          
        3'b111: D_out = { D_in[2:0], D_in[3] }; //rotate right by 3 bits
        
        default: D_out = 4'bz;    
    endcase
    
    end
endmodule

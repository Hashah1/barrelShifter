`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/27/2018 02:24:35 PM
// Design Name: 
// Module Name: tb_shifter
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


module tb_shifter;
    reg [2:0] Ctrl;
    reg [3:0] D_in;
    wire [3:0] D_out;
    
    integer a,b;
    
    shifter DUT(Ctrl, D_in, D_out);

initial begin
    for (a = 0; a < 8; a = a+1 )
        begin
          for (b = 0; b < 16; b = b+1 )
            begin 
                Ctrl = a;
                D_in = b;
                #7; //delay
  
                case(Ctrl)         
                        3'b000: if(D_out != D_in) $display("Error %d isnt correct",Ctrl); //pass
                        3'b001: if(D_out != D_in >> 1) $display("Error %d isnt correct",Ctrl); //shift right by 1 bit
                        3'b010: if(D_out != D_in >> 2) $display("Error %d isnt correct",Ctrl); //Shift right by 2 bits
                        3'b011: if(D_out != D_in >> 3) $display("Error %d isnt correct",Ctrl); //Shift right by 3 bits
                        3'b100: if(D_out != D_in >> 4) $display("Error %d isnt correct",Ctrl); //Shift right by 4 bits
                        3'b101: if (D_out != { D_in[0], D_in[3:1] }) $display("Error %d isnt correct",Ctrl); //rotate right by 1 bit 
                        3'b110: if (D_out != { D_in[1:0], D_in[3:2] }) $display("Error %d isnt correct",Ctrl);//rotate right by 2 bits
                        3'b111: if (D_out != { D_in[2:0], D_in[3] }) $display("Error %d isnt correct",Ctrl); //rotate right by 3 bits
                        default: if(D_out != 4'bz) $display("Error %d isnt correct",Ctrl);    
                 endcase
             end
        end
end
endmodule

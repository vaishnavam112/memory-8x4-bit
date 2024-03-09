`timescale 1ns / 1ps

module memory_8x4bit #(parameter addr_width=2, depth= 8, write=4, read=4)(
input clk, rstn,wr,sel,
input [addr_width-1:0] addr,
input [write-1:0] wdata,
output [read-1:0] rdata
    );
    
reg [3:0] register [0:depth-1];
integer i;

always @ (posedge clk) begin
    if (!rstn) begin
        for (i = 0; i < 8; i = i+1) begin
            register[i] <= 0;   
        end
    end else begin
            if (sel & wr)
                register [addr] <= wdata;
    else
            register [addr] <= register [addr];
    end
    end

        assign rdata = (sel & ~wr) ? register [addr]: 0;

endmodule
`timescale 1ns / 1ps
module tb_memory_8x4 #(parameter addr_width=2, depth=8, write=4, read=4)( );

reg clk, rstn;
reg [addr_width-1:0] addr;
reg wr, sel;
reg [write-1:0] wdata;
wire [read-1:0] rdata;

    memory_8x4bit ram(.clk(clk), .rstn(rstn), .addr(addr), .wr(wr), .sel(sel), .wdata(wdata), .rdata(rdata));

    always #5 clk=~clk;
    
    initial
    begin
    clk=0;
    rstn=0;
    addr=2'b00;
    wr=0;
    sel=0;
    wdata=4'h0;
    #10
    
    rstn=1;
    wr=1; sel=1; 
    addr=2'b00;
    wdata= 4'b0011;
    
    #20
    addr=2'b11;
    wdata=4'b1110;
    
    #15
    addr=2'b10;
    wdata=4'b1001;
    
    #16
    wr=0;
    addr=2'b00;
    
    #15
    addr=2'b11; 
    
    #15
    addr=2'b10;
    
    #150
    $finish;
    end
    
    
endmodule

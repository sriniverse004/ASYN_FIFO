`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02.09.2024 10:48:11
// Design Name: 
// Module Name: fifo
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


module asyn_fifo(wr_clk, rd_clk, rst, wr_en, rd_en, wdata, rdata, empty, full, fifo_counter);

parameter data_width = 8;
parameter fifo_depth = 16;
parameter adress_width = 4; 

input wr_clk;
input rd_clk;
input rst,wr_en,rd_en;
input [data_width-1:0] wdata;

output reg [data_width-1:0] rdata; // 8bits of data 
output reg empty;
output reg full;
output reg [3:0] fifo_counter;

reg [adress_width-1:0] wr_pntr;
reg [adress_width-1:0] rd_pntr;

// Declaring FIFO 2D Memory
reg [data_width-1:0] fifo_mem [fifo_depth-1:0];

// FIFO Counter updates empty and full condition
always @(fifo_counter) begin
    empty = (fifo_counter==0);
    full = (fifo_counter==16);
end

// Updating the FIFO counter
always @(posedge wr_clk or posedge rd_clk or posedge rst)begin
    if (rst)
        fifo_counter <= 0;
    else if ( (!full && wr_en) && (!empty && rd_en))
        fifo_counter <= fifo_counter;
    else if (!full && wr_en)
        fifo_counter <= fifo_counter+1;
    else if (!empty && rd_en)
        fifo_counter <= fifo_counter-1;
    else 
        fifo_counter <= fifo_counter;    
end

// Writing data into FIFO memory
always @(posedge wr_clk or posedge rst) begin
    if (rst) wr_pntr <= 0;
    else begin
        if (wr_en && !full) begin
            fifo_mem[wr_pntr] <= wdata;
            wr_pntr <= wr_pntr+1;
        end
        else begin
            fifo_mem[wr_pntr] <= fifo_mem[wr_pntr];
            wr_pntr <= wr_pntr;
        end
    end
end

// Reading data from FIFO memory
always @(posedge rd_clk or posedge rst) begin
    if (rst) rd_pntr <= 0;
    else begin
        if (rd_en && !empty) begin
            rdata <= fifo_mem[rd_pntr];
            rd_pntr <= rd_pntr+1;
        end
        else begin
            rdata <= rdata;
            rd_pntr <= rd_pntr;
        end
    end
end

endmodule

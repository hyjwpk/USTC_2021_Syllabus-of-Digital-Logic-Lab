module test (
    input clk,rst,uart_rx,
    output uart_tx
);
reg [1:0] printcnt;

reg uart_txreg;
assign uart_tx = uart_txreg;

reg [3:0] state;

wire rx_ready,rx_ready_edge;
wire [7:0] rx_data;
rx rx1(clk,rst,uart_rx,rx_ready,rx_data);
signal_edge signal_edge1(clk,rx_ready,rx_ready_edge);

reg errorstart;
wire erroroutput;
error error1(clk,errorstart,erroroutput);

reg datastart;
reg [7:0] pos;
reg [7:0] data0 [9:0];
reg [7:0] data1 [9:0];
reg [7:0] lastdata0,lastdata1;
wire dataoutput;
data data(clk,datastart,data0[pos],data1[pos],dataoutput);

initial begin
    printcnt = 0;
    errorstart = 0;
    datastart = 0;
    state = 0;
    data0[0] = 0;data0[1] = 0;data0[2] = 0;data0[3] = 0;data0[4] = 0;data0[5] = 0;data0[6] = 0;data0[7] = 0;data0[8] = 0;data0[9] = 0;
    data1[0] = 0;data1[1] = 0;data1[2] = 0;data1[3] = 0;data1[4] = 0;data1[5] = 0;data1[6] = 0;data1[7] = 0;data1[8] = 0;data1[9] = 0;
    lastdata0 = 0;
    lastdata1 = 0;
    pos = 0;
end

always @(*) begin
    case (printcnt)
    2'd0: uart_txreg = erroroutput;
    2'd1: uart_txreg = dataoutput;
    default: uart_txreg = dataoutput;
    endcase
end

always @(posedge clk) begin
    if(rx_ready_edge)
    begin
        case (state)
            4'd0:
                if(rx_data == 8'b01110111) state = 4'd1;
                else if(rx_data == 8'b01110010) state = 4'd7;
                else if(rx_data == 8'b00001010) state = 4'd11;
                else state = 4'd10;
            4'd1:
                if(rx_data == 8'b00100000) state = 4'd2;
                else if(rx_data == 8'b00001010) state = 4'd11;
                else state = 4'd10;
            4'd2:
                if(rx_data >= 8'b00110000 && rx_data <= 8'b00111001)
                begin
                    pos = rx_data - 8'b00110000;
                    state = 4'd3;
                end 
                else if(rx_data == 8'b00001010) state = 4'd11;
                else state = 4'd10;
            4'd3:
                if(rx_data == 8'b00100000) state = 4'd4;
                else if(rx_data == 8'b00001010) state = 4'd11;
                else state = 4'd10;
            4'd4:
                if(rx_data != 8'b00001010)
                begin
                    lastdata0 = data0[pos];
                    data0[pos] = rx_data;
                    state = 4'd5;
                end 
                else if(rx_data == 8'b00001010) state = 4'd11;
                else state = 4'd10;
            4'd5:
                if(rx_data != 8'b00001010)
                begin
                    lastdata1 = data1[pos];
                    data1[pos] = rx_data;
                    state = 4'd6;
                end 
                else if(rx_data == 8'b00001010) state = 4'd11;
                else state = 4'd10;
            4'd6:
                if(rx_data == 8'b00001010) state = 4'd0;
                else
                begin
                    data0[pos] = lastdata0;
                    data1[pos] = lastdata1;
                    state = 4'd10;
                end
            4'd7:
                if(rx_data == 8'b00100000) state = 4'd8;
                else if(rx_data == 8'b00001010) state = 4'd11;
                else state = 4'd10;
            4'd8:
                if(rx_data >= 8'b00110000 && rx_data <= 8'b00111001)
                begin
                    pos = rx_data - 8'b00110000;
                    state = 4'd9;
                end 
                else if(rx_data == 8'b00001010) state = 4'd11;
                else state = 4'd10;
            4'd9:
                if(rx_data == 8'b00001010) state = 4'd12;
                else state = 4'd10;
            4'd10:
                if(rx_data == 8'b00001010) state = 4'd11;
                else state = 4'd10;
            default: ;
        endcase
        if(state == 4'd12) 
        begin
            printcnt <= 2'd1;
            datastart <= 1;
            state <= 4'd0;
        end
        else ;
        if(state == 4'd11) 
        begin
            printcnt <= 0;
            errorstart <= 1;
            state <= 4'd0;
        end
        else ;
    end
    else
    begin
        datastart <= 0;
        errorstart <= 0;
    end
end

endmodule

module error (
input clk,start,
output uart_tx 
);

wire start_edge;
signal_edge signal_edge1(clk,start,start_edge);

reg tx_ready;
reg [7:0] tx_data;
tx tx1(clk,0,uart_tx,tx_ready,tx_data);

reg [2:0] state;
reg [31:0] counter;

initial begin
    tx_ready = 0;
    state = 0;
    counter = 0;
end

always @(posedge clk) begin
    if(start_edge == 1) 
    begin
        tx_ready <= 1;
        counter <= 32'd1000;
        tx_data <= 8'b01000101;
        state <= 3'd4;
    end
    else if(counter > 0) counter <= counter-1;
    else if(counter == 0)
        case (state)
            3'd4: 
            begin
                tx_ready <= 0;
                counter <= 32'd9416;
                state = 3'd3;
            end
            3'd3:
            begin
                tx_ready <= 1;
                counter <= 32'd1000;
                tx_data <= 8'b00100001;
                state <= 3'd2;
            end
            3'd2:
            begin
                tx_ready <= 0;
                counter <= 32'd9416;
                state = 3'd1;
            end
            3'd1:
            begin
                tx_ready <= 1;
                counter <= 32'd1000;
                tx_data <= 8'b00001010;
                state <= 3'd0;
            end
            3'd0:tx_ready <= 0;
            default: ;
        endcase
    else;
end

endmodule

module data (
input clk,start,
input [7:0] data0,data1,
output uart_tx 
);

wire start_edge;
signal_edge signal_edge1(clk,start,start_edge);

reg tx_ready;
reg [7:0] tx_data;
tx tx1(clk,0,uart_tx,tx_ready,tx_data);

reg [2:0] state;
reg [31:0] counter;

initial begin
    tx_ready = 0;
    state = 0;
    counter = 0;
end

always @(posedge clk) begin
    if(start_edge == 1) 
    begin
        tx_ready <= 1;
        counter <= 32'd1000;
        tx_data <= data0;
        state <= 3'd4;
    end
    else if(counter > 0) counter <= counter-1;
    else if(counter == 0)
        case (state)
            3'd4: 
            begin
                tx_ready <= 0;
                counter <= 32'd9416;
                state = 3'd3;
            end
            3'd3:
            begin
                tx_ready <= 1;
                counter <= 32'd1000;
                tx_data <= data1;
                state <= 3'd2;
            end
            3'd2:
            begin
                tx_ready <= 0;
                counter <= 32'd9416;
                state = 3'd1;
            end
            3'd1:
            begin
                tx_ready <= 1;
                counter <= 32'd1000;
                tx_data <= 8'b00001010;
                state <= 3'd0;
            end
            3'd0:tx_ready <= 0;
            default: ;
        endcase
    else;
end

endmodule
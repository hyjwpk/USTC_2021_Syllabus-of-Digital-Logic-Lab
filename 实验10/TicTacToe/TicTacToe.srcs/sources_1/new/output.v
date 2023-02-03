module error (
input clk,start,
output uart_tx 
);

wire start_edge;
signal_edge signal_edge(clk,start,start_edge);

reg tx_ready;
reg [7:0] tx_data;
tx tx(clk,0,uart_tx,tx_ready,tx_data);

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

module help (
input clk,start,
output uart_tx 
);

wire start_edge;
signal_edge signal_edge(clk,start,start_edge);

reg tx_ready;
reg [7:0] tx_data;
tx tx(clk,0,uart_tx,tx_ready,tx_data);

reg [7:0] state;
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
        tx_data <= 8'b00101101;
        state <= 8'd255;
    end
    else if(counter > 0) counter <= counter-1;
    else if(counter == 0)
        case (state)
        8'd255:
        begin
            tx_ready <= 0;
            counter <= 32'd9416;
            state <= 8'd254;
        end
        8'd254:
        begin
            tx_ready <= 1;
            counter <= 32'd1000;
            tx_data <= 8'b01101000;
            state <= 8'd253;
        end
        8'd253:
        begin
            tx_ready <= 0;
            counter <= 32'd9416;
            state <= 8'd252;
        end
        8'd252:
        begin
            tx_ready <= 1;
            counter <= 32'd1000;
            tx_data <= 8'b00100000;
            state <= 8'd251;
        end
        8'd251:
        begin
            tx_ready <= 0;
            counter <= 32'd9416;
            state <= 8'd250;
        end
        8'd250:
        begin
            tx_ready <= 1;
            counter <= 32'd1000;
            tx_data <= 8'b01101000;
            state <= 8'd249;
        end
        8'd249:
        begin
            tx_ready <= 0;
            counter <= 32'd9416;
            state <= 8'd248;
        end
        8'd248:
        begin
            tx_ready <= 1;
            counter <= 32'd1000;
            tx_data <= 8'b01100101;
            state <= 8'd247;
        end
        8'd247:
        begin
            tx_ready <= 0;
            counter <= 32'd9416;
            state <= 8'd246;
        end
        8'd246:
        begin
            tx_ready <= 1;
            counter <= 32'd1000;
            tx_data <= 8'b01101100;
            state <= 8'd245;
        end
        8'd245:
        begin
            tx_ready <= 0;
            counter <= 32'd9416;
            state <= 8'd244;
        end
        8'd244:
        begin
            tx_ready <= 1;
            counter <= 32'd1000;
            tx_data <= 8'b01110000;
            state <= 8'd243;
        end
        8'd243:
        begin
            tx_ready <= 0;
            counter <= 32'd9416;
            state <= 8'd242;
        end
        8'd242:
        begin
            tx_ready <= 1;
            counter <= 32'd1000;
            tx_data <= 8'b00001010;
            state <= 8'd241;
        end
        8'd241:
        begin
            tx_ready <= 0;
            counter <= 32'd9416;
            state <= 8'd240;
        end
        8'd240:
        begin
            tx_ready <= 1;
            counter <= 32'd1000;
            tx_data <= 8'b00101101;
            state <= 8'd239;
        end
        8'd239:
        begin
            tx_ready <= 0;
            counter <= 32'd9416;
            state <= 8'd238;
        end
        8'd238:
        begin
            tx_ready <= 1;
            counter <= 32'd1000;
            tx_data <= 8'b01100100;
            state <= 8'd237;
        end
        8'd237:
        begin
            tx_ready <= 0;
            counter <= 32'd9416;
            state <= 8'd236;
        end
        8'd236:
        begin
            tx_ready <= 1;
            counter <= 32'd1000;
            tx_data <= 8'b00100000;
            state <= 8'd235;
        end
        8'd235:
        begin
            tx_ready <= 0;
            counter <= 32'd9416;
            state <= 8'd234;
        end
        8'd234:
        begin
            tx_ready <= 1;
            counter <= 32'd1000;
            tx_data <= 8'b01100100;
            state <= 8'd233;
        end
        8'd233:
        begin
            tx_ready <= 0;
            counter <= 32'd9416;
            state <= 8'd232;
        end
        8'd232:
        begin
            tx_ready <= 1;
            counter <= 32'd1000;
            tx_data <= 8'b01101001;
            state <= 8'd231;
        end
        8'd231:
        begin
            tx_ready <= 0;
            counter <= 32'd9416;
            state <= 8'd230;
        end
        8'd230:
        begin
            tx_ready <= 1;
            counter <= 32'd1000;
            tx_data <= 8'b01110011;
            state <= 8'd229;
        end
        8'd229:
        begin
            tx_ready <= 0;
            counter <= 32'd9416;
            state <= 8'd228;
        end
        8'd228:
        begin
            tx_ready <= 1;
            counter <= 32'd1000;
            tx_data <= 8'b01110000;
            state <= 8'd227;
        end
        8'd227:
        begin
            tx_ready <= 0;
            counter <= 32'd9416;
            state <= 8'd226;
        end
        8'd226:
        begin
            tx_ready <= 1;
            counter <= 32'd1000;
            tx_data <= 8'b01101100;
            state <= 8'd225;
        end
        8'd225:
        begin
            tx_ready <= 0;
            counter <= 32'd9416;
            state <= 8'd224;
        end
        8'd224:
        begin
            tx_ready <= 1;
            counter <= 32'd1000;
            tx_data <= 8'b01100001;
            state <= 8'd223;
        end
        8'd223:
        begin
            tx_ready <= 0;
            counter <= 32'd9416;
            state <= 8'd222;
        end
        8'd222:
        begin
            tx_ready <= 1;
            counter <= 32'd1000;
            tx_data <= 8'b01111001;
            state <= 8'd221;
        end
        8'd221:
        begin
            tx_ready <= 0;
            counter <= 32'd9416;
            state <= 8'd220;
        end
        8'd220:
        begin
            tx_ready <= 1;
            counter <= 32'd1000;
            tx_data <= 8'b00001010;
            state <= 8'd219;
        end
        8'd219:
        begin
            tx_ready <= 0;
            counter <= 32'd9416;
            state <= 8'd218;
        end
        8'd218:
        begin
            tx_ready <= 1;
            counter <= 32'd1000;
            tx_data <= 8'b00101101;
            state <= 8'd217;
        end
        8'd217:
        begin
            tx_ready <= 0;
            counter <= 32'd9416;
            state <= 8'd216;
        end
        8'd216:
        begin
            tx_ready <= 1;
            counter <= 32'd1000;
            tx_data <= 8'b01110000;
            state <= 8'd215;
        end
        8'd215:
        begin
            tx_ready <= 0;
            counter <= 32'd9416;
            state <= 8'd214;
        end
        8'd214:
        begin
            tx_ready <= 1;
            counter <= 32'd1000;
            tx_data <= 8'b00100000;
            state <= 8'd213;
        end
        8'd213:
        begin
            tx_ready <= 0;
            counter <= 32'd9416;
            state <= 8'd212;
        end
        8'd212:
        begin
            tx_ready <= 1;
            counter <= 32'd1000;
            tx_data <= 8'b01110000;
            state <= 8'd211;
        end
        8'd211:
        begin
            tx_ready <= 0;
            counter <= 32'd9416;
            state <= 8'd210;
        end
        8'd210:
        begin
            tx_ready <= 1;
            counter <= 32'd1000;
            tx_data <= 8'b01101001;
            state <= 8'd209;
        end
        8'd209:
        begin
            tx_ready <= 0;
            counter <= 32'd9416;
            state <= 8'd208;
        end
        8'd208:
        begin
            tx_ready <= 1;
            counter <= 32'd1000;
            tx_data <= 8'b01100101;
            state <= 8'd207;
        end
        8'd207:
        begin
            tx_ready <= 0;
            counter <= 32'd9416;
            state <= 8'd206;
        end
        8'd206:
        begin
            tx_ready <= 1;
            counter <= 32'd1000;
            tx_data <= 8'b01100011;
            state <= 8'd205;
        end
        8'd205:
        begin
            tx_ready <= 0;
            counter <= 32'd9416;
            state <= 8'd204;
        end
        8'd204:
        begin
            tx_ready <= 1;
            counter <= 32'd1000;
            tx_data <= 8'b01100101;
            state <= 8'd203;
        end
        8'd203:
        begin
            tx_ready <= 0;
            counter <= 32'd9416;
            state <= 8'd202;
        end
        8'd202:
        begin
            tx_ready <= 1;
            counter <= 32'd1000;
            tx_data <= 8'b00001010;
            state <= 8'd201;
        end
        8'd201:
        begin
            tx_ready <= 0;
            counter <= 32'd9416;
            state <= 8'd200;
        end
        8'd200:
        begin
            tx_ready <= 1;
            counter <= 32'd1000;
            tx_data <= 8'b00101101;
            state <= 8'd199;
        end
        8'd199:
        begin
            tx_ready <= 0;
            counter <= 32'd9416;
            state <= 8'd198;
        end
        8'd198:
        begin
            tx_ready <= 1;
            counter <= 32'd1000;
            tx_data <= 8'b01100010;
            state <= 8'd197;
        end
        8'd197:
        begin
            tx_ready <= 0;
            counter <= 32'd9416;
            state <= 8'd196;
        end
        8'd196:
        begin
            tx_ready <= 1;
            counter <= 32'd1000;
            tx_data <= 8'b00100000;
            state <= 8'd195;
        end
        8'd195:
        begin
            tx_ready <= 0;
            counter <= 32'd9416;
            state <= 8'd194;
        end
        8'd194:
        begin
            tx_ready <= 1;
            counter <= 32'd1000;
            tx_data <= 8'b01100010;
            state <= 8'd193;
        end
        8'd193:
        begin
            tx_ready <= 0;
            counter <= 32'd9416;
            state <= 8'd192;
        end
        8'd192:
        begin
            tx_ready <= 1;
            counter <= 32'd1000;
            tx_data <= 8'b01100001;
            state <= 8'd191;
        end
        8'd191:
        begin
            tx_ready <= 0;
            counter <= 32'd9416;
            state <= 8'd190;
        end
        8'd190:
        begin
            tx_ready <= 1;
            counter <= 32'd1000;
            tx_data <= 8'b01100011;
            state <= 8'd189;
        end
        8'd189:
        begin
            tx_ready <= 0;
            counter <= 32'd9416;
            state <= 8'd188;
        end
        8'd188:
        begin
            tx_ready <= 1;
            counter <= 32'd1000;
            tx_data <= 8'b01101011;
            state <= 8'd187;
        end
        8'd187:
        begin
            tx_ready <= 0;
            counter <= 32'd9416;
            state <= 8'd186;
        end
        8'd186:
        begin
            tx_ready <= 1;
            counter <= 32'd1000;
            tx_data <= 8'b00001010;
            state <= 8'd185;
        end
        8'd185:
        begin
            tx_ready <= 0;
            counter <= 32'd9416;
            state <= 8'd184;
        end
        8'd184:
        begin
            tx_ready <= 1;
            counter <= 32'd1000;
            tx_data <= 8'b00101101;
            state <= 8'd183;
        end
        8'd183:
        begin
            tx_ready <= 0;
            counter <= 32'd9416;
            state <= 8'd182;
        end
        8'd182:
        begin
            tx_ready <= 1;
            counter <= 32'd1000;
            tx_data <= 8'b01110010;
            state <= 8'd181;
        end
        8'd181:
        begin
            tx_ready <= 0;
            counter <= 32'd9416;
            state <= 8'd180;
        end
        8'd180:
        begin
            tx_ready <= 1;
            counter <= 32'd1000;
            tx_data <= 8'b00100000;
            state <= 8'd179;
        end
        8'd179:
        begin
            tx_ready <= 0;
            counter <= 32'd9416;
            state <= 8'd178;
        end
        8'd178:
        begin
            tx_ready <= 1;
            counter <= 32'd1000;
            tx_data <= 8'b01110010;
            state <= 8'd177;
        end
        8'd177:
        begin
            tx_ready <= 0;
            counter <= 32'd9416;
            state <= 8'd176;
        end
        8'd176:
        begin
            tx_ready <= 1;
            counter <= 32'd1000;
            tx_data <= 8'b01100101;
            state <= 8'd175;
        end
        8'd175:
        begin
            tx_ready <= 0;
            counter <= 32'd9416;
            state <= 8'd174;
        end
        8'd174:
        begin
            tx_ready <= 1;
            counter <= 32'd1000;
            tx_data <= 8'b01110011;
            state <= 8'd173;
        end
        8'd173:
        begin
            tx_ready <= 0;
            counter <= 32'd9416;
            state <= 8'd172;
        end
        8'd172:
        begin
            tx_ready <= 1;
            counter <= 32'd1000;
            tx_data <= 8'b01100101;
            state <= 8'd171;
        end
        8'd171:
        begin
            tx_ready <= 0;
            counter <= 32'd9416;
            state <= 8'd170;
        end
        8'd170:
        begin
            tx_ready <= 1;
            counter <= 32'd1000;
            tx_data <= 8'b01110100;
            state <= 8'd169;
        end
        8'd169:
        begin
            tx_ready <= 0;
            counter <= 32'd9416;
            state <= 8'd168;
        end
        8'd168:
        begin
            tx_ready <= 1;
            counter <= 32'd1000;
            tx_data <= 8'b00001010;
            state <= 8'd167;
        end
        8'd167:
        begin
            tx_ready <= 0;
            counter <= 32'd9416;
            state <= 8'd166;
        end
        8'd166:
        begin
            tx_ready <= 1;
            counter <= 32'd1000;
            tx_data <= 8'b00101101;
            state <= 8'd165;
        end
        8'd165:
        begin
            tx_ready <= 0;
            counter <= 32'd9416;
            state <= 8'd164;
        end
        8'd164:
        begin
            tx_ready <= 1;
            counter <= 32'd1000;
            tx_data <= 8'b01100001;
            state <= 8'd163;
        end
        8'd163:
        begin
            tx_ready <= 0;
            counter <= 32'd9416;
            state <= 8'd162;
        end
        8'd162:
        begin
            tx_ready <= 1;
            counter <= 32'd1000;
            tx_data <= 8'b00100000;
            state <= 8'd161;
        end
        8'd161:
        begin
            tx_ready <= 0;
            counter <= 32'd9416;
            state <= 8'd160;
        end
        8'd160:
        begin
            tx_ready <= 1;
            counter <= 32'd1000;
            tx_data <= 8'b01100001;
            state <= 8'd159;
        end
        8'd159:
        begin
            tx_ready <= 0;
            counter <= 32'd9416;
            state <= 8'd158;
        end
        8'd158:
        begin
            tx_ready <= 1;
            counter <= 32'd1000;
            tx_data <= 8'b01101001;
            state <= 8'd157;
        end
        8'd157:
        begin
            tx_ready <= 0;
            counter <= 32'd9416;
            state <= 8'd156;
        end
        8'd156:
        begin
            tx_ready <= 1;
            counter <= 32'd1000;
            tx_data <= 8'b00001010;
            state <= 8'd155;
        end
        8'd155:
        begin
            tx_ready <= 0;
            counter <= 32'd9416;
            state <= 8'd154;
        end
        8'd154:
        begin
            tx_ready <= 1;
            counter <= 32'd1000;
            tx_data <= 8'b00101101;
            state <= 8'd153;
        end
        8'd153:
        begin
            tx_ready <= 0;
            counter <= 32'd9416;
            state <= 8'd152;
        end
        8'd152:
        begin
            tx_ready <= 1;
            counter <= 32'd1000;
            tx_data <= 8'b01101001;
            state <= 8'd151;
        end
        8'd151:
        begin
            tx_ready <= 0;
            counter <= 32'd9416;
            state <= 8'd150;
        end
        8'd150:
        begin
            tx_ready <= 1;
            counter <= 32'd1000;
            tx_data <= 8'b00100000;
            state <= 8'd149;
        end
        8'd149:
        begin
            tx_ready <= 0;
            counter <= 32'd9416;
            state <= 8'd148;
        end
        8'd148:
        begin
            tx_ready <= 1;
            counter <= 32'd1000;
            tx_data <= 8'b01101001;
            state <= 8'd147;
        end
        8'd147:
        begin
            tx_ready <= 0;
            counter <= 32'd9416;
            state <= 8'd146;
        end
        8'd146:
        begin
            tx_ready <= 1;
            counter <= 32'd1000;
            tx_data <= 8'b01101110;
            state <= 8'd145;
        end
        8'd145:
        begin
            tx_ready <= 0;
            counter <= 32'd9416;
            state <= 8'd144;
        end
        8'd144:
        begin
            tx_ready <= 1;
            counter <= 32'd1000;
            tx_data <= 8'b01100110;
            state <= 8'd143;
        end
        8'd143:
        begin
            tx_ready <= 0;
            counter <= 32'd9416;
            state <= 8'd142;
        end
        8'd142:
        begin
            tx_ready <= 1;
            counter <= 32'd1000;
            tx_data <= 8'b01101111;
            state <= 8'd141;
        end
        8'd141:
        begin
            tx_ready <= 0;
            counter <= 32'd9416;
            state <= 8'd140;
        end
        8'd140:
        begin
            tx_ready <= 1;
            counter <= 32'd1000;
            tx_data <= 8'b00001010;
            state <= 8'd0;
        end
        8'd0:tx_ready <= 0;
        default: ;
        endcase
    else;
end

endmodule

module display (
input clk,start,
input [7:0] line11,line12,line13,line21,line22,line23,line31,line32,line33,
input [1:0] win,
input airun,
output uart_tx,done 
);

wire start_edge;
signal_edge signal_edge(clk,start,start_edge);

reg tx_ready;
reg [7:0] tx_data;
tx tx(clk,0,uart_tx,tx_ready,tx_data);

reg [5:0] state;
reg [31:0] counter;

initial begin
    tx_ready = 0;
    state = 0;
    counter = 0;
end

assign done=(state>6'd35)?1:0;

always @(posedge clk) begin
    if(start_edge == 1) 
    begin
        tx_ready <= 1;
        counter <= 32'd1000;
        tx_data <= line11;
        state <= 6'd1;
    end
    else if(counter > 0) counter <= counter-1;
    else if(counter == 0)
        case (state)
            6'd1: 
            begin
                tx_ready <= 0;
                counter <= 32'd9416;
                state <= 6'd2;
            end
            6'd2:
            begin
                tx_ready <= 1;
                counter <= 32'd1000;
                tx_data <= line12;
                state <= 6'd3;
            end
            6'd3:
            begin
                tx_ready <= 0;
                counter <= 32'd9416;
                state <= 6'd4;
            end
            6'd4:
            begin
                tx_ready <= 1;
                counter <= 32'd1000;
                tx_data <= line13;
                state <= 6'd5;
            end
            6'd5:
            begin
                tx_ready <= 0;
                counter <= 32'd9416;
                state <= 6'd6;
            end
            6'd6:
            begin
                tx_ready <= 1;
                counter <= 32'd1000;
                tx_data <= 8'b00001010;
                state <= 6'd7;
            end
            6'd7:
            begin
                tx_ready <= 0;
                counter <= 32'd9416;
                state <= 6'd8;
            end
            6'd8:
            begin
                tx_ready <= 1;
                counter <= 32'd1000;
                tx_data <= line21;
                state <= 6'd9;
            end
            6'd9:
            begin
                tx_ready <= 0;
                counter <= 32'd9416;
                state <= 6'd10;
            end
            6'd10:
            begin
                tx_ready <= 1;
                counter <= 32'd1000;
                tx_data <= line22;
                state <= 6'd11;
            end
            6'd11:
            begin
                tx_ready <= 0;
                counter <= 32'd9416;
                state <= 6'd12;
            end
            6'd12:
            begin
                tx_ready <= 1;
                counter <= 32'd1000;
                tx_data <= line23;
                state <= 6'd13;
            end
            6'd13:
            begin
                tx_ready <= 0;
                counter <= 32'd9416;
                state <= 6'd14;
            end
            6'd14:
            begin
                tx_ready <= 1;
                counter <= 32'd1000;
                tx_data <= 8'b00001010;
                state <= 6'd15;
            end
            6'd15:
            begin
                tx_ready <= 0;
                counter <= 32'd9416;
                state <= 6'd16;
            end
            6'd16:
            begin
                tx_ready <= 1;
                counter <= 32'd1000;
                tx_data <= line31;
                state <= 6'd17;
            end
            6'd17:
            begin
                tx_ready <= 0;
                counter <= 32'd9416;
                state <= 6'd18;
            end
            6'd18:
            begin
                tx_ready <= 1;
                counter <= 32'd1000;
                tx_data <= line32;
                state <= 6'd19;
            end
            6'd19:
            begin
                tx_ready <= 0;
                counter <= 32'd9416;
                state <= 6'd20;
            end
            6'd20:
            begin
                tx_ready <= 1;
                counter <= 32'd1000;
                tx_data <= line33;
                state <= 6'd21;
            end
            6'd21:
            begin
                tx_ready <= 0;
                counter <= 32'd9416;
                state <= 6'd22;
            end
            6'd22:
            begin
                tx_ready <= 1;
                counter <= 32'd1000;
                tx_data <= 8'b00001010;
                state <= 6'd23;
            end
            6'd23:
            begin
                tx_ready <= 0;
                counter <= 32'd9416;
                if(win==2'd1) 
                    if(airun) state <= 6'd40;
                    else state <= 6'd24;
                else if(win==2'd2) state <= 6'd24;
                else state <= 6'd0;
            end
            6'd24:
            begin
                tx_ready <= 1;
                counter <= 32'd1000;
                tx_data <= 8'b01110000;
                state <= 6'd25;
            end
            6'd25:
            begin
                tx_ready <= 0;
                counter <= 32'd9416;
                state <= 6'd26;
            end
            6'd26:
            begin
                tx_ready <= 1;
                counter <= 32'd1000;
                tx_data <= 8'b01101100;
                state <= 6'd27;
            end
            6'd27:
            begin
                tx_ready <= 0;
                counter <= 32'd9416;
                state <= 6'd28;
            end
            6'd28:
            begin
                tx_ready <= 1;
                counter <= 32'd1000;
                tx_data <= 8'b01100001;
                state <= 6'd29;
            end
            6'd29:
            begin
                tx_ready <= 0;
                counter <= 32'd9416;
                state <= 6'd30;
            end
            6'd30:
            begin
                tx_ready <= 1;
                counter <= 32'd1000;
                tx_data <= 8'b01111001;
                state <= 6'd31;
            end
            6'd31:
            begin
                tx_ready <= 0;
                counter <= 32'd9416;
                state <= 6'd32;
            end
            6'd32:
            begin
                tx_ready <= 1;
                counter <= 32'd1000;
                tx_data <= 8'b01100101;
                state <= 6'd33;
            end
            6'd33:
            begin
                tx_ready <= 0;
                counter <= 32'd9416;
                state <= 6'd34;
            end
            6'd34:
            begin
                tx_ready <= 1;
                counter <= 32'd1000;
                tx_data <= 8'b01110010;
                state <= 6'd35;
            end
            6'd35:
            begin
                tx_ready <= 0;
                counter <= 32'd9416;
                if(airun) state <= 6'd44;
                else if(win==2'd1) state <= 6'd36;
                else if(win==2'd2) state <= 6'd38;
            end
            6'd36:
            begin
                tx_ready <= 1;
                counter <= 32'd1000;
                tx_data <= 8'b00110001;//player1
                state <= 6'd37;
            end
            6'd37:
            begin
                tx_ready <= 0;
                counter <= 32'd9416;
                state <= 6'd44;
            end
            6'd38:
            begin
                tx_ready <= 1;
                counter <= 32'd1000;
                tx_data <= 8'b00110010;//player2
                state <= 6'd39;
            end
            6'd39:
            begin
                tx_ready <= 0;
                counter <= 32'd9416;
                state <= 6'd44;
            end
            6'd40:
            begin
                tx_ready <= 1;
                counter <= 32'd1000;
                tx_data <= 8'b01100001;//a
                state <= 6'd41;
            end
            6'd41:
            begin
                tx_ready <= 0;
                counter <= 32'd9416;
                state <= 6'd42;
            end
            6'd42:
            begin
                tx_ready <= 1;
                counter <= 32'd1000;
                tx_data <= 8'b01101001;//i
                state <= 6'd43;
            end
            6'd43:
            begin
                tx_ready <= 0;
                counter <= 32'd9416;
                state <= 6'd44;
            end
            6'd44:
            begin
                tx_ready <= 1;
                counter <= 32'd1000;
                tx_data <= 8'b00100000;
                state <= 6'd45;
            end
            6'd45:
            begin
                tx_ready <= 0;
                counter <= 32'd9416;
                state <= 6'd46;
            end
            6'd46:
            begin
                tx_ready <= 1;
                counter <= 32'd1000;
                tx_data <= 8'b01110111;//w
                state <= 6'd47;
            end
            6'd47:
            begin
                tx_ready <= 0;
                counter <= 32'd9416;
                state <= 6'd48;
            end
            6'd48:
            begin
                tx_ready <= 1;
                counter <= 32'd1000;
                tx_data <= 8'b01101001;
                state <= 6'd49;
            end
            6'd49:
            begin
                tx_ready <= 0;
                counter <= 32'd9416;
                state <= 6'd50;
            end
            6'd50:
            begin
                tx_ready <= 1;
                counter <= 32'd1000;
                tx_data <= 8'b01101110;
                state <= 6'd51;
            end
            6'd51:
            begin
                tx_ready <= 0;
                counter <= 32'd9416;
                state <= 6'd52;
            end
            6'd52:
            begin
                tx_ready <= 1;
                counter <= 32'd1000;
                tx_data <= 8'b00100001;
                state <= 6'd53;
            end
            6'd53:
            begin
                tx_ready <= 0;
                counter <= 32'd9416;
                state <= 6'd54;
            end
            6'd54:
            begin
                tx_ready <= 1;
                counter <= 32'd1000;
                tx_data <= 8'b00001010;
                state <= 6'd0;
            end
            6'd0:tx_ready <= 0;
            default: ;
        endcase
    else;
end

endmodule

module info (
input clk,start,
input [3:0] player1winnum,player2winnum,playerwinnum,aiwinnum,
output uart_tx
);

wire start_edge;
signal_edge signal_edge(clk,start,start_edge);

reg tx_ready;
reg [7:0] tx_data;
tx tx(clk,0,uart_tx,tx_ready,tx_data);

reg [7:0] state;
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
        tx_data <= 8'b01011011;
        state <= 8'd1;
    end
    else if(counter > 0) counter <= counter-1;
    else if(counter == 0)
        case (state)
            8'd1:
            begin
                tx_ready <= 0;
                counter <= 32'd9416;
                state <= 8'd2;
            end
            8'd2:
            begin
                tx_ready <= 1;
                counter <= 32'd1000;
                tx_data <= 8'b01110000;
                state <= 8'd3;
            end
            8'd3:
            begin
                tx_ready <= 0;
                counter <= 32'd9416;
                state <= 8'd4;
            end
            8'd4:
            begin
                tx_ready <= 1;
                counter <= 32'd1000;
                tx_data <= 8'b01101100;
                state <= 8'd5;
            end
            8'd5:
            begin
                tx_ready <= 0;
                counter <= 32'd9416;
                state <= 8'd6;
            end
            8'd6:
            begin
                tx_ready <= 1;
                counter <= 32'd1000;
                tx_data <= 8'b01100001;
                state <= 8'd7;
            end
            8'd7:
            begin
                tx_ready <= 0;
                counter <= 32'd9416;
                state <= 8'd8;
            end
            8'd8:
            begin
                tx_ready <= 1;
                counter <= 32'd1000;
                tx_data <= 8'b01111001;
                state <= 8'd9;
            end
            8'd9:
            begin
                tx_ready <= 0;
                counter <= 32'd9416;
                state <= 8'd10;
            end
            8'd10:
            begin
                tx_ready <= 1;
                counter <= 32'd1000;
                tx_data <= 8'b01100101;
                state <= 8'd11;
            end
            8'd11:
            begin
                tx_ready <= 0;
                counter <= 32'd9416;
                state <= 8'd12;
            end
            8'd12:
            begin
                tx_ready <= 1;
                counter <= 32'd1000;
                tx_data <= 8'b01110010;
                state <= 8'd13;
            end
            8'd13:
            begin
                tx_ready <= 0;
                counter <= 32'd9416;
                state <= 8'd14;
            end
            8'd14:
            begin
                tx_ready <= 1;
                counter <= 32'd1000;
                tx_data <= 8'b00110001;
                state <= 8'd15;
            end
            8'd15:
            begin
                tx_ready <= 0;
                counter <= 32'd9416;
                state <= 8'd16;
            end
            8'd16:
            begin
                tx_ready <= 1;
                counter <= 32'd1000;
                tx_data <= 8'b01011101;
                state <= 8'd17;
            end
            8'd17:
            begin
                tx_ready <= 0;
                counter <= 32'd9416;
                state <= 8'd18;
            end
            8'd18:
            begin
                tx_ready <= 1;
                counter <= 32'd1000;
                tx_data <= 8'b00100000;
                state <= 8'd19;
            end
            8'd19:
            begin
                tx_ready <= 0;
                counter <= 32'd9416;
                state <= 8'd20;
            end
            8'd20:
            begin
                tx_ready <= 1;
                counter <= 32'd1000;
                tx_data <= 8'b00110000 + player1winnum;
                state <= 8'd21;
            end
            8'd21:
            begin
                tx_ready <= 0;
                counter <= 32'd9416;
                state <= 8'd22;
            end
            8'd22:
            begin
                tx_ready <= 1;
                counter <= 32'd1000;
                tx_data <= 8'b00100000;
                state <= 8'd23;
            end
            8'd23:
            begin
                tx_ready <= 0;
                counter <= 32'd9416;
                state <= 8'd24;
            end
            8'd24:
            begin
                tx_ready <= 1;
                counter <= 32'd1000;
                tx_data <= 8'b00111010;
                state <= 8'd25;
            end
            8'd25:
            begin
                tx_ready <= 0;
                counter <= 32'd9416;
                state <= 8'd26;
            end
            8'd26:
            begin
                tx_ready <= 1;
                counter <= 32'd1000;
                tx_data <= 8'b00100000;
                state <= 8'd27;
            end
            8'd27:
            begin
                tx_ready <= 0;
                counter <= 32'd9416;
                state <= 8'd28;
            end
            8'd28:
            begin
                tx_ready <= 1;
                counter <= 32'd1000;
                tx_data <= 8'b00110000 + player2winnum;
                state <= 8'd29;
            end
            8'd29:
            begin
                tx_ready <= 0;
                counter <= 32'd9416;
                state <= 8'd30;
            end
            8'd30:
            begin
                tx_ready <= 1;
                counter <= 32'd1000;
                tx_data <= 8'b00100000;
                state <= 8'd31;
            end
            8'd31:
            begin
                tx_ready <= 0;
                counter <= 32'd9416;
                state <= 8'd32;
            end
            8'd32:
            begin
                tx_ready <= 1;
                counter <= 32'd1000;
                tx_data <= 8'b01011011;
                state <= 8'd33;
            end
            8'd33:
            begin
                tx_ready <= 0;
                counter <= 32'd9416;
                state <= 8'd34;
            end
            8'd34:
            begin
                tx_ready <= 1;
                counter <= 32'd1000;
                tx_data <= 8'b01110000;
                state <= 8'd35;
            end
            8'd35:
            begin
                tx_ready <= 0;
                counter <= 32'd9416;
                state <= 8'd36;
            end
            8'd36:
            begin
                tx_ready <= 1;
                counter <= 32'd1000;
                tx_data <= 8'b01101100;
                state <= 8'd37;
            end
            8'd37:
            begin
                tx_ready <= 0;
                counter <= 32'd9416;
                state <= 8'd38;
            end
            8'd38:
            begin
                tx_ready <= 1;
                counter <= 32'd1000;
                tx_data <= 8'b01100001;
                state <= 8'd39;
            end
            8'd39:
            begin
                tx_ready <= 0;
                counter <= 32'd9416;
                state <= 8'd40;
            end
            8'd40:
            begin
                tx_ready <= 1;
                counter <= 32'd1000;
                tx_data <= 8'b01111001;
                state <= 8'd41;
            end
            8'd41:
            begin
                tx_ready <= 0;
                counter <= 32'd9416;
                state <= 8'd42;
            end
            8'd42:
            begin
                tx_ready <= 1;
                counter <= 32'd1000;
                tx_data <= 8'b01100101;
                state <= 8'd43;
            end
            8'd43:
            begin
                tx_ready <= 0;
                counter <= 32'd9416;
                state <= 8'd44;
            end
            8'd44:
            begin
                tx_ready <= 1;
                counter <= 32'd1000;
                tx_data <= 8'b01110010;
                state <= 8'd45;
            end
            8'd45:
            begin
                tx_ready <= 0;
                counter <= 32'd9416;
                state <= 8'd46;
            end
            8'd46:
            begin
                tx_ready <= 1;
                counter <= 32'd1000;
                tx_data <= 8'b00110010;
                state <= 8'd47;
            end
            8'd47:
            begin
                tx_ready <= 0;
                counter <= 32'd9416;
                state <= 8'd48;
            end
            8'd48:
            begin
                tx_ready <= 1;
                counter <= 32'd1000;
                tx_data <= 8'b01011101;
                state <= 8'd49;
            end
            8'd49:
            begin
                tx_ready <= 0;
                counter <= 32'd9416;
                state <= 8'd50;
            end
            8'd50:
            begin
                tx_ready <= 1;
                counter <= 32'd1000;
                tx_data <= 8'b00001010;
                state <= 8'd51;
            end
            8'd51:
            begin
                tx_ready <= 0;
                counter <= 32'd9416;
                state <= 8'd52;
            end
            8'd52:
            begin
                tx_ready <= 1;
                counter <= 32'd1000;
                tx_data <= 8'b01011011;
                state <= 8'd53;
            end
            8'd53:
            begin
                tx_ready <= 0;
                counter <= 32'd9416;
                state <= 8'd54;
            end
            8'd54:
            begin
                tx_ready <= 1;
                counter <= 32'd1000;
                tx_data <= 8'b01100001;
                state <= 8'd55;
            end
            8'd55:
            begin
                tx_ready <= 0;
                counter <= 32'd9416;
                state <= 8'd56;
            end
            8'd56:
            begin
                tx_ready <= 1;
                counter <= 32'd1000;
                tx_data <= 8'b01101001;
                state <= 8'd57;
            end
            8'd57:
            begin
                tx_ready <= 0;
                counter <= 32'd9416;
                state <= 8'd58;
            end
            8'd58:
            begin
                tx_ready <= 1;
                counter <= 32'd1000;
                tx_data <= 8'b01011101;
                state <= 8'd59;
            end
            8'd59:
            begin
                tx_ready <= 0;
                counter <= 32'd9416;
                state <= 8'd60;
            end
            8'd60:
            begin
                tx_ready <= 1;
                counter <= 32'd1000;
                tx_data <= 8'b00100000;
                state <= 8'd61;
            end
            8'd61:
            begin
                tx_ready <= 0;
                counter <= 32'd9416;
                state <= 8'd62;
            end
            8'd62:
            begin
                tx_ready <= 1;
                counter <= 32'd1000;
                tx_data <= 8'b00110000 + aiwinnum;
                state <= 8'd63;
            end
            8'd63:
            begin
                tx_ready <= 0;
                counter <= 32'd9416;
                state <= 8'd64;
            end
            8'd64:
            begin
                tx_ready <= 1;
                counter <= 32'd1000;
                tx_data <= 8'b00100000;
                state <= 8'd65;
            end
            8'd65:
            begin
                tx_ready <= 0;
                counter <= 32'd9416;
                state <= 8'd66;
            end
            8'd66:
            begin
                tx_ready <= 1;
                counter <= 32'd1000;
                tx_data <= 8'b00111010;
                state <= 8'd67;
            end
            8'd67:
            begin
                tx_ready <= 0;
                counter <= 32'd9416;
                state <= 8'd68;
            end
            8'd68:
            begin
                tx_ready <= 1;
                counter <= 32'd1000;
                tx_data <= 8'b00100000;
                state <= 8'd69;
            end
            8'd69:
            begin
                tx_ready <= 0;
                counter <= 32'd9416;
                state <= 8'd70;
            end
            8'd70:
            begin
                tx_ready <= 1;
                counter <= 32'd1000;
                tx_data <= 8'b00110000 + playerwinnum;
                state <= 8'd71;
            end
            8'd71:
            begin
                tx_ready <= 0;
                counter <= 32'd9416;
                state <= 8'd72;
            end
            8'd72:
            begin
                tx_ready <= 1;
                counter <= 32'd1000;
                tx_data <= 8'b00100000;
                state <= 8'd73;
            end
            8'd73:
            begin
                tx_ready <= 0;
                counter <= 32'd9416;
                state <= 8'd74;
            end
            8'd74:
            begin
                tx_ready <= 1;
                counter <= 32'd1000;
                tx_data <= 8'b01011011;
                state <= 8'd75;
            end
            8'd75:
            begin
                tx_ready <= 0;
                counter <= 32'd9416;
                state <= 8'd76;
            end
            8'd76:
            begin
                tx_ready <= 1;
                counter <= 32'd1000;
                tx_data <= 8'b01110000;
                state <= 8'd77;
            end
            8'd77:
            begin
                tx_ready <= 0;
                counter <= 32'd9416;
                state <= 8'd78;
            end
            8'd78:
            begin
                tx_ready <= 1;
                counter <= 32'd1000;
                tx_data <= 8'b01101100;
                state <= 8'd79;
            end
            8'd79:
            begin
                tx_ready <= 0;
                counter <= 32'd9416;
                state <= 8'd80;
            end
            8'd80:
            begin
                tx_ready <= 1;
                counter <= 32'd1000;
                tx_data <= 8'b01100001;
                state <= 8'd81;
            end
            8'd81:
            begin
                tx_ready <= 0;
                counter <= 32'd9416;
                state <= 8'd82;
            end
            8'd82:
            begin
                tx_ready <= 1;
                counter <= 32'd1000;
                tx_data <= 8'b01111001;
                state <= 8'd83;
            end
            8'd83:
            begin
                tx_ready <= 0;
                counter <= 32'd9416;
                state <= 8'd84;
            end
            8'd84:
            begin
                tx_ready <= 1;
                counter <= 32'd1000;
                tx_data <= 8'b01100101;
                state <= 8'd85;
            end
            8'd85:
            begin
                tx_ready <= 0;
                counter <= 32'd9416;
                state <= 8'd86;
            end
            8'd86:
            begin
                tx_ready <= 1;
                counter <= 32'd1000;
                tx_data <= 8'b01110010;
                state <= 8'd87;
            end
            8'd87:
            begin
                tx_ready <= 0;
                counter <= 32'd9416;
                state <= 8'd88;
            end
            8'd88:
            begin
                tx_ready <= 1;
                counter <= 32'd1000;
                tx_data <= 8'b01011101;
                state <= 8'd89;
            end
            8'd89:
            begin
                tx_ready <= 0;
                counter <= 32'd9416;
                state <= 8'd90;
            end
            8'd90:
            begin
                tx_ready <= 1;
                counter <= 32'd1000;
                tx_data <= 8'b00001010;
                state <= 8'd0;
            end
            8'd0:tx_ready <= 0;
            default: ;
        endcase
    else;
end

endmodule
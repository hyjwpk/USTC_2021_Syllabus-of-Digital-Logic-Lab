module TicTacToe (
    input clk,rst,uart_rx,
    output uart_tx
);

reg [1:0] printcnt;
reg uart_txreg;
assign uart_tx = uart_txreg;

reg [4:0] state;

wire rx_ready,rx_ready_edge;
wire [7:0] rx_data;
rx rx(clk,rst,uart_rx,rx_ready,rx_data);
signal_edge signal_edge(clk,rx_ready,rx_ready_edge);

reg [3:0] step;
reg [7:0] piece;
reg [1:0] pos1,pos2;
reg [1:0] last1[8:0], last2[8:0];
reg [7:0] line11,line12,line13,line21,line22,line23,line31,line32,line33;

wire [1:0] aipos1,aipos2;
reg airun;
ai ai(line11,line12,line13,line21,line22,line23,line31,line32,line33,step,aipos1,aipos2);

wire [1:0] playerwin;
judge judge(line11,line12,line13,line21,line22,line23,line31,line32,line33,step,playerwin);

reg errorstart;
wire erroroutput;
error error(clk,errorstart,erroroutput);

reg helpstart;
wire helpoutput;
help help(clk,helpstart,helpoutput);

reg displaystart;
wire displayoutput,displaydone;
display display(clk,displaystart,line11,line12,line13,line21,line22,line23,line31,line32,line33,playerwin,airun,displayoutput,displaydone);

reg infostart;
wire infooutput;
reg [3:0] player1winnum,player2winnum,playerwinnum,aiwinnum;
info info(clk,infostart,player1winnum,player2winnum,playerwinnum,aiwinnum,infooutput);

initial begin
    printcnt        = 0;
    errorstart      = 0;
    helpstart       = 0;
    displaystart    = 0;
    infostart       = 0;
    state           = 0;
    step            = 0;
    airun           = 0;
    piece = 8'b01001111;
    line11 = 8'b00100011;line12 = 8'b00100011;line13 = 8'b00100011;
    line21 = 8'b00100011;line22 = 8'b00100011;line23 = 8'b00100011;
    line31 = 8'b00100011;line32 = 8'b00100011;line33 = 8'b00100011;
    player1winnum=0; player2winnum=0; playerwinnum=0; aiwinnum=0;
end

always @(*) begin
    case (printcnt)
    2'd0: uart_txreg = erroroutput;
    2'd1: uart_txreg = displayoutput;
    2'd2: uart_txreg = helpoutput;
    2'd3: uart_txreg = infooutput;
    default: uart_txreg = displayoutput;
    endcase
end

always @(posedge clk) begin
    if(rx_ready_edge)
    begin
        case (state) 
            5'd0:
                if(rx_data == 8'b00101101) state = 5'd1;//-
                else if(rx_data == 8'b00001010) state = 5'd30;//cr
            5'd1:
                if(rx_data == 8'b01100100) state = 5'd2;//d
                else if(rx_data == 8'b01110000) state = 5'd3;//p
                else if(rx_data == 8'b01100010) state = 5'd8;//b
                else if(rx_data == 8'b01110010) state = 5'd9;//r
                else if(rx_data == 8'b01101000) state = 5'd10;//h
                else if(rx_data == 8'b01100001)//a
                begin  
                    if(airun==0) state = 5'd11;
                    else
                    begin
                        pos1=aipos1;pos2=aipos2;
                        state = 5'd7;
                    end
                end
                else if(rx_data == 8'b01101001) state = 5'd12;//i
                else if(rx_data == 8'b00001010) state = 5'd30;//cr
                else state = 5'd31;
            5'd2:
                if(rx_data == 8'b00001010) state = 5'd29;//cr
                else state = 5'd31;
            5'd3:
                if(rx_data == 8'b00100000) state = 5'd4;//space
                else if(rx_data == 8'b00001010) state = 5'd30;//cr
                else state = 5'd31;
            5'd4:
                if(rx_data>=8'b00110001 && rx_data<=8'b00110011) begin state = 5'd5; pos1=rx_data-8'b00110000; end//1~3
                else if(rx_data == 8'b00001010) state = 5'd30;//cr
                else state = 5'd31;
            5'd5:
                if(rx_data == 8'b00100000) state = 5'd6;//space
                else if(rx_data == 8'b00001010) state = 5'd30;//cr
                else state = 5'd31;
            5'd6:
                if(rx_data>=8'b00110001 && rx_data<=8'b00110011) begin state = 5'd7; pos2=rx_data-8'b00110000; end//1~3
                else if(rx_data == 8'b00001010) state = 5'd30;//cr
                else state = 5'd31;
            5'd7:
                if(rx_data == 8'b00001010)//cr
                begin
                    state = 5'd29;
                    case (pos1)
                        2'd1:
                        begin
                            case (pos2)
                                2'd1:
                                if(line11==8'b00100011) line11=piece;
                                else state=5'd30;
                                2'd2:
                                if(line12==8'b00100011) line12=piece;
                                else state=5'd30;
                                2'd3:
                                if(line13==8'b00100011) line13=piece;
                                else state=5'd30;
                                default:;
                            endcase
                        end
                        2'd2:
                        begin
                            case (pos2)
                                2'd1:
                                if(line21==8'b00100011) line21=piece;
                                else state=5'd30;
                                2'd2:
                                if(line22==8'b00100011) line22=piece;
                                else state=5'd30;
                                2'd3:
                                if(line23==8'b00100011) line23=piece;
                                else state=5'd30;
                                default:;
                            endcase
                        end
                        2'd3: 
                        begin
                            case (pos2)
                                2'd1:
                                if(line31==8'b00100011) line31=piece;
                                else state=5'd30;
                                2'd2:
                                if(line32==8'b00100011) line32=piece;
                                else state=5'd30;
                                2'd3:
                                if(line33==8'b00100011) line33=piece;
                                else state=5'd30;
                                default:;
                            endcase
                        end
                        default:; 
                    endcase
                    if(state == 5'd29)
                    begin
                        case(piece)
                            8'b01001111: piece=8'b01011000;
                            8'b01011000: piece=8'b01001111;
                            default:;
                        endcase
                        last1[step]=pos1;last2[step]=pos2;step=step+1;
                    end
                end
                else state = 5'd31;
            5'd8:
                if(rx_data == 8'b00001010) //cr
                begin
                    if(step != 0)
                    begin
                        case(piece)
                            8'b01001111: piece=8'b01011000;
                            8'b01011000: piece=8'b01001111;
                            default:;
                        endcase
                        step=step-1;
                        case (last1[step])
                            2'd1:
                            begin
                                case (last2[step])
                                    2'd1:line11=8'b00100011;
                                    2'd2:line12=8'b00100011;
                                    2'd3:line13=8'b00100011;
                                    default:;
                                endcase
                            end
                            2'd2:
                            begin
                                case (last2[step])
                                    2'd1:line21=8'b00100011;
                                    2'd2:line22=8'b00100011;
                                    2'd3:line23=8'b00100011;
                                    default:;
                                endcase
                            end
                            2'd3: 
                            begin
                                case (last2[step])
                                    2'd1:line31=8'b00100011;
                                    2'd2:line32=8'b00100011;
                                    2'd3:line33=8'b00100011;
                                    default:;
                                endcase
                            end
                            default:; 
                        endcase
                        state = 5'd29;
                    end
                    else state = 5'd30;
                end
                else state = 5'd31;
            5'd9:
                if(rx_data == 8'b00001010) //cr
                begin
                    step = 0;
                    piece = 8'b01001111;
                    line11 = 8'b00100011;line12 = 8'b00100011;line13 = 8'b00100011;
                    line21 = 8'b00100011;line22 = 8'b00100011;line23 = 8'b00100011;
                    line31 = 8'b00100011;line32 = 8'b00100011;line33 = 8'b00100011;
                    airun = 0;
                    state = 5'd29;
                end
                else state = 5'd31;
            5'd10:
                if(rx_data == 8'b00001010) state = 5'd28;//cr
                else state = 5'd31;
            5'd11:
                if(rx_data == 8'b00001010)//cr
                begin
                    step = 1;
                    piece = 8'b01011000;
                    line11 = 8'b00100011;line12 = 8'b00100011;line13 = 8'b00100011;
                    line21 = 8'b00100011;line22 = 8'b01001111;line23 = 8'b00100011;
                    line31 = 8'b00100011;line32 = 8'b00100011;line33 = 8'b00100011;
                    airun = 1;
                    state = 5'd29;
                end
                else state = 5'd31;
            5'd12:
                if(rx_data == 8'b00001010) state = 5'd27;//cr
                else state = 5'd31;
            default: if(rx_data == 8'b00001010) state = 5'd30;//cr
        endcase
        if(state == 5'd30) 
        begin
            printcnt <= 2'd0;
            errorstart <= 1;
            state <= 5'd0;
        end
        else if(state == 5'd29) 
        begin
            printcnt <= 2'd1;
            displaystart <= 1;
            state <= 5'd0;
        end
        else if(state == 5'd28) 
        begin
            printcnt <= 2'd2;
            helpstart <= 1;
            state <= 5'd0;
        end
        else if(state == 5'd27) 
        begin
            printcnt <= 2'd3;
            infostart <= 1;
            state <= 5'd0;
        end
    end
    else
    begin
        if(playerwin!=0 && displaydone==1)
        begin
            if(airun)
            begin
                if(playerwin==2'd1) aiwinnum = aiwinnum + 1;
                else if(playerwin==2'd2) playerwinnum = playerwinnum + 1;
            end
            else
            begin
                if(playerwin==2'd1) player1winnum = player1winnum + 1;
                else if(playerwin==2'd2) player2winnum = player2winnum + 1;
            end
            step = 0;
            airun = 0;
            piece = 8'b01001111;
            line11 = 8'b00100011;line12 = 8'b00100011;line13 = 8'b00100011;
            line21 = 8'b00100011;line22 = 8'b00100011;line23 = 8'b00100011;
            line31 = 8'b00100011;line32 = 8'b00100011;line33 = 8'b00100011;
        end
        displaystart <= 0;
        errorstart <= 0;
        helpstart <= 0;
        infostart <= 0;
    end
end

endmodule
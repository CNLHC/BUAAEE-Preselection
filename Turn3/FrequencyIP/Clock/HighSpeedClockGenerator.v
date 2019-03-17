module HighSpeedClockGenerator(
    input PLL0,
    input PLL1,
    input PLL2,
    input PLL3,
    input PLL4,
    input PLL5,
    input PLL6,
    output reg HighSpeedClock);
//When PLLx is 800Mhz and 22.5 degree lag to its neighbours, This module
//should generate 5.6Ghz Clock Signal

reg race;
//always_combo
always @( posedge PLL0 or posedge PLL1 or posedge PLL2 or posedge PLL3 or posedge PLL4 or posedge PLL5 or posedge PLL6 ) begin
    case ({PLL0, PLL1, PLL2, PLL3, PLL4, PLL5, PLL6})
        7'b1000000 :    HighSpeedClock=1;
        7'b1100000 :    HighSpeedClock=0;
        7'b1110000 :	HighSpeedClock=1;
        7'b1111000 :	HighSpeedClock=0;
        7'b1111100 :	HighSpeedClock=1;
        7'b1111110 :	HighSpeedClock=0;
        7'b1111111 :	HighSpeedClock=1;
        7'b0111111 :	HighSpeedClock=0;
        7'b0011111 :	HighSpeedClock=1;
        7'b0001111 :	HighSpeedClock=0;
        7'b0000111 :	HighSpeedClock=1;
        7'b0000011 :	HighSpeedClock=0;
        7'b0000001 :	HighSpeedClock=1;
        7'b0000000 :	HighSpeedClock=0;
        default:        race=1;
    endcase
end
endmodule


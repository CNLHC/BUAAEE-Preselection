module RealTimeClockGenerator(
    input sysClk,
    input sysRst,
    output reg tikTok
);

reg [63:0] counter;

always @ (posedge sysClk or  posedge sysRst) begin
    if(sysRst) 
        counter<=0;
    else begin
        counter<=counter+1;
        if(counter==25000000)  begin
            tikTok<=~tikTok;
            counter<=0;
        end
    end
end


endmodule
    


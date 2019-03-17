module ReleaxGenerator(
    input  sysClk,
    input  sysRst,
    input  enable,
    output releaxSignal);

reg [64:0]counter;

reg HoldingFlag;

always @(posedge sysClk or posedge sysRst)
    if(sysRst)begin
        counter<=0;
        HoldingFlag<=0;
    end
    else begin
        if(enable) begin
            if(!HoldingFlag)
                counter<=counter+1;
            if(counter==5000000) begin//0.1s 
                releaxSignal<=1;
                HoldingFlag<=1;
            end
        end
        else begin
            HoldingFlag<=0;
            counter<=0;
            releaxSignal<=0;
        end
    end
endmodule
    


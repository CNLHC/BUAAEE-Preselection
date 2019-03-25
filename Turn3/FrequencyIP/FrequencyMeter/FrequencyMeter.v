module FrequencyMeter(
    input signal,
    input sysClk,
    input realTimeTikTok,
    input sysRst,
    output reg [63:0]refCounter,
    output reg [63:0]sigCounter
);

reg [63:0] refCountBuf;
reg [63:0] sigCountBuf;
reg [1:0]FSM;
wire  releaxSignal;
reg refLatchFlag;
reg sigLatchFlag;
reg forceClearSig;

ReleaxGenerator URG1 (
    .sysClk(sysClk),
    .sysRst(sysRst),
    .enable (FSM),
    .releaxSignal(releaxSignal));

always @( posedge realTimeTikTok or posedge sysRst) begin
    if(sysRst) begin
        FSM<=0;
        forceClearSig<=0;
    end
    else begin
        case(FSM)
            0: begin //first 0.5s sample  window
                FSM<=1;
                forceClearSig<=0;
            end
            1: begin //last 0.5s sample window
                FSM<=2;
                forceClearSig<=0;
            end
            2: begin // releax window
                FSM<=0;
                forceClearSig<=1;
            end
            3: begin //Unhandled case
                FSM<=0; 
            end
        endcase
    end
end


always @ (posedge sysClk or posedge sysRst) begin
    if(sysRst) begin
        refCounter<=0;
        refCountBuf<=0;
    end
    else begin
        case(FSM)
            0:begin 
                refCountBuf<=refCountBuf+1;
                refLatchFlag<=0;
            end
            1: begin
                refCountBuf<=refCountBuf+1;
                refLatchFlag<=0;
            end
            2:begin
                if(!refLatchFlag)begin
                    refCounter<=refCountBuf;
                    refLatchFlag<=1;
                end
                refCountBuf<=0;
            end
        endcase
    end
end

always @ (posedge signal or posedge sysRst) begin
    if(sysRst) begin
        sigCounter<=0;
        sigCountBuf<=0;
    end
    else begin
        case(FSM)
            0:begin 
                sigCounter<=0;
                sigCountBuf<=sigCountBuf+1;
                sigLatchFlag<=0;
            end
            1: begin
                sigCounter<=0;
                sigCountBuf<=sigCountBuf+1;
                sigLatchFlag<=0;
            end
            2:begin
                if(!sigLatchFlag)begin
                    sigCounter<=sigCountBuf;
                    sigLatchFlag<=1;
                end
                sigCountBuf<=0;
            end
        endcase
    end
end
endmodule


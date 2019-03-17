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
reg FSM;
wire  releaxSignal;

ReleaxGenerator URG1 (
    .sysClk(sysClk),
    .sysRst(sysRst),
    .enable (FSM),
    .releaxSignal(releaxSignal));

always @(posedge realTimeTikTok or posedge sysRst or posedge releaxSignal) begin
    if(sysRst) begin
        FSM<=0;
    end
    else begin
        case(FSM)
            0: begin
                FSM<=1;
            end
            1: begin
                FSM<=0;
            end
        endcase
    end
end


always @ (posedge sysClk or posedge sysRst ) begin
    if(sysRst) begin
        refCounter<=0;
        refCountBuf<=0;
    end
    else begin
        case(FSM)
            0: refCountBuf<=refCountBuf+1;
            1:begin
                refCounter<=refCountBuf;
                refCountBuf<=0;
            end
        endcase
    end
end


always @ (posedge signal or posedge sysRst ) begin
    if(sysRst) begin
        sigCounter<=0;
        sigCountBuf<=0;
    end
    else begin
        case(FSM)
            0:sigCountBuf<=sigCountBuf+1;
            1:begin
                sigCounter<=sigCountBuf;
                sigCountBuf<=0;
            end
        endcase
    end
end

endmodule


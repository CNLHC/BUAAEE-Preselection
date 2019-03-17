module PhaseDetector(
    input workClk,
    input sysClk,
    input sysRst,
    input CHA,
    input CHB,
    output [63:0]diffCounter
);
reg [1:0]FSM;
reg [63:0] phraseDiffCountBuf;

wire  releaxSignal;
wire  releaxEnable;

assign  releaxEnable=(FSM==2);

ReleaxGenerator URG1 (
    .sysClk(sysClk),
    .sysRst(sysRst),
    .enable (releaxEnable),
    .releaxSignal(releaxSignal));

always @(posedge workClk or posedge sysRst) begin
    if(sysRst)begin
        phraseDiffCountBuf<=0;
        diffCounter<=0;
    end
    else begin
        case (FSM) 
            0: begin
                phraseDiffCountBuf<=0;
            end
            1: begin
                phraseDiffCountBuf<=phraseDiffCountBuf+1;
            end
            2: begin
                diffCounter<=phraseDiffCountBuf;
            end
        endcase
    end
end

always @(posedge CHA or posedge CHB or posedge sysRst or posedge releaxSignal) begin
    if(sysRst) begin
        FSM=0;
    end
    else begin
        case (FSM) 
            0:begin
                if(CHA)
                    FSM=1;
            end
            1:FSM=2;
            2:begin
                if(releaxSignal)
                    FSM=0;
            end
        endcase
    end
end
endmodule


module PhaseDetector(
    input workClk,
    input sysClk,
    input sysRst,
    input CHA,
    input CHB,
    output reg [63:0]diffCounter
);
wire [1:0]FSM;
reg [63:0] phraseDiffCountBuf;
reg TickA;
reg TickB;
assign FSM={TickA,TickB};

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
            2'b01: begin
                phraseDiffCountBuf<=0;
            end
            2'b10: begin
                phraseDiffCountBuf<=phraseDiffCountBuf+1;
            end
            2'b11: begin
                diffCounter<=phraseDiffCountBuf;
            end
            2'b00:begin
                phraseDiffCountBuf<=0;
            end
        endcase
    end
end

always @(posedge CHA or posedge sysRst ) begin
    if(sysRst) begin
        TickA<=0;
    end
    else begin
        case (FSM) 
            2'b00:begin
                TickA<=1;
            end
            2'b11:begin
                TickA<=0;
            end
            default: TickA<=TickA;
        endcase
    end
end

always @(posedge CHB or posedge sysRst ) begin
    if(sysRst) begin
        TickB<=0;
    end
    else begin
        case (FSM) 
            2'b10:begin
                TickB<=1;
            end
            2'b01:begin
                TickB<=0;
            end
            default:TickB<=TickB;
        endcase
    end
end

endmodule


module IZ_RG_22(
    input clk,
    input rst,
    input wire [2:0] select,
    input wire [4:0] I, // Current input
    output reg [7:0] V_out,
    output reg [7:0] U_out, // Membrane potential
    output reg spike    // Spike output
);

    function [21:0] FAS32;
        input [21:0] h;
        input [21:0] i;
        reg [22:0] h_extended, i_extended, sum_extended;
        reg [21:0] magnitude_h, magnitude_i;
        begin
            h_extended = 0;
            i_extended = 0;
            sum_extended = 0;
            magnitude_h = 0;
            magnitude_i = 0;
            FAS32 = 0;
            if(h[20:0] == 0) begin
                FAS32 = i;
            end
            else if (i[20:0] == 0) begin
                FAS32 = h;
            end
            else begin
                magnitude_h = {1'b0, h[20:0]};
                magnitude_i = {1'b0, i[20:0]};
                h_extended = h[21] ? -magnitude_h : magnitude_h;
                i_extended = i[21] ? -magnitude_i : magnitude_i;
                sum_extended = h_extended + i_extended;       
                if (sum_extended[22]) begin
                    FAS32 = {1'b1, -sum_extended[20:0]};
                end
                else begin
                    FAS32 = {1'b0, sum_extended[20:0]};
                end
            end
        end
    endfunction

    function [21:0] FM32;
        input [21:0] f;
        input [21:0] g;
        reg [41:0] product;
        reg sign;
        
        begin
            product = 0;
            sign = 0;
            FM32 = 0;  // Default return value
            if (f[20:0] == 0 || g[20:0] == 0) begin
                FM32 = 22'b0;
            end
            else begin
                sign = f[21] ^ g[21];
                product = {1'b0, f[20:0]} * {1'b0, g[20:0]};
                FM32 = {sign, product[38:18]};
                //FM32 = {sign, product[30:0]}; 
            end
        end
    endfunction
	
	 reg [21:0] U;
    reg [21:0] V;

    parameter ONE_3947 = 22'h05942C; // 1.3947
    parameter ZERO_3157 = 22'h214346; // -0.3157
    parameter ZERO_0166 = 22'h0010FF; // 0.0166
    parameter VTH = 22'h013333; // 0.30
    parameter TAU = 22'h00CCCC; // 0.2

    // Parámetros a (timescale)
    parameter  VAL_A02 = 22'h00147A; // ~0.02 
    parameter  VAL_A10 = 22'h006666; // ~0.10 

    // Parámetros b (coupling)
    parameter  VAL_B20 = 22'h028885; // ~0.2 * 3.1666
    parameter  VAL_B25 = 22'h032AA6; // 0.25 * 3.1666

    // Parámetros c (reset voltage)
    parameter  VAL_C65 = 22'h229999; // ~-0.65 
    parameter  VAL_C55 = 22'h223333; // ~-0.55 
    parameter  VAL_C50 = 22'h220000; // -0.50 
    parameter  VAL_C87 = 22'h237AE1; // ~-0.87 

    // Parámetros d (reset recovery)
    parameter  VAL_D80 = 22'h0102DE; // 8 a ~0.2528 
    parameter  VAL_D40 = 22'h00816F; // 4 a ~0.1264 
    parameter  VAL_D20 = 22'h0040B7; // 2 a ~0.0632 
    parameter  VAL_D05 = 22'h00019E; // .05 a ~0.00158 

    // Valores iniciales U
    parameter  VAL_U20 = 22'h20851E; // ~0.2*-.65 
    parameter  VAL_U25 = 22'h20A666; // 0.25*-.65 
    parameter [21:0] BIAS = 22'h0006C2; 

    reg [21:0] v_old, u_old;
    reg [21:0] dv_term1, dv_term2, dv_term3, dv_term4, dv_term5, dv_term6, dv_term7, dv_term8, dv;
    reg [21:0] du_term1, du_term2, du_term3, du_term4, du;
    reg [21:0] a, b, c, d;
    reg [21:0] I_out; 

    localparam UPDATE = 2'b00;
    localparam CHECK = 2'b01;
    localparam SELECT_N = 2'b10;

    reg [1:0] STATE;

    always @(posedge clk or negedge rst) begin
        if (!rst) begin
            a <= 0;  // Maintain current value by default
            b <= 0;
            c <= 0;
            d <= 0;
            spike <= 1'b0;
            v_old <= 0;
            u_old <= 0;
            U <= 0;
            V <= 0;
				I_out = 0;
            dv_term1 = 0;
            dv_term2 = 0;
            dv_term3 = 0;
            dv_term4 = 0;
            dv_term5 = 0;
            dv_term6 = 0;
            dv_term7 = 0;
            dv_term8 = 0;
            dv = 0;
            du_term1 = 0;
            du_term2 = 0;
            du_term3 = 0;
            du_term4 = 0;
            du = 0;
            V_out <= 8'hD3;
            U_out <= 8'h8F;
            
            
            STATE <= SELECT_N; 
        end

        else begin
            case (STATE)
                SELECT_N:begin
                    case (select)
                        3'b000: begin
                            a <= VAL_A02; b <= VAL_B20; c <= VAL_C65; d <= VAL_D80; U <= VAL_U20; V <= VAL_C65;// RS
                        end
                        3'b001: begin
                            a <= VAL_A02; b <= VAL_B20; c <= VAL_C55; d <= VAL_D40; U <= VAL_U20; V <= VAL_C65;// IB
                        end
                        3'b010: begin 
                            a <= VAL_A02; b <= VAL_B20; c <= VAL_C50; d <= VAL_D20; U <= VAL_U20; V <= VAL_C65;// CH
                        end
                        3'b011: begin
                            a <= VAL_A10; b <= VAL_B20; c <= VAL_C65; d <= VAL_D20; U <= VAL_U20; V <= VAL_C65;// FS
                        end
                        3'b100: begin
                            a <= VAL_A02; b <= VAL_B25; c <= VAL_C65; d <= VAL_D05; U <= VAL_U25; V <= VAL_C65;// TC
                        end
                        3'b101: begin
                            a <= VAL_A02; b <= VAL_B25; c <= VAL_C87; d <= VAL_D05; U <= VAL_U25; V <= VAL_C65;// TC_I
                        end
                        3'b110: begin
                            a <= VAL_A10; b <= VAL_B25; c <= VAL_C65; d <= VAL_D20; U <= VAL_U25; V <= VAL_C65;// RZ
                        end
                        3'b111: begin
                            a <= VAL_A02; b <= VAL_B25; c <= VAL_C65; d <= VAL_D20; U <= VAL_U25; V <= VAL_C65;// LTS
                        end
                        default: begin
                            a <= VAL_A02; b <= VAL_B20; c <= VAL_C65; d <= VAL_D80; U <= VAL_U20; V <= VAL_C65;// RS
                        end
                    endcase
                    STATE <= UPDATE;
                end
                UPDATE: begin
                    I_out = FAS32(BIAS, {1'b0, I, 13'b0});
                    dv_term1 = FM32(V, V);
                    dv_term2 = {dv_term1[21],(dv_term1[20:0]<<2)};
                    dv_term3 = FAS32({V[21],(V[20:0]<<2)}, V);
                    dv_term4 = FM32(ZERO_3157, U);
                    dv_term5 = FAS32(dv_term2, dv_term3);
                    dv_term6 = FAS32(ONE_3947, dv_term4);
                    dv_term7 = FAS32(dv_term5, dv_term6);
                    dv_term8 = FAS32(dv_term7, I_out);
                    dv = FM32(TAU, dv_term8);

                    du_term1 = FM32(b,V);
                    du_term2 = FAS32(ZERO_0166, U);
                    du_term3 = FAS32(du_term1, {~(du_term2[21]),du_term2[20:0]});
                    du_term4 = FM32(a, du_term3);
                    du = FM32(TAU, du_term4);

                    v_old <= FAS32(V,dv);
                    u_old <= FAS32(U,du);
                    STATE <= CHECK;
                end

                CHECK: begin
                    V_out <= {V[21], V[17:11]};
                    U_out <= {U[21], U[17:11]};
                    if (V[21] == 0 && V[20:0] >= VTH[20:0]) begin
                        V <= c;
                        v_old <= c;
                        U <= FAS32(U, d);
                        u_old <= FAS32(U, d);
                        spike <= 1'b1;
                      
                    end
                    else begin
								V <= v_old;
                        spike <= 1'b0;
                        U <= u_old;
                        STATE <= UPDATE;

                    end
                end
            endcase
        end
    end

endmodule

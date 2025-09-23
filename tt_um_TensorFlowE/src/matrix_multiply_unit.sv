

module matrix_multiply_unit (
    input logic clk,
    input logic rst,
    input logic enable,
    input  logic [15:0] matrixA, //|<i
    input  logic [15:0] matrixB, //|<i
    output logic [15:0] result,   //|>o
    output logic listo
);

    localparam VAR_WIDTH = 4;
    localparam M_SIZE = 2;

    logic [VAR_WIDTH-1:0] A1 [0:M_SIZE-1][0:M_SIZE-1];
    logic [VAR_WIDTH-1:0] B1 [0:M_SIZE-1][0:M_SIZE-1];
    logic [VAR_WIDTH-1:0] Res1 [0:M_SIZE-1][0:M_SIZE-1];

    // Contadores para iterar a través de las matrices
    reg [1:0] i, j, k;

    // Acumulador para la suma de productos
    reg [7:0] accumulator; // VAR_WIDTH*2 (4*2=8) para evitar desbordamiento

    // Variable de estado para controlar el flujo de datos
    reg [2:0] state;
    localparam S_IDLE = 3'd0, S_LOAD = 3'd1, S_CALC = 3'd2, S_STORE = 3'd3, S_DONE = 3'd4;
    
    // Convertir de 1D a 2D y viceversa
    always_comb begin
        for(int row = 0; row < M_SIZE; row = row + 1) begin
            for(int col = 0; col < M_SIZE; col = col + 1) begin
                
                A1[row][col] = matrixA[VAR_WIDTH*(row*M_SIZE+col) +: VAR_WIDTH];
                B1[row][col] = matrixB[VAR_WIDTH*(row*M_SIZE+col) +: VAR_WIDTH];
                // result[VAR_WIDTH*(row*M_SIZE+col) +: VAR_WIDTH] = Res1[row][col];
            end
        end
    end

    // MÁQUINA DE ESTADOS
    always @(posedge clk or negedge rst) begin
        if (!rst) begin
            i <= 2'd0;
            j <= 2'd0;
            k <= 2'd0;
            state <= S_IDLE;
            accumulator <= 8'd0;
            result <= 16'd0;
            listo<= 1'b0;
            for(int row = 0; row < M_SIZE; row = row + 1) begin
                for(int col = 0; col < M_SIZE; col = col + 1) begin
                    Res1[row][col] <= 4'd0;
                end
            end
        end else begin
            case (state)
                S_IDLE: begin
                    // Espera una señal para iniciar la operación
                    // Por ejemplo, un pulso en la entrada `start`
                    // Por ahora, pasamos directamente a la carga
                    if (enable)
                    begin
                        state <= S_LOAD;
                    end
                    listo<= 1'b0;
                end
                S_LOAD: begin
                    // Carga las matrices en los registros internos
                    state <= S_CALC;
                end
                S_CALC: begin
                    // Realiza una operación por ciclo de reloj
                    if (k < M_SIZE) begin
                        accumulator <= accumulator + (A1[i[0]][k[0]] * B1[k[0]][j[0]]);
                        k <= k + 2'h1;
                    end else begin
                        Res1[i[0]][j[0]] <= accumulator[VAR_WIDTH-1:0]; // Almacena el resultado (saturando si es necesario)
                        
                        // Resetea el acumulador y avanza a la siguiente posición
                        accumulator <= 8'd0;
                        k <= 2'd0;
                        
                        if (j < M_SIZE-1) begin
                            j <= j + 2'h1;
                        end else begin
                            j <= 2'd0;
                            if (i < M_SIZE-1) begin
                                i <= i + 2'h1;
                            end else begin
                                i <= 2'd0;
                                state <= S_STORE; // Pasa a la fase de almacenamiento
                            end
                        end
                    end
                end
                S_STORE: begin
                    // Convierte la matriz de resultados 2D a un vector 1D para la salida
                    // Esto se hace en un solo ciclo aquí para simplificar
                    for(int row = 0; row < M_SIZE; row = row + 1) begin
                        for(int col = 0; col < M_SIZE; col = col + 1) begin

                            
                            result[VAR_WIDTH*(row*M_SIZE+col) +: VAR_WIDTH] <= Res1[row][col];
                        end
                    end
                    state <= S_DONE;
                    listo<= 1'b1;
                end
                S_DONE: begin
                    // La operación ha finalizado
                    // Se podría pasar a S_IDLE para iniciar otra operación
                    state <= S_IDLE;
                    listo<= 1'b0;
                end
                default :begin
                    state <= S_IDLE;
                    listo<= 1'b0;
                end
            endcase
        end
    end

endmodule

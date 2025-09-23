//////////////////////////////////////////////////////////////////////////////////
// Company: Gelisim University
// 
// Date: 2025
// Design Name: AR Chip
// Module Name: autodrive
// Project Name: Gelisim Chip
// 
//////////////////////////////////////////////////////////////////////////////////
module autodrive( 
    input clk,
    input reset,
    
    input wire autodrive_en,
    input wire [7:0] input_sensors_in,
    input wire [15:0] yaw_in,
    input wire [1:0] mode,
    
    output reg [2:0] motor_out,
    output reg [11:0] total_angle,
    input wire [15:0] slow_clk_divider,
    input wire [15:0] turn_constant,
    
    input wire [11:0] targeted_angle
    );
    
    
    parameter IDLE                  = 0;
    parameter SENSOR_READ           = 1;
    parameter CONTROL_ENVIRONMENT   = 2;
    parameter MOVE                  = 3;
    parameter TURN                  = 4;
    parameter MOVE_AHEAD            = 5;
    
    parameter control_forward   = 0;
    parameter control_right     = 1;
    parameter control_left      = 2;
    parameter control_back      = 3;
    
    parameter turn_right40  = 1;
    parameter turn_right30  = 2;
    parameter turn_right20  = 4;
    parameter move_forward  = 8;
    parameter turn_left20   = 16;
    parameter turn_left30   = 32;
    parameter turn_left40   = 64;
    parameter move_backward = 128;
    parameter stop          = 255;
    parameter turn_right10  = 256;
    parameter turn_left10   = 512;
    parameter turn_control_left40   = 1024;
    parameter turn_control_right40  = 2048;
    parameter turn_control_right90  = 1025;
    parameter turn_control_left90   = 1026;
    parameter turn_control_right180 = 1027;
    
    parameter motor_forward     = 0;
    parameter motor_turn_left   = 1;
    parameter motor_turn_right  = 2;
    parameter motor_backward    = 3;
    parameter motor_stop        = 4;
    
    
    reg [15:0] yaw_temp;
    reg [7:0] input_sensors;
    reg [15:0] move_o;
    reg [3:0] state = 0;
    reg [31:0] clk_counter = 0;
    reg [15:0] turn_counter = 0;
    reg slow_clk = 0;
    reg slow_clk_prev = 0;
    reg turnFlag = 0;
    
    reg [15:0] ff1_yaw; 
    reg [15:0] ff2_yaw;
    always @(posedge clk or posedge reset) begin
        if (reset) begin
            ff1_yaw <= 1'b0;
            ff2_yaw <= 1'b0;
        end else begin
            ff1_yaw <= yaw_in;
            ff2_yaw <= ff1_yaw;
        end
    end
    
    wire [15:0] yaw;
    assign yaw = ff2_yaw;
    
    always@(posedge clk or posedge reset) begin
        if (reset) begin
            slow_clk = 0;
            clk_counter = 0;
            slow_clk_prev = 0;
        end else begin
            clk_counter = clk_counter + 1;
            slow_clk_prev = slow_clk;
            if(clk_counter > slow_clk_divider) begin
                clk_counter = 0;
                slow_clk = ~slow_clk;
            end
        end
    end

    always@(posedge clk or posedge reset) begin
        if(reset) begin
            yaw_temp = 0;
            total_angle = 360;
            state = SENSOR_READ;
            turnFlag = 0;
            turn_counter = 0;
            motor_out = motor_stop;
            move_o <= 0; 
        end
        else begin
            if (!slow_clk_prev && slow_clk) begin
                if (autodrive_en) begin
                    
                    if(total_angle > 720) total_angle = total_angle - 360;
                    if(total_angle <= 10) total_angle = total_angle + 360;
                    
                    case (state)
                        SENSOR_READ : begin
                            input_sensors = input_sensors_in;
                            state = CONTROL_ENVIRONMENT;
                        end
                        
                        CONTROL_ENVIRONMENT: begin
                            case (mode)
                                control_forward : begin
                                    casex(input_sensors[7:0])
                                        8'bxxx0_0111 : begin
                                            if(turnFlag) state = MOVE_AHEAD;
                                            else begin
                                                move_o <= move_forward;
                                                state = MOVE;
                                                motor_out = motor_forward;
                                            end
                                        end
                                        
                                        8'bxxx0_1111 : begin
                                            if(turnFlag) state = MOVE_AHEAD;
                                            else begin
                                                move_o <= move_forward;
                                                if (total_angle < targeted_angle) begin
                                                    if (total_angle < (targeted_angle - 30)) move_o <= turn_right40;
                                                    else if (total_angle < (targeted_angle - 20)) move_o <= turn_right30;
                                                    else if (total_angle < (targeted_angle - 10)) move_o <= turn_right20;
                                                    else if (total_angle < targeted_angle) move_o <= turn_right10;
                                                    yaw_temp = yaw;
                                                    motor_out = motor_turn_right;
                                                    state = TURN;
                                                end
                                                else begin
                                                    move_o <= move_forward;
                                                    state = MOVE;
                                                    motor_out = motor_forward;
                                                end
                                            end
                                        end
                                        
                                        8'bxxx1_0111 : begin
                                            if(turnFlag) state = MOVE_AHEAD;
                                            else begin
                                                move_o <= move_forward;
                                                if(total_angle > targeted_angle) begin
                                                    if (total_angle > (targeted_angle + 30)) move_o <= turn_left40;
                                                    else if (total_angle > (targeted_angle + 20)) move_o <= turn_left30;
                                                    else if (total_angle > (targeted_angle + 10)) move_o <= turn_left20;
                                                    else if (total_angle > targeted_angle) move_o <= turn_left10;
                                                    yaw_temp = yaw;
                                                    motor_out = motor_turn_left;
                                                    state = TURN;
                                                end
                                                else begin
                                                    move_o <= move_forward; 
                                                    state = MOVE;
                                                     motor_out = motor_forward;
                                                end
                                            end
                                        end
                                        
                                        8'bxxx1_1111 : begin
                                            if(turnFlag) state = MOVE_AHEAD;
                                            else begin
                                                move_o <= move_forward;
                                                if(total_angle > targeted_angle) begin
                                                    if (total_angle > (targeted_angle + 30)) move_o <= turn_left40;
                                                    else if (total_angle > (targeted_angle + 20)) move_o <= turn_left30;
                                                    else if (total_angle > (targeted_angle + 10)) move_o <= turn_left20;
                                                    else if (total_angle > targeted_angle) move_o <= turn_left10;
                                                    yaw_temp = yaw;
                                                    motor_out = motor_turn_left;
                                                    state = TURN;
                                                end
                                                else if (total_angle < targeted_angle) begin
                                                    if (total_angle < (targeted_angle - 30)) move_o <= turn_right40;
                                                    else if (total_angle < (targeted_angle - 20)) move_o <= turn_right30;
                                                    else if (total_angle < (targeted_angle - 10)) move_o <= turn_right20;
                                                    else if (total_angle < targeted_angle) move_o <= turn_right10;
                                                    yaw_temp = yaw;
                                                    motor_out = motor_turn_right;
                                                    state = TURN;
                                                end else begin
                                                    move_o <= move_forward; 
                                                    state = MOVE;
                                                    motor_out = motor_forward;
                                                end
                                            end
                                        end
                                        
                                        8'bxxx0_x110 : begin
                                            move_o <= turn_left20;
                                            yaw_temp = yaw;
                                            motor_out = motor_turn_left;
                                            state = TURN;
                                        end
                                        
                                        8'bxxx1_x110 : begin
                                            move_o <= turn_left20 | turn_left30;
                                            if (total_angle > (targeted_angle + 20)) move_o <= turn_left30;
                                            else move_o <= turn_left20;
                                            yaw_temp = yaw;
                                            motor_out = motor_turn_left;
                                            state = TURN;
                                            
                                        end
                                        
                                        8'bxxx0_x100 : begin
                                            move_o <= turn_left30;
                                            yaw_temp = yaw;
                                            motor_out = motor_turn_left;
                                            state = TURN;                    
                                        end
                                        
                                        8'bxxx1_x100 : begin
                                            move_o <= turn_left30| turn_left40;
                                            if (total_angle > (targeted_angle + 30)) move_o <= turn_left40;
                                            else move_o <= turn_left30;
                                            yaw_temp = yaw;
                                            motor_out = motor_turn_left;
                                            state = TURN;
                                            
                                        end
                                        
                                        8'bxxxx_0011 : begin
                                            move_o <= turn_right20;
                                            yaw_temp = yaw;
                                            motor_out = motor_turn_right;
                                            state = TURN;
                                        end
                                        
                                        8'bxxxx_1011 : begin
                                            move_o <= turn_right20 | turn_right30;
                                            if (total_angle < (targeted_angle - 20)) move_o <= turn_right30;
                                            else move_o <= turn_right20;
                                            yaw_temp = yaw;
                                            motor_out = motor_turn_right;
                                            state = TURN;
                                            
                                        end
                                        
                                        8'bxxxx_0001 : begin
                                            move_o <= turn_right30;
                                            yaw_temp = yaw;
                                            motor_out = motor_turn_right;
                                            state = TURN;
                                        end
                                        
                                        8'bxxxx_1001 : begin
                                            move_o <= turn_right30 | turn_right40;
                                            if (total_angle < (targeted_angle - 30)) move_o <= turn_right40;
                                            else move_o <= turn_right30;
                                            yaw_temp = yaw;
                                            motor_out = motor_turn_right;
                                            state = TURN;
                                            
                                        end
                                        
                                        8'bxxx0_0101 : begin
                                            move_o <= turn_right20 | turn_left20;
                                            if (total_angle < targeted_angle) begin 
                                                move_o <= turn_right20;
                                                motor_out = motor_turn_right;
                                            end
                                            else begin
                                                motor_out = motor_turn_left;
                                                move_o <= turn_left20;
                                            end
                                            yaw_temp = yaw;
                                            state = TURN;
                                        end
                                        
                                        8'bxxx1_1101 : begin
                                            move_o <= turn_right20 | turn_left20 | turn_right30 | turn_left30;
                                            if (total_angle < targeted_angle) begin
                                                if (total_angle < (targeted_angle - 20)) move_o <= turn_right30;
                                                else move_o <= turn_right20;
                                                motor_out = motor_turn_right;
                                            end
                                            else begin
                                                if (total_angle > (targeted_angle + 20)) move_o <= turn_left30;
                                                else move_o <= turn_left20;
                                                motor_out = motor_turn_left;
                                            end
                                            yaw_temp = yaw;
                                            state = TURN;
                                        end
                                        
                                        8'bxxx0_1101 : begin
                                            move_o <= turn_right20 | turn_left20 | turn_right30;
                                            if (total_angle < targeted_angle) begin
                                                if (total_angle < (targeted_angle - 20)) move_o <= turn_right30;
                                                else move_o <= turn_right20;
                                                motor_out = motor_turn_right;
                                            end
                                            else begin
                                                move_o <= turn_left20;
                                                motor_out = motor_turn_left;
                                            end
                                            yaw_temp = yaw;
                                            state = TURN;
                                        end
                                        
                                        8'bxxx1_0101 : begin
                                            move_o <= turn_right20 | turn_left20 | turn_left30;
                                            if (total_angle < targeted_angle) begin
                                                move_o <= turn_right20;
                                                motor_out = motor_turn_right;
                                            end
                                            else begin
                                                if (total_angle > (targeted_angle + 20)) move_o <= turn_left30;
                                                else move_o <= turn_left20;
                                                motor_out = motor_turn_left;
                                            end
                                            yaw_temp = yaw;
                                            state = TURN;
                                        end
                                        
                                        8'bxxxx_x010 : begin
                                            move_o <= move_forward;
                                            state = MOVE;
                                             motor_out = motor_forward;
                                        end
                                        
                                        8'bxxx1_1000 : begin
                                            move_o <= turn_right40 | turn_left40;
                                            if (total_angle < targeted_angle) begin
                                                move_o <= turn_right40;
                                                motor_out = motor_turn_right;
                                            end
                                            else begin
                                                move_o <= turn_left40;
                                                motor_out = motor_turn_left;
                                            end
                                            yaw_temp = yaw;
                                            state = TURN;
                                            
                                        end
                                        
                                        8'bxxx0_1000 : begin
                                            move_o <= turn_right40;
                                            yaw_temp = yaw;
                                            state = TURN;
                                            motor_out = motor_turn_right;
                                        end
                                        
                                        8'bxxx1_0000 : begin
                                            move_o <= turn_left40;
                                            yaw_temp = yaw;
                                            state = TURN;
                                            motor_out = motor_turn_left;
                                        end
                                        
                                        8'bx1x0_0000 : begin
                                            move_o <= move_backward;
                                        end
                                        
                                        default   : begin
                                            move_o <= stop; 
                                            motor_out = motor_stop;
                                        end
                                    endcase    
                                end
                    
                                control_left : begin
                                    move_o <= turn_control_left90;
                                    yaw_temp = yaw;
                                    state = TURN;
                                    motor_out = motor_turn_left;
                                end
                                
                                control_right : begin
                                    move_o <= turn_control_right90;
                                    yaw_temp = yaw;
                                    state = TURN;
                                    motor_out = motor_turn_right;
                                end
                                
                                control_back : begin
                                    move_o <= turn_control_right180;
                                    yaw_temp = yaw;
                                    state = TURN;
                                    motor_out = motor_turn_right;
                                end
                            endcase
                        
                        end
                        
                        MOVE : begin
                            state = SENSOR_READ;
                        end
                        
                        TURN : begin
                            turnFlag = 1;
                            
                            if ((move_o == turn_right10) && ((yaw - yaw_temp) > 9)) begin
                                state = MOVE_AHEAD;
                                total_angle = total_angle + 10;
                                motor_out = motor_forward;
                            end
                            if ((move_o == turn_right20) && ((yaw - yaw_temp) > 19)) begin
                                state = MOVE_AHEAD;
                                total_angle = total_angle + 20;
                                motor_out = motor_forward;
                            end
                            if ((move_o == turn_right30) && ((yaw - yaw_temp) > 29)) begin
                                state = MOVE_AHEAD;
                                total_angle = total_angle + 30;
                                motor_out = motor_forward;
                            end
                            if ((move_o == turn_right40) && ((yaw - yaw_temp) > 39)) begin
                                state = MOVE_AHEAD;
                                total_angle = total_angle + 40;
                                motor_out = motor_forward;
                            end
                            
                            if ((move_o == turn_left10) && ((yaw_temp - yaw) > 9)) begin
                                state = MOVE_AHEAD;
                                total_angle = total_angle - 10;
                                motor_out = motor_forward;
                            end
                            if ((move_o == turn_left20) && ((yaw_temp - yaw) > 19)) begin
                                state = MOVE_AHEAD;
                                total_angle = total_angle - 20;
                                motor_out = motor_forward;
                            end
                            if ((move_o == turn_left30) && ((yaw_temp - yaw) > 29)) begin
                                state = MOVE_AHEAD;
                                total_angle = total_angle - 30;
                                motor_out = motor_forward;
                            end
                            if ((move_o == turn_left40) && ((yaw_temp - yaw) > 39)) begin
                                state = MOVE_AHEAD;
                                total_angle = total_angle - 40;
                                motor_out = motor_forward;
                            end
                            if ((move_o == turn_control_right40) && ((yaw - yaw_temp) > 39)) begin
                                state = SENSOR_READ;
                                total_angle = total_angle + 40;
                                motor_out = motor_forward;
                            end
                            if ((move_o == turn_control_left40) && ((yaw_temp - yaw) > 39)) begin
                                state = SENSOR_READ;
                                total_angle = total_angle - 40;
                                motor_out = motor_forward;
                            end
                            
                            if ( (move_o == turn_control_right90) && (yaw - yaw_temp) > 89 ) begin
                                state = SENSOR_READ;
                                total_angle = total_angle + 90;
                                motor_out = motor_forward;
                            end
                            
                            if ( (move_o == turn_control_left90) && (yaw_temp - yaw) > 89 ) begin
                                state = SENSOR_READ;
                                total_angle = total_angle - 90;
                                motor_out = motor_forward;
                            end
                            
                            if ( (move_o == turn_control_right180) && (yaw - yaw_temp) > 179 ) begin
                                state = SENSOR_READ;
                                total_angle = total_angle + 180;
                                motor_out = motor_forward;
                            end
                            
                        end
                        
                        MOVE_AHEAD : begin
                            turn_counter = turn_counter + 1;
                            if(turn_counter == turn_constant) begin
                                turn_counter = 0;
                                turnFlag = 0; 
                                state = SENSOR_READ;
                            end
                        end                
                    endcase
                end 
                else begin 
                    motor_out = motor_stop;
                    state = SENSOR_READ;
                end
            end
        end 
    end

    

endmodule


module mem(mabus,babus,mbbus,membus,write);
  input [/*11*/6:0] mabus;
  input [3:0] babus;
  input mbbus,write;
  output membus;
  wire [/*11*/6:0] mabus;
  wire [3:0] babus;
  wire mbbus;
  wire write;
  reg membus;
  reg [11:0] m[0:127];
  reg [11:0] temp;

  always @(mabus or babus)
    begin
      temp = m[mabus];
      membus = temp[babus];
 //     $display("temp=%o %b %b",temp,babus,membus);
    end

  always @(negedge write)
    begin
      #50
      membus = mbbus;
      temp = m[mabus];
      temp[babus] = mbbus; //not membus
      m[mabus] = temp;
    end

endmodule






module  pdp8_system(cont,halt,sysclk,reset);

  input cont,sysclk,reset;
  output halt;
  wire cont;
  wire sysclk,reset;
  wire halt;
  wire [/*11*/6:0] ma;
  wire  [3:0] ba;
  wire        mb;
  wire        membus;
  wire        write;

  pdp8_cpu cpu(write,membus,cont,
                    ba,ma,mb,halt,reset,sysclk);

  mem memory(ma,ba,mb,membus,write);
  
//  always @(posedge sysclk) #70
//    $display("ma=%o ba=%b membus=%b mb=%b w=%b h=%b %d", ma,ba,membus,mb,write,halt,$time); 
endmodule

`include "clock.v"

module top;
  wire sysclk;
  reg cont;
  wire halt;
  reg reset;
  
  cl #1000000 clock(sysclk);


  pdp8_system pdp8_machine(cont,halt,sysclk,reset);

  reg [11:0] mi,i;
  initial
    begin
      pdp8_machine.memory.m[12'o0100] = 12'o7300;
      pdp8_machine.memory.m[12'o0101] = 12'o1104;
      pdp8_machine.memory.m[12'o0102] = 12'o0105;
      pdp8_machine.memory.m[12'o0103] = 12'o3105;
      pdp8_machine.memory.m[12'o0104] = 12'o7402;
      pdp8_machine.memory.m[12'o0105] = 12'o0707;

      cont = 1;
      
      reset = 0;//1;
      reset = #1 1; //#1 0;
      reset = #3 0; //#3 1;


      $display("time=",$time);
      $display("pc=%o", pdp8_machine.cpu.pc);
      #400 cont=0;
      wait(halt);
      for (i=12'o0100; i<=12'o0105; i = i+1)
        begin
          mi = pdp8_machine.memory.m[i];
          $display("%h%h%h%h/%h%h%h%h",i[11:9],i[8:6],i[5:3],i[2:0],
                                       mi[11:9],mi[8:6],mi[5:3],mi[2:0]);
        end
      $finish;
    end

always @(pdp8_machine.cpu.lac)
  if (pdp8_machine.cpu.ba==12) $display("                  ac=%o     t=%d ba=%d",pdp8_machine.cpu.lac[11:0],$time,pdp8_machine.cpu.ba);
  

always @(pdp8_machine.cpu.pc)
  if (pdp8_machine.cpu.ba==12) $display("pc=%o                       t=%d ba=%d",pdp8_machine.cpu.pc,$time,pdp8_machine.cpu.ba);
  

always @(pdp8_machine.cpu.ir)
  if (pdp8_machine.cpu.ba==12) $display("        ir=%o               t=%d ba=%d",pdp8_machine.cpu.ir,$time,pdp8_machine.cpu.ba);

endmodule




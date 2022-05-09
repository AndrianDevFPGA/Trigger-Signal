/*
  Author : Rakotojaona 
  email : Andrianoelisoa.rakotojaona@gmail.com
  Description : Generating a trigger signal using compter 
*/
module (
       clk,
       rst,
       tx
       );
  // input signal 
  input clk;
  input rst;
  // output signal 
  output tx;
  
  reg [31:0]  counter ; // the counter can compte from 0 to 2 power of 32 
  
  // executed only when positive edge clock
  always @ (posedge clk)
  begin
  counter <= counter + 1;
  if (rst)
  begin
    counter <=0;
    tx <=0;
  end
  else
  begin
    if (counter == 32'd50)
    begin
      tx <=1;
    end
    if (counter ==32'd51)
    begin
      tx <=0;
    end 
  end 
  end 
       
endmodule

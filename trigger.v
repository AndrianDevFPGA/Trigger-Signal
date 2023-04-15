/*
  Author : Rakotojaona 
  email : Andrianoelisoa.rakotojaona@gmail.com
  Description : Generating a trigger signal using compter 
*/
module trigger(
       clk,
       rst,
       tx
       );
  // input signal 
  input clk;
  input rst;
  // output signal 
  output reg tx;
  
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

/*
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;

entity triggerSignal is
    port (
        clk, rst: in std_logic; 
        tx: out std_logic
    );
end entity;

architecture Behavioral of triggerSignal is

    signal counter : unsigned(6 downto 0);

begin

    process (clk) is
    begin
        if rising_edge(clk) then
            if rst = '1' then
                tx <= '0';
                counter <= (others => '0');
            else
                counter <= counter + 1;
                if counter = "1100100" then
                    tx <= '1';
                    counter <= (others => '0');
                else
                    tx <= '0';
                end if;
            end if;
        end if;
    end process;

end architecture;

*/

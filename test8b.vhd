----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/25/2017 01:27:11 AM
-- Design Name: 
-- Module Name: test8b - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity test8b is
--  Port ( );
end test8b;

architecture Behavioral of test8b is
 signal x: std_logic_vector(7 downto 0) := "00000000";
 signal y: std_logic_vector(7 downto 0) := "00000000";
 signal tin: std_logic := '0';
 signal s: std_logic_vector(7 downto 0);
 signal tout: std_logic;
begin

DUT: entity WORK.sum8b port map(x,y,tin,s,tout);

gen_signal: process
            begin
                x <= "00000010";
                y <= "00000001";
                tin <= '1';
                wait for 20 ns;
                
                 x <= "11111110";
                 y <= "11111101";
                 tin <= '1';
                 wait for 20 ns;
                 
                  x <= "10000010";
                                                  y <= "00100100";
                                                  tin <= '1';
                                                  wait for 20 ns;    
                 
                 x <= "00000010";
                                 y <= "00000001";
                                 tin <= '0';
                                 wait for 20 ns;
                                 
                                  x <= "11111110";
                                  y <= "11111101";
                                  tin <= '0';
                                  wait for 20 ns; 
                                  
                                  x <= "10000010";
                                  y <= "00100100";
                                  tin <= '0';
                                  wait for 20 ns;   
            end process;
end Behavioral;

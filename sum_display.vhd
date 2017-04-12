----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/28/2017 03:11:22 PM
-- Design Name: 
-- Module Name: sum_display - Behavioral
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

entity sum_display is
  Port ( 
  Clk: in STD_LOGIC;
  Rst: in STD_LOGIC;
  x: in STD_LOGIC_VECTOR(7 downto 0);
  y: in STD_LOGIC_VECTOR(7 downto 0);
  An: out STD_LOGIC_VECTOR(7 downto 0);
  Seg: out STD_LOGIC_VECTOR(7 downto 0)
  );
end sum_display;

architecture Behavioral of sum_display is
signal data:STD_LOGIC_VECTOR(31 downto 0);
signal s:STD_LOGIC_VECTOR(7 downto 0);
signal tout:STD_LOGIC;
signal Rstp: STD_LOGIC;

begin

Rstp <= not Rst;
data(15 downto 8) <= x;
data(7 downto 0) <= y;
data(19 downto 16) <= "0000";
data(23 downto 20) <= "000" & tout;
data(31 downto 24) <= s; 
 
DUT1: entity WORK.sum8b port map(x,y,'0',s,tout);
DUT2: entity WORK.displ7seg port map(Clk, Rstp, data, An, Seg);
end Behavioral;

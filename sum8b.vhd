----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/24/2017 10:37:34 AM
-- Design Name: 
-- Module Name: sum8b - Behavioral
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

entity sum8b is
  Port (
    x:in std_logic_vector(7 downto 0);
    y:in std_logic_vector(7 downto 0);
    tin:in std_logic;
    s:out std_logic_vector(7 downto 0);
    tout:out std_logic
  );
end sum8b;

architecture Behavioral of sum8b is
signal t2,t4,t6:std_logic;
signal p0_1,g0_1,p2_3,g2_3,p4_5,g4_5,p6_7,g6_7: std_logic;

begin
    DUT1: entity WORK.sum2b port map(
                x => x(1 downto 0), 
                y => y(1 downto 0), 
                tin => tin, 
                s => s(1 downto 0), 
                p => p0_1, 
                g => g0_1);
    t2 <= g0_1 or (p0_1 and tin);
    
    DUT2: entity WORK.sum2b port map(
                    x => x(3 downto 2), 
                    y => y(3 downto 2), 
                    tin => t2, 
                    s => s(3 downto 2), 
                    p => p2_3, 
                    g => g2_3);
    t4 <= g2_3 or (p2_3 and t2);
    
    DUT3: entity WORK.sum2b port map(
                        x => x(5 downto 4), 
                        y => y(5 downto 4), 
                        tin =>t4, 
                        s => s(5 downto 4), 
                        p => p4_5, 
                        g => g4_5);
    t6 <= g4_5 or (p4_5 and t4);
    
    DUT4: entity WORK.sum2b port map(
                        x => x(7 downto 6), 
                        y => y(7 downto 6), 
                        tin =>t6, 
                        s => s(7 downto 6), 
                        p => p6_7, 
                        g => g6_7);
    tout <= g6_7 or (p6_7 and t6);
    
end Behavioral;

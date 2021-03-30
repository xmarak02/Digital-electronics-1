----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 24.03.2021 13:08:58
-- Design Name: 
-- Module Name: d_latch - Behavioral
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

entity d_latch is
     Port (
     en     : in  std_logic;
     arst   : in  std_logic;
     d      : in  std_logic;
     q      : out  std_logic;
     q_bar  : out  std_logic
     );
end d_latch;

architecture Behavioral of d_latch is

begin
    p_d_latch : process (d, arst, en)
begin
    if (arst = '1') then
        q       <= '0';
        q_bar   <= '1';
        
    elsif (en = '1') then
        q       <= d;
        q_bar   <= not d;
        
    end if;
end process p_d_latch;


end Behavioral;

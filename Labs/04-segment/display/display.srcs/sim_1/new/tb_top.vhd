
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity tb_top is
--  Port ( );
end tb_top;

architecture Behavioral of tb_top is

--Local signals
    signal s_sw        : std_logic_vector(4 - 1 downto 0);
    signal s_led       : std_logic_vector(8 - 1 downto 0);
    signal s_CA :  STD_LOGIC;
    signal s_CB :  STD_LOGIC;
    signal s_CC :  STD_LOGIC;
    signal s_CD :  STD_LOGIC;
    signal s_CE :  STD_LOGIC;
    signal s_CF :  STD_LOGIC;
    signal s_CG :  STD_LOGIC;
    

           
begin

    uut_top : entity work.top 
    port map(
        sw  => s_sw,
        LED => s_led,
        CA => s_CA,
        cb => s_CB,
        cc => s_CC,
        cd => s_CD,
        ce => s_CE,
        cf => s_CF,
        cg => s_CG  
        
    );
   
     
      p_stimulus : process
    begin
        -- Report a note at the begining of stimulus process
        report "Stimulus process started" severity note;
        s_sw <= "0000"; wait for 10ns;
        
        s_sw <= "0001"; wait for 10ns;
        
        s_sw <= "0010"; wait for 10ns;
        
        s_sw <= "0011"; wait for 10ns;
        
        s_sw <= "0100"; wait for 10ns;
        
        s_sw <= "0101"; wait for 10ns;
        
        s_sw <= "0110"; wait for 10ns;
        
        s_sw <= "0111"; wait for 10ns;
        
        s_sw <= "1000"; wait for 10ns;
        
        s_sw <= "1001"; wait for 10ns;
        
        s_sw <= "1010"; wait for 10ns;
        
        s_sw <= "1011"; wait for 10ns;
        
        s_sw <= "1100"; wait for 10ns;
        
        s_sw <= "1101"; wait for 10ns;
        
        s_sw <= "1110"; wait for 10ns;
        
        s_sw <= "1111"; wait for 10ns;
        
    -- Report a note at the end of stimulus process
        report "Stimulus process finished" severity note;
        wait;
    end process p_stimulus; 
     
end Behavioral;

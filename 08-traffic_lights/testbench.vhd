library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity testbench is
-- empty
end testbench;

architecture tb of testbench is 

component Krizovatka is

port(
	clk_i:     in STD_LOGIC;
        srst_n_i:  in STD_LOGIC;
        ce_2Hz_i : in STD_LOGIC;
        svetla_o:  out unsigned (6-1 downto 0)
);

end component Krizovatka;

signal s_clk_i:        STD_LOGIC := '0';
signal s_srst_n_i:     STD_LOGIC := '0';
signal s_ce_2Hz_i	:  STD_LOGIC := '0';
signal s_svetla_o:     unsigned (6-1 downto 0);

begin
	UUT: Krizovatka
    port map(
     		clk_i => s_clk_i, 
     		srst_n_i => s_srst_n_i, 
		ce_2Hz_i => s_ce_2Hz_i,
		svetla_o => s_svetla_o
    		);

clk_gen: process
  	begin
    	while now < 1000ns loop	
      		s_clk_i <= '0';
      		wait for 0.5ns;
      		s_clk_i <= '1';
      		wait for 0.5ns;
    	end loop;
    	wait;
  	end process clk_gen;

clk_2Hz_gen: process	
  	begin
    	while Now < 1000 NS loop
      		s_ce_2Hz_i <= '0';
      		wait for 1.5 NS;
      		s_ce_2Hz_i <= '1';
      		wait for 0.5 NS;
    	end loop;
    	wait;
  	end process clk_2Hz_gen;

-- Stimulus process
stim_proc: process
   begin		
 
      s_srst_n_i <= '1';
      wait until rising_edge(s_clk_i);
      
      wait;
   end process;

end tb;


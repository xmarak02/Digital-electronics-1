library IEEE;
use IEEE.std_logic_1164.all;
use ieee.numeric_std.all;
----------------------------------------------------------------

entity testbench is
--empty
end testbench;
----------------------------------------------------------------

architecture tb of testbench is

component driver_7seg is
port(
	clk_i    		: 	in  std_logic;
    srst_n_i 		: 	in  std_logic;
    cnt_en_i 		: 	in  std_logic;	
    seg_o    		: 	out unsigned(7-1 downto 0);
    dig_o    		: 	out unsigned(4-1 downto 0)
);
end component;

signal s_clk_i   	: 	std_logic := '0';
signal s_srst_n_i 	:   std_logic := '0';   
signal s_cnt_en_i	:   std_logic := '0';
signal seg_out   	:  	unsigned(7-1 downto 0);
signal dig_out    	:  	unsigned(4-1 downto 0);


begin
	UUT: driver_7seg port map(
     	clk_i => s_clk_i, 
     	srst_n_i => s_srst_n_i, 
    	cnt_en_i => s_cnt_en_i,
      	seg_o => seg_out, 
      	dig_o => dig_out
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
   
   -- Stimulus process
   stim_proc: process
   begin		
 
      s_srst_n_i <= '1';
      wait until rising_edge(s_clk_i);
      
      wait;
   end process;
end tb;

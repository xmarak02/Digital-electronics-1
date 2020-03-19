library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
--------------------------------------------------------------------------

entity Stopwatch is

port(
    clk_i       : in std_logic;
    ce_100Hz_i  : in std_logic;
    srst_n_i    : in std_logic;
    cnt_en_i    : in std_logic; 
  
    sec_h_o     : out unsigned (4-1 downto 0); --desitky
    sec_l_o     : out unsigned (4-1 downto 0); --sekundy
    hth_h_o     : out unsigned (4-1 downto 0); --desetiny
    hth_l_o     : out unsigned (4-1 downto 0)  --setiny
	);
end entity stopwatch;

architecture Behavioral of stopwatch is
    
	signal s_sec_h_o  	: unsigned (4-1 downto 0) := (others => '0');
	signal s_sec_l_o  	: unsigned (4-1 downto 0) := (others => '0');
	signal s_hth_h_o  	: unsigned (4-1 downto 0) := (others => '0');
	signal s_hth_l_o  	: unsigned (4-1 downto 0) := (others => '0');
    signal s_en			: std_logic;

begin

p_Assign: process(clk_i)
begin
	if rising_edge(clk_i) 
		then 
            
    hth_l_o <= unsigned(s_hth_l_o);
    hth_h_o <= unsigned(s_hth_h_o);
    sec_l_o <= unsigned(s_sec_l_o);
    sec_h_o <= unsigned(s_sec_h_o);
            
    if cnt_en_i = '1' 
   		then
        	s_en <=	'0';
            	else
            s_en <=	'1';
    end if;
end if;
end process; 


p_Cnt: process(
    	 clk_i,
         srst_n_i,
         s_en,
         s_sec_h_o,
         s_sec_l_o,
         s_hth_h_o,
         s_hth_l_o
         )
         
begin    
	if rising_edge(clk_i) then    	    
		if srst_n_i = '0'
        		or (s_hth_l_o = 9 
            	and s_hth_h_o = 9 
				and s_sec_l_o = 9 
                and s_sec_h_o = 5
            	)
			then
				s_sec_h_o <= (others => '0');  
         		s_sec_l_o <= (others => '0');
        		s_hth_h_o <= (others => '0');
         	    s_hth_l_o <= (others => '0'
                );
                
		elsif s_en = '1' 
				and ce_100Hz_i = '1' 
			then
				s_hth_l_o <= s_hth_l_o + 1;
                    
			if s_hth_l_o = 9 
				then
					s_hth_l_o <= (others => '0');
		   	    	s_hth_h_o <= s_hth_h_o + 1;
                    
				if s_hth_h_o = 9 
					then
						s_hth_h_o <= (others => '0');
						s_sec_l_o <= s_sec_l_o + 1;
                            
       				if s_sec_l_o = 9 
            			then
							s_sec_l_o <= (others => '0');
							s_sec_h_o <= s_sec_h_o + 1;
                                    
					end if;
				end if;
			end if;
		end if;
	end if;

end process; 

end architecture Behavioral;
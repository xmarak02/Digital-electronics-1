library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity Krizovatka is 

port(
	clk_i:      in STD_LOGIC;
        srst_n_i:   in STD_LOGIC;
        ce_2Hz_i :  in STD_LOGIC;	 
        svetla_o:   out unsigned (6-1 downto 0) -- 6 bits/LEDs coming out
);

end entity Krizovatka;


architecture Krizovatka of Krizovatka is

type stav_svetel is (s0, s1, s2, s3, s4, s5);
	
		    -- we couldn't figured out something more "meaningful", so here's the explanation:
		    -- s0: GREEN  RED:    5s
                    -- s1: ORANGE RED:    1s
                    -- s2: RED    RED:    1s
                    -- s3: RED    GREEN:  5s
                    -- s4: RED    ORANGE: 1s
                    -- s5: RED    RED:    1s

signal count: unsigned(4-1 downto 0);
constant SEC5: unsigned(4-1 downto 0) := "1111"; -- 15 -> 5s
constant SEC1: unsigned(4-1 downto 0) := "0011"; -- 3 -> 1s
signal state: stav_svetel;
signal s_srst_n_i: STD_LOGIC;
signal s_en: STD_LOGIC;

begin
----------------------------------------------------------
CLOCK: entity work.clock_enable
generic map(g_NPERIOD => x"000A")
port map(
	clk_i => clk_i,
        srst_n_i => srst_n_i,
        clock_enable_o => s_en
        );
----------------------------------------------------------
Krizovatka: process(clk_i, srst_n_i)

begin

if rising_edge(clk_i) then

	if srst_n_i = '0' then
						state <= s0;
   						count <= X"0";
    
	elsif rising_edge(clk_i) and ce_2Hz_i = '1' then
    								case state is
                                    
                                   	 when s0 =>
                                      if count < SEC5 then
                                      					state <= s0;
                                      					count <= count +1;
                                      else
                                      					state <= s1;
                                      					count <= X"0";
                                      end if;
                                      
                                     when s1 =>
                                      if count < SEC1 then
                                      					state <= s1;
                                      					count <= count +1;
                                      else
                                      					state <= s2;
                                      					count <= X"0";
                                      end if;
                                     
                                     when s2 =>
                                      if count < SEC1 then
                                      					state <= s2;
                                      					count <= count +1;
                                      else
                                      					state <= s3;
                                      					count <= X"0";
                                      end if;
                                     
                                     when s3 =>
                                      if count < SEC5 then
                                      					state <= s3;
                                      					count <= count +1;
                                      else
                                      					state <= s4;
                                      					count <= X"0";
                                      end if;
                                      
                                     when s4 =>
                                      if count < SEC1 then
                                      					state <= s4;
                                      					count <= count +1;
                                      else
                                      					state <= s5;
                                      					count <= X"0";
                                      end if;
                                      
                                     when s5 =>
                                      if count < SEC1 then
                                      					state <= s5;
                                      					count <= count +1;
                                      else
                                      					state <= s0;
                                      					count <= X"0";
                                      end if;
                                     when others =>
                                      state <= s0;
                                    end case;
	end if;
end if;
end process Krizovatka; 

Prirazeni_svetel: process (state)

begin

	case state is
	when s0     => svetla_o <= "100000";
    	when s1     => svetla_o <= "010000";
 	when s2     => svetla_o <= "001000";
 	when s3     => svetla_o <= "000100";
 	when s4     => svetla_o <= "000010";
 	when s5     => svetla_o <= "000001";
   	when others => svetla_o <= "100000";
	end case;

end process;

end Krizovatka;

# 03-vivado



## 1. Pinout table

SW0-15 připojeny pomocí 10K rezistorů

|  SW  | pin  |
| :--: | :--: |
| SW0  | J15  |
| SW1  | L16  |
| SW2  | M13  |
| SW3  | R15  |
| SW4  | R17  |
| SW5  | T18  |
| SW6  | U18  |
| SW7  | R13  |
| SW8  |  T8  |
| SW9  |  U8  |
| SW10 | R16  |
| SW11 | T13  |
| SW12 |  H6  |
| SW13 | U12  |
| SW14 | U11  |
| SW15 | V10  |



LED0-15 připojeny pomocí 330R rezistorů

|  LED  | pin  |
| :---: | :--: |
| LED0  | H17  |
| LED1  | K15  |
| LED2  | J13  |
| LED3  | N14  |
| LED4  | R18  |
| LED5  | V17  |
| LED6  | U17  |
| LED7  | U16  |
| LED8  | V16  |
| LED9  | T16  |
| LED10 | U14  |
| LED11 | T16  |
| LED12 | V15  |
| LED13 | V14  |
| LED14 | V12  |
| LED15 | V11  |



## 2. 2Bit 4to1 multiplexer 





```vhdl
--mux_2bit_4to1.vhd

architecture Behavioral of mux_2bit_4to1 is

begin
    f_o <= a_i when (sel_i = "00") else
           b_i when (sel_i = "01") else
           c_i when (sel_i = "10") else
           d_i;

end Behavioral;
```



```vhdl
--tb_mux_2bit_4to1.vhd

 p_stimulus : process
    begin
        -- Report a note at the begining of stimulus process
        report "Stimulus process started" severity note;

        -- First test values
        s_d <= "00"; s_c <= "00"; s_b <= "00"; s_a <= "00"; 
        s_sel <= "00";  wait for 100 ns;
     
        s_d <= "10"; s_c <= "01"; s_b <= "01"; s_a <= "01"; 
        s_sel <= "00";  wait for 100 ns;
     
        s_d <= "10"; s_c <= "01"; s_b <= "01"; s_a <= "11"; 
        s_sel <= "01";  wait for 100 ns;
     
        s_d <= "10"; s_c <= "01"; s_b <= "01"; s_a <= "01"; 
        s_sel <= "01";  wait for 100 ns;
        
        s_d <= "11"; s_c <= "10"; s_b <= "01"; s_a <= "00"; 
        s_sel <= "10";  wait for 100 ns;
        
        s_d <= "11"; s_c <= "10"; s_b <= "01"; s_a <= "00"; 
        s_sel <= "10";  wait for 100 ns;
          
        s_d <= "11"; s_c <= "10"; s_b <= "01"; s_a <= "00"; 
        s_sel <= "11";  wait for 100 ns;
        
        s_d <= "11"; s_c <= "10"; s_b <= "01"; s_a <= "00"; 
        s_sel <= "11";  wait for 100 ns;

        -- Report a note at the end of stimulus process
        report "Stimulus process finished" severity note;
    end process p_stimulus;
```

##### simulation

![sim](D:\DE1\marak\Digital-electronics-1\Labs\03-vivado\sim.png)

## 3. Tutorial



Založení projektu:
![01](D:\DE1\marak\Digital-electronics-1\Labs\03-vivado\tutorial\01.PNG)
Pomocí wizardu projdeme založení projektu

![02](D:\DE1\marak\Digital-electronics-1\Labs\03-vivado\tutorial\02.PNG)

ve wizardu se pohybujeme šipkami next

Pojmenování projektu a jeho umístění:

![03](D:\DE1\marak\Digital-electronics-1\Labs\03-vivado\tutorial\03.PNG)

Vybereme RTL project

 ![04](D:\DE1\marak\Digital-electronics-1\Labs\03-vivado\tutorial\04.PNG)

Následně přidáme zdrojové soubory vybráním create file a vybereme typ souboru VHDL 

![05](D:\DE1\marak\Digital-electronics-1\Labs\03-vivado\tutorial\05.PNG)

Můžeme přidat constraints files

![06](D:\DE1\marak\Digital-electronics-1\Labs\03-vivado\tutorial\06.PNG)

Vybereme desku Nexys A7-50T

![07](D:\DE1\marak\Digital-electronics-1\Labs\03-vivado\tutorial\07.PNG)

A nakonec tlačítkem Finish projekt vytvoříme

![08](D:\DE1\marak\Digital-electronics-1\Labs\03-vivado\tutorial\08.PNG)



###### Přidání souboru

Pokud chceme přidat soubor, např testbench, tak pomocí File>Add source (nebo Alt+A) vyvoláme okno kde vyberem nejprve typ souboru:

![11](D:\DE1\marak\Digital-electronics-1\Labs\03-vivado\tutorial\11.PNG)

Opět vybereme typ souboru a zadáme název

![12](D:\DE1\marak\Digital-electronics-1\Labs\03-vivado\tutorial\12.PNG)

Simulace se spistí ze záložky Flow>Run Simulation>Run Behavioral Simulation nebo z bočního navigátoru v sekci Simulation


```

```
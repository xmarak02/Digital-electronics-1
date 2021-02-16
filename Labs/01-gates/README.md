# 01 - gates

##nadpis druhé úrovne##
*gates*
##VHDL##
 ```vhdl

library ieee;               -- Standard library
use ieee.std_logic_1164.all;-- Package for data types and logic operations

------------------------------------------------------------------------
-- Entity declaration for basic gates
------------------------------------------------------------------------
entity gates is
    port(
        a_i    : in  std_logic;         -- Data input
        b_i    : in  std_logic;         -- Data input
        c_i	   : in  std_logic;			-- Data input
        f_o    : out std_logic;         -- OR output function
        fnand_o : out std_logic;         -- NAND output function
        fnor_o : out std_logic          -- NOR output function
    );
end entity gates;

------------------------------------------------------------------------
-- Architecture body for basic gates
------------------------------------------------------------------------
architecture dataflow of gates is
begin
    f_o  <= ((not b_i) and a_i) or ((not c_i) and (not b_i));
    fnand_o <= (a_i and (not b_i) and (not b_i) and (not c_i));
    fnor_o <= ((not ((not a_i) or b_i)) or (not(c_i or b_i)));

end architecture dataflow;

 ```
  
  
   
 ![rovnice](rovnice.gif)
   
   &nbsp;

   | **c** | **b** |**a** | ![equation](https://latex.codecogs.com/gif.latex?f) | ![equation](http://latex.codecogs.com/svg.latex?f(c,b,a)_{\textup{NAND}}) | ![equation](http://latex.codecogs.com/svg.latex?f(c,b,a)_{\textup{NOR}}) |
   | :-: | :-: | :-: | :-: | :-: | :-: |
   | 0 | 0 | 0 | 1 | 1 | 1 |
   | 0 | 0 | 1 | 0 | 0 | 0 |
   | 0 | 1 | 0 | 0 | 0 | 0 |
   | 0 | 1 | 1 | 0 | 0 | 0 |
   | 1 | 0 | 0 | 1 | 1 | 1 |
   | 1 | 0 | 1 | 1 | 1 | 1 |
   | 1 | 1 | 0 | 0 | 0 | 0 |
   | 1 | 1 | 1 | 0 | 0 | 0 |
   
   
   
   
   ![equation](http://latex.codecogs.com/svg.latex?f(c,b,a)_{\textup{NAND}})
   
   zkouska
   
   


   ![equation](https://latex.codecogs.com/gif.latex?f%20%3D%20a%5Ccdot%20%5Coverline%7Bb%7D%20&plus;%20%5Coverline%7Bb%7D%5Ccdot%20%5Coverline%7Bc%7D)

   &nbsp;

   ![equation](https://latex.codecogs.com/gif.latex?f_%7BAND%7D%20%3D)
    
   &nbsp;
    
   ![equation](https://latex.codecogs.com/gif.latex?f_%7BOR%7D%20%3D)
    
   &nbsp;
   
    | **A** | **NOT** |
 | :-: | :-: |
 | 0 | 1 |
 | 1 | 0 |

   | **A** | **B** | **AND** | **NAND** |
   | :-: | :-: | :-: | :-: |
   | 0 | 0 | 0 | 1 |
   | 0 | 1 | 0 | 1 |
   | 1 | 0 | 0 | 1 |
   | 1 | 1 | 1 | 0 |

   | **A** | **B** | **OR** | **NOR** |
   | :-: | :-: | :-: | :-: |
   | 0 | 0 | 0 | 1 |
   | 0 | 1 | 1 | 0 |
   | 1 | 0 | 1 | 0 |
   | 1 | 1 | 1 | 0 |

   | **A** | **B** | **XOR** | **XNOR** |
   | :-: | :-: | :-: | :-: |
   | 0 | 0 | 0 | 1 |
   | 0 | 1 | 1 | 0 |
   | 1 | 0 | 1 | 0 |
   | 1 | 1 | 0 | 1 |


![and_gates](gates1.png)


   ![equation](https://latex.codecogs.com/gif.latex?f%20%3D%20a%5Ccdot%20%5Coverline%7Bb%7D%20&plus;%20%5Coverline%7Bb%7D%5Ccdot%20%5Coverline%7Bc%7D)

   &nbsp;

   ![equation](https://latex.codecogs.com/gif.latex?f_%7BAND%7D%20%3D)
    
   &nbsp;
    
   ![equation](https://latex.codecogs.com/gif.latex?f_%7BOR%7D%20%3D)
    
   &nbsp;

   | **A** | **B** |**C** | ![equation](https://latex.codecogs.com/gif.latex?f) | ![equation](https://latex.codecogs.com/gif.latex?f_%7BAND%7D) | ![equation](https://latex.codecogs.com/gif.latex?f_%7BOR%7D) |
   | :-: | :-: | :-: | :-: | :-: | :-: |
   | 0 | 0 | 0 | 1 | 1 | 1 |
   | 0 | 0 | 1 | 0 | 0 | 0 |
   | 0 | 1 | 0 | 0 | 0 | 0 |
   | 0 | 1 | 1 | 0 | 0 | 0 |
   | 1 | 0 | 0 | 1 | 1 | 1 |
   | 1 | 0 | 1 | 1 | 1 | 1 |
   | 1 | 1 | 0 | 0 | 0 | 0 |
   | 1 | 1 | 1 | 0 | 0 | 0 |
 

   

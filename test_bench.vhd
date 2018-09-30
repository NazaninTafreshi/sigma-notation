--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   17:25:19 11/20/2016
-- Design Name:   
-- Module Name:   G:/fpgaWorkSpace/zigma/test_bench.vhd
-- Project Name:  zigma
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: sum_of_product
-- 
-- Dependencies:
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
--
-- Notes: 
-- This testbench has been automatically generated using types std_logic and
-- std_logic_vector for the ports of the unit under test.  Xilinx recommends
-- that these types always be used for the top-level I/O of a design in order
-- to guarantee that the testbench will bind correctly to the post-implementation 
-- simulation model.
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.std_logic_arith.ALL;
USE ieee.std_logic_unsigned.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY test_bench IS
END test_bench;
 
ARCHITECTURE behavior OF test_bench IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT sum_of_product
    PORT(
         a : IN  std_logic_vector(7 downto 0);
         x : IN  std_logic_vector(7 downto 0);
         clk : IN  std_logic;
         n:  integer range 0 to 1023;
         y : OUT  std_logic_vector(15 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal a : std_logic_vector(7 downto 0) := (others => '0');
   signal x : std_logic_vector(7 downto 0) := (others => '0');
   signal clk : std_logic := '0';
   signal  n:integer range 0 to 1023;

 	--Outputs
   signal y : std_logic_vector(15 downto 0);

   
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: sum_of_product PORT MAP (
          a => a,
          x => x,
          clk => clk,
          n => n,
          y => y
        );

   
 n<=9;
 clk<=not clk after 50ns;
 a<=X"01" after 110ns,X"03" after 200ns,X"04" after 310ns,X"0A" after 440ns ,X"01" after 540ns,X"03" after 640ns,X"04" after 740ns,X"0A" after 850ns,X"05" after 900ns,X"05" after 1000ns;
 x<=X"02" after 110ns,X"05" after 200ns,X"02" after 310ns,X"05" after 440ns ,X"02" after 540ns,X"05" after 640ns,X"03" after 740ns,X"01" after 850ns,X"06" after 900ns,X"05" after 1000ns;


END;

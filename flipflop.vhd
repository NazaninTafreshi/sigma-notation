----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    18:13:46 11/19/2016 
-- Design Name: 
-- Module Name:    flipflop - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
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
use IEEE.STD_LOGIC_arith.ALL;
use IEEE.STD_LOGIC_unsigned.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity flipflop is
generic(n: integer range  0 to 1023:=8);
   port(d: in std_logic_vector (n-1 downto 0);
	     clk ,clr , en: in std_logic;
        q: out std_logic_vector (n-1 downto 0)); 
end flipflop;
architecture behavioral of flipflop is
begin
process(clk)
begin
if (clk' event and clk='1') then
    if clr='1' then q<=(others=>'0');
    elsif en='1' then q<=d;
    end if;
end if;
end process;
end behavioral;


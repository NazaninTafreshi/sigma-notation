----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    10:44:56 11/20/2016 
-- Design Name: 
-- Module Name:    counter - Behavioral 
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

entity counter is
    Port ( input : in  integer range 0 to 1023:=8;
           clk : in  STD_LOGIC;
			  clr_out ,en_out : out  STD_LOGIC);
end counter;

architecture Behavioral of counter is

begin
process(clk)
variable count:integer range 0 to 1023:=0;
begin
if(clk'event and clk='1') then
if count=0 then
clr_out<='1';
count:=count+1;
else
clr_out<='0';
count:=count+1;
end if;
if count=input then 
en_out<='1';
count:=0;
else 
en_out<='0';
end if;
end if;
end process;
end Behavioral;




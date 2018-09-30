----------------------------------------------------------------------------------
-- Company: 
-- Engineer:       Nazanin Tafreshi
-- 
-- Create Date:    18:11:01 11/19/2016 
-- Design Name: 
-- Module Name:    sum_of_product - Behavioral 
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

entity sum_of_product is
    Port ( a : in  STD_LOGIC_vector (7 downto 0);
           x : in  STD_LOGIC_vector (7 downto 0);
           clk : in  STD_LOGIC;
			  n:integer range 0 to 1023:=14;
			  y :out STD_LOGIC_vector (15 downto 0));
end sum_of_product;

architecture Structural of sum_of_product is

component flipflop
     generic(n: integer range  0 to 1023:=8);
      port(d: in std_logic_vector (n-1 downto 0);
	        clk, clr , en: in std_logic;
           q: out std_logic_vector (n-1 downto 0));
end component;

component adder
      port(a,b:in std_logic_vector (15 downto 0);
	        s:out std_logic_vector (15 downto 0));
end component;

component multiplier
      port(a,b:in std_logic_vector (7 downto 0);
	        c:out std_logic_vector (15 downto 0));
end component;

component counter
       Port ( input : in  integer range 0 to 1023:=14;
             clk : in  STD_LOGIC;
			    clr_out ,en_out: out  STD_LOGIC);
end component;

signal c_clr,c_en:std_logic;
signal s_a,s_b: std_logic_vector(7 downto 0);
signal s_m,s_r3,s_add:std_logic_vector(15 downto 0);

begin
f1:flipflop
generic map  (n => 8)
port map(d=>a,clk=>clk,clr=>'0',en=>'1',q=>s_a);

f2:flipflop 
generic map  (n => 8)
port map(d=>x,clk=>clk,clr=>'0',en=>'1',q=>s_b);	  
	  
m:multiplier
port map(a=>s_a,b=>s_b,c=>s_m);

add:adder
port map(a=>s_m,b=>s_r3,s=>s_add);

count:counter
port map(input=>n,clk=>clk,clr_out=>c_clr,en_out=>c_en);

f3:flipflop
generic map  (n => 16)
port map(d=>s_add,clk=>clk,clr=>c_clr,en=>'1',q=>s_r3);

--f4:flipflop
--generic map  (n => 16)
--port map(d=>s_r3,clk=>clk,clr=>'0',en=>'1',q=>y);
y<=s_r3;

end Structural;
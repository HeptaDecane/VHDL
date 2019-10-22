----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    16:17:23 10/22/2019 
-- Design Name: 
-- Module Name:    ASYNC_DOWN - STRUCTURAL 
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

entity ASYNC_DOWN is
    Port ( clock : in  STD_LOGIC;
           clear : in  STD_LOGIC;
           count : out  STD_LOGIC_VECTOR(2 downto 0));
end ASYNC_DOWN;

architecture STRUCTURAL of ASYNC_DOWN is

	component JK_FF is
	    Port ( j : in  STD_LOGIC;
				  k : in  STD_LOGIC;
				  clear : in STD_LOGIC;
				  clock : in STD_LOGIC;
				  q : out STD_LOGIC);
	end component;
	
	signal temp : STD_LOGIC_VECTOR(2 downto 0):="000";
	
begin

	JK_FF1: JK_FF port map(clear=>clear,clock=>clock,j=>'1',k=>'1',q=>temp(2));
	JK_FF2: JK_FF port map(clear=>clear,clock=>temp(2),j=>'1',k=>'1',q=>temp(1));
	JK_FF3: JK_FF port map(clear=>clear,clock=>temp(1),j=>'1',k=>'1',q=>temp(0));
	count(2)<=temp(0);
	count(1)<=temp(1);
	count(0)<=temp(2);

end STRUCTURAL;

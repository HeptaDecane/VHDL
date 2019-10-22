----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    15:13:04 10/22/2019 
-- Design Name: 
-- Module Name:    ASYNC_UP - STRUCTURAL 
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

entity ASYNC_UP is
    Port ( clock : in  STD_LOGIC;
           clear : in  STD_LOGIC;
           count : out  STD_LOGIC_VECTOR(2 downto 0));
end ASYNC_UP;

architecture STRUCTURAL of ASYNC_UP is

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
	JK_FF2: JK_FF port map(clear=>clear,clock=>not temp(2),j=>'1',k=>'1',q=>temp(1));
	JK_FF3: JK_FF port map(clear=>clear,clock=>not temp(1),j=>'1',k=>'1',q=>temp(0));
	count(2)<=temp(0);
	count(1)<=temp(1);
	count(0)<=temp(2);

end STRUCTURAL;


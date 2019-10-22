--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   16:28:30 10/22/2019
-- Design Name:   
-- Module Name:   /home/near/VHDL/AsyncDownStructural/TEST_ASYNC_DOWN.vhd
-- Project Name:  AsyncDownStructural
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: ASYNC_DOWN
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
 
ENTITY TEST_ASYNC_DOWN IS
END TEST_ASYNC_DOWN;
 
ARCHITECTURE behavior OF TEST_ASYNC_DOWN IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT ASYNC_DOWN
    PORT(
         clock : IN  std_logic;
         clear : IN  std_logic;
         count : OUT  std_logic_vector(2 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal clock : std_logic := '0';
   signal clear : std_logic := '0';

 	--Outputs
   signal count : std_logic_vector(2 downto 0);
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: ASYNC_DOWN PORT MAP (
          clock => clock,
          clear => clear,
          count => count
        );
		  
	process
	begin
	
		wait for 5ns;
		clock <= not clock;
		
	end process;

	process
	begin
	
		clear <= '1';
		wait for 50ns;
		clear <= not clear;
		wait;
	
	end process;

END;




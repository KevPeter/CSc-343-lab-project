
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY sign_extend_testbench IS
END sign_extend_testbench;
 
ARCHITECTURE behavior OF sign_extend_testbench IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT sign_extend
    PORT(
         I_SE_EN : IN  std_logic;
         I_SE_DATA : IN  std_logic_vector(15 downto 0);
         O_SE_DATA : OUT  std_logic_vector(31 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal I_SE_EN : std_logic := '0';
   signal I_SE_DATA : std_logic_vector(15 downto 0) := (others => '0');

 	--Outputs
   signal O_SE_DATA : std_logic_vector(31 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: sign_extend PORT MAP (
          I_SE_EN => I_SE_EN,
          I_SE_DATA => I_SE_DATA,
          O_SE_DATA => O_SE_DATA
        );


 

   -- Stimulus process
   stim_proc: process
   begin		
		wait for 10 ns;
		I_SE_EN <= '1';
		
		-- TEST 1, given MSB of 1
		I_SE_DATA <= x"7FFF";
		wait for 10 ns;
		
		-- TEST 2, given MSB of 0
		I_SE_DATA <= x"8000";
		wait for 10 ns;
		
		I_SE_DATA <= x"0000";
		wait for 10 ns;
		
		I_SE_DATA <= x"FFFF";

      

      wait;
   end process;

END;


LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY MUX_5_testbench IS
END MUX_5_testbench;
 
ARCHITECTURE behavior OF MUX_5_testbench IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT MUX_5
    PORT(
         I_MUX_EN : IN  std_logic;
         I_MUX_SEL : IN  std_logic;
         I_MUX_DATA_1 : IN  std_logic_vector(4 downto 0);
         I_MUX_DATA_2 : IN  std_logic_vector(4 downto 0);
         O_MUX_DATA : OUT  std_logic_vector(4 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal I_MUX_EN : std_logic := '0';
   signal I_MUX_SEL : std_logic := '0';
   signal I_MUX_DATA_1 : std_logic_vector(4 downto 0) := (others => '0');
   signal I_MUX_DATA_2 : std_logic_vector(4 downto 0) := (others => '0');

 	--Outputs
   signal O_MUX_DATA : std_logic_vector(4 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 

 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: MUX_5 PORT MAP (
          I_MUX_EN => I_MUX_EN,
          I_MUX_SEL => I_MUX_SEL,
          I_MUX_DATA_1 => I_MUX_DATA_1,
          I_MUX_DATA_2 => I_MUX_DATA_2,
          O_MUX_DATA => O_MUX_DATA
        );



   -- Stimulus process
   stim_proc: process
   begin		
		wait for 10 ns;
		
		I_MUX_EN <= '1';
		
		I_MUX_DATA_1 <= "00000";
		I_MUX_DATA_2 <= "11111";
		
		I_MUX_SEL <= '0';
		wait for 10 ns;
		
		I_MUX_SEL <= '1';
		wait for 10 ns;
		
		I_MUX_SEL <= '0';
		wait for 10 ns;
		
		I_MUX_SEL <= '1';


      wait;
   end process;

END;

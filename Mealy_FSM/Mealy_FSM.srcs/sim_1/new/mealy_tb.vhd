library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;


entity mealy_tb is
end mealy_tb;

architecture Behavioral of mealy_tb is
    signal clk_tb : std_logic := '0';
    signal rst_tb : std_logic := '0';
    signal input_tb : std_logic;
begin
    DUT: entity work.mealy
        port map(
                 clk => clk_tb,
                 rst => rst_tb,
                 input => input_tb
                 );
    
    process
    begin
        wait for 2ns;
        rst_tb <= '1';
        wait for 5ns;
        input_tb <= '0';
        rst_tb <= '0';
        clk_tb <= '1';
        wait for 3ns;
        input_tb <= '1';
        clk_tb <= '0';
        wait for 3ns;
        input_tb <= '0';
        clk_tb <= '1';
        wait for 3ns;
        input_tb <= '1';
        wait for 3ns;
        clk_tb <= '0';
        wait;
    end process; 

end Behavioral;

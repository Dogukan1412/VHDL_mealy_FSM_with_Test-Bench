
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

-- test-bench file is in the sim_1/mealy_tb

entity mealy is
  Port ( 
        rst,clk,input : in std_logic;
        output : out std_logic
        );
end mealy;

architecture Behavioral of mealy is
    type state is (s0,s1,s2,s3);
    signal pr_state, nx_state : state;
begin

    -----lower section of FSM-----
    process(rst,clk)
        begin
            if(rst = '1') then
                pr_state <= s0;
            elsif(clk'event and clk = '1') then
                pr_state <= nx_state;
            end if;
    end process;
    
    -----upper section of FSM-----
    process(input,pr_state)
        begin
            case pr_state is
                when s0 =>
                    if(input = '0') then
                        nx_state <= s1;
                        output <= '0';
                    else
                        nx_state <= s2;
                        output <= '1';
                    end if;
                when s1 =>
                    if(input = '0') then
                        nx_state <= s3;
                        output <= '0';
                    else
                        nx_state <= s1;
                        output <= '0';
                    end if;
                when s2 =>
                    if(input = '0') then
                        nx_state <= s2;
                        output <= '1';
                    else
                        nx_state <= s3;
                        output <= '0';
                    end if;
                when s3 =>
                       if(input = '0') then
                         nx_state <= s3;
                         output <= '1';
                       else
                         nx_state <= s0;
                         output <= '1';
                       end if;
            end case;  
    end process;
    

end Behavioral;

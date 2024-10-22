----------------
--Jakub Zaroda--
----------------

library work;
library ieee;
use ieee.std_logic_1164.all;
use std.env.stop;

entity tb_aes_control is
end entity;

architecture tb of tb_aes_control is
    constant inClkp : time  := 10ns;
    signal inClk : std_logic := '0';

    signal in_data_wr : std_logic;
    signal out_important_data_wr : std_logic;

    -- component Coin is port (
    --     inClk           : in std_logic;
    --     inPushButton    : in std_logic;
    --     outLed0         : out std_logic;
    --     outLed1         : out std_logic
    -- );
    -- end component Coin;


begin
    aes_important: entity work.aes_control
    port map(
        in_clk => inClk,
        in_data_wr => in_data_wr,
        out_important_data_wr => out_important_data_wr
    );

    inClk <= not inClk after inClkp/2;

    process is
	variable i : integer := 1;
    begin

        wait for inClkp;
        in_data_wr<='1';
        wait for inClkp;
        in_data_wr<='0';
        wait for inClkp;
        in_data_wr<='0';
        wait for inClkp;
        in_data_wr<='1';
        wait for inClkp;
        --report "inData = " & to_string(to_unsigned(to_integer(unsigned(inData)), 2)) & " outData = " & to_string(to_unsigned(to_integer(unsigned(outData)), 2)) & " outData2 =" & to_string(to_unsigned(to_integer(unsigned(outData2)), 2));
        in_data_wr<='1';
        wait for inClkp;
        in_data_wr<='0';
        wait for inClkp;
        for i in 0 to 14 loop
            wait for inClkp;
        end loop;

        stop;
    end process;

end architecture;
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use std.env.stop;

entity tb_aes_add_round_key is
end tb_aes_add_round_key;

architecture behavior of tb_aes_add_round_key is
    -- Sygnały dla testbench
    signal inData_tb  : std_logic_vector(127 downto 0);
    signal inKey_tb  : std_logic_vector(127 downto 0);
    signal outData_tb : std_logic_vector(127 downto 0);

    -- Component declaration for the unit under test (UUT)
    component aes_add_round_key is
        port (
            in_data  : in  std_logic_vector(127 downto 0);
            in_key  : in  std_logic_vector(127 downto 0);
            out_data : out std_logic_vector(127 downto 0)
        );
    end component;

begin
    -- Instancja UUT
    UUT: aes_add_round_key
        port map (
            in_data  => inData_tb,
            in_key => inKey_tb,
            out_data => outData_tb
        );

    -- Proces odpowiedzialny za generowanie sygnałów wejściowych
    stimulus_proc: process
    begin
        inData_tb <= X"11111111222222223333333344444444"; -- Przykładowe dane wejściowe
        inKey_tb <= X"11111111000000001111111100000000";
        wait for 10 ns;
        wait;

        stop;
    end process;

end behavior;

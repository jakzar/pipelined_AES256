library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use std.env.stop;

entity tb_aes_sub_word_fun is
end tb_aes_sub_word_fun;

architecture behavior of tb_aes_sub_word_fun is
    -- Sygnały dla testbench
    signal inData_tb  : std_logic_vector(31 downto 0);
    signal outData_tb : std_logic_vector(31 downto 0);

    -- Component declaration for the unit under test (UUT)
    component aes_sub_word_fun is
        port (
            inData  : in  std_logic_vector(31 downto 0);
            outData : out std_logic_vector(31 downto 0)
        );
    end component;

begin
    -- Instancja UUT
    UUT: aes_sub_word_fun
        port map (
            inData  => inData_tb,
            outData => outData_tb
        );

    -- Proces odpowiedzialny za generowanie sygnałów wejściowych
    stimulus_proc: process
    begin
        inData_tb <= X"A1B2C3D4"; -- Przykładowe dane wejściowe
        wait for 10 ns;
        -- Dodaj więcej przypadków testowych według potrzeb
        inData_tb <= X"12345678";
        wait for 10 ns;
        inData_tb <= X"9ABCDEF0";
        wait;

        stop;
    end process;

end behavior;

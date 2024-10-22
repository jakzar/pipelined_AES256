library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use std.env.stop;

entity tb_aes_keysch_fun_0 is
end tb_aes_keysch_fun_0;

architecture behavior of tb_aes_keysch_fun_0 is
    -- Sygnały dla testbench
    signal in_data_0  : std_logic_vector(127 downto 0);
    signal in_data_1  : std_logic_vector(127 downto 0);
    signal in_rcon : std_logic_vector(7 downto 0);
    signal out_data : std_logic_vector(127 downto 0);

    -- Component declaration for the unit under test (UUT)
    component aes_keysch_fun_0 is
        port (
            in_data_0  : in  std_logic_vector(127 downto 0);
            in_data_1  : in  std_logic_vector(127 downto 0);
            in_rcon  : in  std_logic_vector(7 downto 0);
            out_data : out std_logic_vector(127 downto 0)
        );
    end component;

begin
    -- Instancja UUT
    UUT: aes_keysch_fun_0
        port map (
            in_data_0  => in_data_0,
            in_data_1  => in_data_1,
            in_rcon => in_rcon,
            out_data => out_data
        );
    
    -- Proces odpowiedzialny za generowanie sygnałów wejściowych
    stimulus_proc: process
    begin
        wait for 10 ns;
        in_data_0  <= X"000102030405060708090a0b0c0d0e0f";
        in_data_1  <= X"101112131415161718191a1b1c1d1e1f";
        in_rcon <= "00000001"; --bity
        wait for 10 ns;
        -- Dodaj więcej przypadków testowych według potrzeb
        stop;
    end process;

end behavior;

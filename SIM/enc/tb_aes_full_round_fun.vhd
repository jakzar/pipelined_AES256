library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use std.env.stop;

entity tb_aes_full_round_fun is
end tb_aes_full_round_fun;

architecture behavior of tb_aes_full_round_fun is
    -- Sygnały dla testbench
    signal in_data  : std_logic_vector(127 downto 0);
    signal in_key : std_logic_vector(127 downto 0);
    signal out_data : std_logic_vector(127 downto 0);

    -- Component declaration for the unit under test (UUT)
    component aes_full_round_fun is
        port (
            in_data  : in  std_logic_vector(127 downto 0);
            in_key  : in  std_logic_vector(127 downto 0);
            out_data : out std_logic_vector(127 downto 0)
        );
    end component;

begin
    -- Instancja UUT
    UUT: aes_full_round_fun
        port map (
            in_data  => in_data,
            in_key => in_key,
            out_data => out_data
        );
    
    -- Proces odpowiedzialny za generowanie sygnałów wejściowych
    stimulus_proc: process
    begin
        in_data  <= X"00112233445566778899aabbccddeeff";
        in_key <= X"000102030405060708090a0b0c0d0e0f";
        wait for 10 ns;
        -- Dodaj więcej przypadków testowych według potrzeb
        stop;
    end process;

end behavior;

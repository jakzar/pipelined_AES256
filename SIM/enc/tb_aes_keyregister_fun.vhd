library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use std.env.stop;

USE work.shift_array_pkg.all;

entity tb_aes_keyregister_fun is
end tb_aes_keyregister_fun;

architecture behavior of tb_aes_keyregister_fun is
    -- Sygnały dla testbench
    constant inClkp : time := 10ns;
    signal in_clk : std_logic := '0';
    signal in_current_key  : std_logic_vector(127 downto 0);
    signal in_previous_key  : std_logic_vector(127 downto 0);
    signal in_data : shift_array;
    signal out_data : shift_array;

    -- Component declaration for the unit under test (UUT)
    component aes_keyregister_fun is
        port (
            in_clk : in std_logic;
            in_current_key  :   in std_logic_vector(127 downto 0);
            in_previous_key  :   in std_logic_vector(127 downto 0);
            in_data  :   in shift_array;
            out_data :   out shift_array
        );
    end component;

begin
    -- Instancja UUT
    in_clk <= not in_clk after inClkp/2;
    UUT: aes_keyregister_fun
        port map (
            in_clk => in_clk,
            in_current_key  => in_current_key,
            in_previous_key  => in_previous_key,
            in_data => in_data,
            out_data => out_data
        );
    
    -- Proces odpowiedzialny za generowanie sygnałów wejściowych
    stimulus_proc: process
    begin
        wait for 10 ns;
        in_current_key  <= X"000102030405060708090a0b0c0d0e0f";
        in_previous_key  <= X"101112131415161718191a1b1c1d1e1f";
        in_data <=out_data;
        --in_rcon <= "00000001"; --bity
        wait for 10 ns;
        in_data <=out_data;
        wait for 10 ns;
        in_data <=out_data;
        wait for 10 ns;
        in_data <=out_data;
        wait for 10 ns;
        in_data <=out_data;
        wait for 10 ns;
        in_data <=out_data;
        wait for 10 ns;
        in_data <=out_data;
        wait for 10 ns;
        in_data <=out_data;
        wait for 10 ns;
        in_data <=out_data;
        wait for 10 ns;
        in_data <=out_data;
        wait for 10 ns;
        in_data <=out_data;
        wait for 10 ns;
        in_data <=out_data;
        wait for 10 ns;
        in_data <=out_data;
        wait for 10 ns;
        in_data <=out_data;
        wait for 10 ns;
        in_data <=out_data;
        wait for 10 ns;
        -- Dodaj więcej przypadków testowych według potrzeb
        stop;
    end process;

end behavior;

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use std.env.stop;

entity tb_aes_last_round_fun is
end tb_aes_last_round_fun;

architecture behavior of tb_aes_last_round_fun is
    -- Sygnały dla testbench
    constant inClkp : time := 10ns;
    signal in_clk : std_logic := '0';
    signal in_data  : std_logic_vector(127 downto 0);
    signal in_key_0 : std_logic_vector(127 downto 0);
    signal in_key_1 : std_logic_vector(127 downto 0);
    signal out_data : std_logic_vector(127 downto 0);

    -- Component declaration for the unit under test (UUT)
    component aes_last_round_fun is
        port (
            in_clk : in std_logic;
            in_data  : in  std_logic_vector(127 downto 0);
            in_key_0  : in  std_logic_vector(127 downto 0);
            in_key_1  : in  std_logic_vector(127 downto 0);
            out_data : out std_logic_vector(127 downto 0)
        );
    end component;

begin
    -- Instancja UUT
    in_clk <= not in_clk after inClkp/2;
    UUT: aes_last_round_fun
        port map (
            in_clk => in_clk,
            in_data  => in_data,
            in_key_0 => in_key_0,
            in_key_1 => in_key_1,
            out_data => out_data
        );
    
    -- Proces odpowiedzialny za generowanie sygnałów wejściowych
    stimulus_proc: process
    begin
        in_data  <= X"2c21a820306f154ab712c75eee0da04f";
        in_key_0 <= X"4e5a6699a9f24fe07e572baacdf8cdea";
        in_key_1 <= X"24fc79ccbf0979e9371ac23c6d68de36";
        wait for 10 ns;
        -- Dodaj więcej przypadków testowych według potrzeb
        stop;
    end process;

end behavior;

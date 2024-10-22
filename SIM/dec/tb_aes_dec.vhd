----------------
--Jakub Zaroda--
----------------

----------------
-- Test Bench --
----------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use std.env.stop;

entity tb_aes_dec is
end tb_aes_dec;

architecture behavior of tb_aes_dec is
    constant inClkp : time := 10ns;
    signal in_clk : std_logic := '0';
    signal in_data_data  : std_logic_vector(127 downto 0);
    signal in_key_data : std_logic_vector(255 downto 0);
    signal out_data : std_logic_vector(127 downto 0);
    signal in_data_wr : std_logic := '0';

    component aes_dec is
        port (
            in_clk : in std_logic;
            in_key_data  : in  std_logic_vector(255 downto 0);
            in_data_wr      :   in std_logic;
            in_data_data  : in  std_logic_vector(127 downto 0);
            out_data : out std_logic_vector(127 downto 0)
        );
    end component;

begin
    in_clk <= not in_clk after inClkp/2;
    UUT: aes_dec
        port map (
            in_clk => in_clk,
            in_key_data => in_key_data,
            in_data_wr => in_data_wr,
            in_data_data  => in_data_data,
            out_data => out_data
        );
    
    stimulus_proc: process
    begin
        wait for 10 ns;
        in_data_wr<='1';
        in_data_data  <= X"8ea2b7ca516745bfeafc49904b496089";
        in_key_data  <= X"24fc79ccbf0979e9371ac23c6d68de364e5a6699a9f24fe07e572baacdf8cdea";
        wait for 10 ns;
        in_data_wr<='0';
        
        wait for 10 ns;
        wait for 10 ns;
        wait for 10 ns;
        wait for 10 ns;
        wait for 10 ns;
        wait for 10 ns;
        wait for 10 ns;
        wait for 10 ns;
        wait for 10 ns;
        wait for 10 ns;
        wait for 10 ns;
        wait for 10 ns;
        wait for 10 ns;
        wait for 10 ns;
        wait for 10 ns;
        wait for 10 ns;
        wait for 10 ns;
        wait for 10 ns;
        wait for 10 ns;
        wait for 10 ns;
        wait for 10 ns;
        wait for 10 ns;
        wait for 10 ns;
        wait for 10 ns;
       


        stop;
    end process;

end behavior;

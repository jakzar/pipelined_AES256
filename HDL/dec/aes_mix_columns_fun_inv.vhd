----------------
--Jakub Zaroda--
----------------
--modul realizujacy operacje MixColumns()

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity aes_mix_columns_fun_inv is port(
    in_data  :   in std_logic_vector (127 downto 0);
    out_data :   out std_logic_vector (127 downto 0)
);
end entity aes_mix_columns_fun_inv;

architecture behaviour of aes_mix_columns_fun_inv is

begin
    col0: entity work.aes_mult_ca_fun_inv port map(in_data(127 downto 96), out_data(127 downto 96));
    col1: entity work.aes_mult_ca_fun_inv port map(in_data(95 downto 64), out_data(95 downto 64));
    col2: entity work.aes_mult_ca_fun_inv port map(in_data(63 downto 32), out_data(63 downto 32));
    col3: entity work.aes_mult_ca_fun_inv port map(in_data(31 downto 0), out_data(31 downto 0));
end behaviour;
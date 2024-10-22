----------------
--Jakub Zaroda--
----------------

--modul realizujacy operacje SubWord()

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity aes_sub_word_fun is port(
    in_data      : in std_logic_vector (31 downto 0);
    out_data     : out std_logic_vector (31 downto 0)
);
end aes_sub_word_fun;

architecture behaviour of aes_sub_word_fun is
begin
    s0: entity work.aes_sbox_fun port map(in_data(31 downto 24), out_data(31 downto 24));
    s1: entity work.aes_sbox_fun port map(in_data(23 downto 16), out_data(23 downto 16));
    s2: entity work.aes_sbox_fun port map(in_data(15 downto 8), out_data(15 downto 8));
    s3: entity work.aes_sbox_fun port map(in_data(7 downto 0), out_data(7 downto 0));
end behaviour;
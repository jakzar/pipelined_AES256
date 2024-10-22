----------------
--Jakub Zaroda--
----------------

--modul realizujacy operacje SubBytes()

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity aes_sub_bytes_fun is port(
    in_data      : in std_logic_vector (127 downto 0);
    out_data     : out std_logic_vector (127 downto 0)
);
end aes_sub_bytes_fun;

architecture behaviour of aes_sub_bytes_fun is
begin
    s0: entity work.aes_sbox_fun port map(in_data(127 downto 120), out_data(127 downto 120));
    s1: entity work.aes_sbox_fun port map(in_data(119 downto 112), out_data(119 downto 112));
    s2: entity work.aes_sbox_fun port map(in_data(111 downto 104), out_data(111 downto 104));
    s3: entity work.aes_sbox_fun port map(in_data(103 downto 96), out_data(103 downto 96));
    s4: entity work.aes_sbox_fun port map(in_data(95 downto 88), out_data(95 downto 88));
    s5: entity work.aes_sbox_fun port map(in_data(87 downto 80), out_data(87 downto 80));
    s6: entity work.aes_sbox_fun port map(in_data(79 downto 72), out_data(79 downto 72));
    s7: entity work.aes_sbox_fun port map(in_data(71 downto 64), out_data(71 downto 64));
    s8: entity work.aes_sbox_fun port map(in_data(63 downto 56), out_data(63 downto 56));
    s9: entity work.aes_sbox_fun port map(in_data(55 downto 48), out_data(55 downto 48));
    s10: entity work.aes_sbox_fun port map(in_data(47 downto 40), out_data(47 downto 40));
    s11: entity work.aes_sbox_fun port map(in_data(39 downto 32), out_data(39 downto 32));
    s12: entity work.aes_sbox_fun port map(in_data(31 downto 24), out_data(31 downto 24));
    s13: entity work.aes_sbox_fun port map(in_data(23 downto 16), out_data(23 downto 16));
    s14: entity work.aes_sbox_fun port map(in_data(15 downto 8), out_data(15 downto 8));
    s15: entity work.aes_sbox_fun port map(in_data(7 downto 0), out_data(7 downto 0));
end behaviour;
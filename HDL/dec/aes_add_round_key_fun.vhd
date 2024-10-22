----------------
--Jakub Zaroda--
----------------

--modul realizujacy operacje addRoundKey()

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity aes_add_round_key_fun is port(
    in_data      : in std_logic_vector (127 downto 0);
    in_key      : in std_logic_vector (127 downto 0);
    out_data     : out std_logic_vector (127 downto 0)
);
end aes_add_round_key_fun;

architecture behaviour of aes_add_round_key_fun is
begin
    out_data <= in_key xor in_data;
end behaviour;
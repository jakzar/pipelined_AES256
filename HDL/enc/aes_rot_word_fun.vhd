----------------
--Jakub Zaroda--
----------------

--modul realizujacy operacje RotWord()

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity aes_rot_word_fun is port(
    in_data  :   in std_logic_vector (31 downto 0);
    out_data :   out std_logic_vector (31 downto 0)
);
end entity aes_rot_word_fun;

architecture behaviour of aes_rot_word_fun is
begin
    out_data <= in_data(23 downto 0) & in_data(31 downto 24);
end behaviour;
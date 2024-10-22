----------------
--Jakub Zaroda--
----------------

--modul wyznaczajacy kolejny klucz w rundzie nieparzystej 

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity aes_keysch_fun_1 is port(
    in_data_0  :   in std_logic_vector (127 downto 0);
    in_data_1   :   in std_logic_vector (127 downto 0);
    out_data :   out std_logic_vector (255 downto 0)
);
end entity aes_keysch_fun_1;

architecture behaviour of aes_keysch_fun_1 is
    signal sub_word_out  : std_logic_vector(31 downto 0);
begin
    inst_aes_sub_word_fun: entity work.aes_sub_word_fun port map(in_data_1(31 downto 0), sub_word_out);

    out_data (255 downto 128) <= in_data_1;
    out_data (127 downto 96) <= sub_word_out xor in_data_0(127 downto 96);
    out_data (95 downto 64) <= sub_word_out xor in_data_0(127 downto 96) xor in_data_0(95 downto 64);
    out_data (63 downto 32) <= sub_word_out xor in_data_0(127 downto 96) xor in_data_0(95 downto 64) xor in_data_0(63 downto 32);
    out_data (31 downto 0) <= sub_word_out xor in_data_0(127 downto 96) xor in_data_0(95 downto 64) xor in_data_0(63 downto 32) xor in_data_0(31 downto 0);
end behaviour;
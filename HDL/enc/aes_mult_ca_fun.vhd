----------------
--Jakub Zaroda--
----------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity aes_mult_ca_fun is port(
    in_data  :   in std_logic_vector (31 downto 0);
    out_data :   out std_logic_vector (31 downto 0)
);
end entity aes_mult_ca_fun;

architecture behaviour of aes_mult_ca_fun is
    signal wireMN00  : std_logic_vector(7 downto 0);
    signal wireMN01  : std_logic_vector(7 downto 0);
    signal wireMN02  : std_logic_vector(7 downto 0);
    signal wireMN03  : std_logic_vector(7 downto 0);

    signal wireMN10  : std_logic_vector(7 downto 0);
    signal wireMN11  : std_logic_vector(7 downto 0);
    signal wireMN12  : std_logic_vector(7 downto 0);
    signal wireMN13  : std_logic_vector(7 downto 0);

    signal wireMN20  : std_logic_vector(7 downto 0);
    signal wireMN21  : std_logic_vector(7 downto 0);
    signal wireMN22  : std_logic_vector(7 downto 0);
    signal wireMN23  : std_logic_vector(7 downto 0);

    signal wireMN30  : std_logic_vector(7 downto 0);
    signal wireMN31  : std_logic_vector(7 downto 0);
    signal wireMN32  : std_logic_vector(7 downto 0);
    signal wireMN33  : std_logic_vector(7 downto 0);
begin
    mn00: entity work.aes_mult_02_fun port map(in_data(31 downto 24), wireMN00);
    mn01: entity work.aes_mult_03_fun port map(in_data(23 downto 16), wireMN01);
    mn02: entity work.aes_mult_01_fun port map(in_data(15 downto 8), wireMN02);
    mn03: entity work.aes_mult_01_fun port map(in_data(7 downto 0), wireMN03);

    mn10: entity work.aes_mult_01_fun port map(in_data(31 downto 24), wireMN10);
    mn11: entity work.aes_mult_02_fun port map(in_data(23 downto 16), wireMN11);
    mn12: entity work.aes_mult_03_fun port map(in_data(15 downto 8), wireMN12);
    mn13: entity work.aes_mult_01_fun port map(in_data(7 downto 0), wireMN13);

    mn20: entity work.aes_mult_01_fun port map(in_data(31 downto 24), wireMN20);
    mn21: entity work.aes_mult_01_fun port map(in_data(23 downto 16), wireMN21);
    mn22: entity work.aes_mult_02_fun port map(in_data(15 downto 8), wireMN22);
    mn23: entity work.aes_mult_03_fun port map(in_data(7 downto 0), wireMN23);

    mn30: entity work.aes_mult_03_fun port map(in_data(31 downto 24), wireMN30);
    mn31: entity work.aes_mult_01_fun port map(in_data(23 downto 16), wireMN31);
    mn32: entity work.aes_mult_01_fun port map(in_data(15 downto 8), wireMN32);
    mn33: entity work.aes_mult_02_fun port map(in_data(7 downto 0), wireMN33);

    out_data(31 downto 24) <= wireMN00 xor wireMN01 xor wireMN02 xor wireMN03;
    out_data(23 downto 16) <= wireMN10 xor wireMN11 xor wireMN12 xor wireMN13;
    out_data(15 downto 8) <= wireMN20 xor wireMN21 xor wireMN22 xor wireMN23;
    out_data(7 downto 0) <= wireMN30 xor wireMN31 xor wireMN32 xor wireMN33;
end behaviour;
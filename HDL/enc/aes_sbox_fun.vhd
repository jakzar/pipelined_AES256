----------------
--Jakub Zaroda--
----------------

--modul realizujacy skrzynke podstawieniowa

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity aes_sbox_fun is port(
    in_data      : in std_logic_vector (7 downto 0);
    out_data     : out std_logic_vector (7 downto 0)
);
end aes_sbox_fun;

architecture behaviour of aes_sbox_fun is
begin
	p_sbox : process (in_data)
	begin
    case (in_data) is
        when x"00" => out_data <= x"63";
        when x"01" => out_data <= x"7c";
        when x"02" => out_data <= x"77";
        when x"03" => out_data <= x"7b";
        when x"04" => out_data <= x"f2";
        when x"05" => out_data <= x"6b";
        when x"06" => out_data <= x"6f";
        when x"07" => out_data <= x"c5";
        when x"08" => out_data <= x"30";
        when x"09" => out_data <= x"01";
        when x"0a" => out_data <= x"67";
        when x"0b" => out_data <= x"2b";
        when x"0c" => out_data <= x"fe";
        when x"0d" => out_data <= x"d7";
        when x"0e" => out_data <= x"ab";
        when x"0f" => out_data <= x"76";

        when x"10" => out_data <= x"ca";
        when x"11" => out_data <= x"82";
        when x"12" => out_data <= x"c9";
        when x"13" => out_data <= x"7d";
        when x"14" => out_data <= x"fa";
        when x"15" => out_data <= x"59";
        when x"16" => out_data <= x"47";
        when x"17" => out_data <= x"f0";
        when x"18" => out_data <= x"ad";
        when x"19" => out_data <= x"d4";
        when x"1a" => out_data <= x"a2";
        when x"1b" => out_data <= x"af";
        when x"1c" => out_data <= x"9c";
        when x"1d" => out_data <= x"a4";
        when x"1e" => out_data <= x"72";
        when x"1f" => out_data <= x"c0";

        when x"20" => out_data <= x"b7";
        when x"21" => out_data <= x"fd";
        when x"22" => out_data <= x"93";
        when x"23" => out_data <= x"26";
        when x"24" => out_data <= x"36";
        when x"25" => out_data <= x"3f";
        when x"26" => out_data <= x"f7";
        when x"27" => out_data <= x"cc";
        when x"28" => out_data <= x"34";
        when x"29" => out_data <= x"a5";
        when x"2a" => out_data <= x"e5";
        when x"2b" => out_data <= x"f1";
        when x"2c" => out_data <= x"71";
        when x"2d" => out_data <= x"d8";
        when x"2e" => out_data <= x"31";
        when x"2f" => out_data <= x"15";

        when x"30" => out_data <= x"04";
        when x"31" => out_data <= x"c7";
        when x"32" => out_data <= x"23";
        when x"33" => out_data <= x"c3";
        when x"34" => out_data <= x"18";
        when x"35" => out_data <= x"96";
        when x"36" => out_data <= x"05";
        when x"37" => out_data <= x"9a";
        when x"38" => out_data <= x"07";
        when x"39" => out_data <= x"12";
        when x"3a" => out_data <= x"80";
        when x"3b" => out_data <= x"e2";
        when x"3c" => out_data <= x"eb";
        when x"3d" => out_data <= x"27";
        when x"3e" => out_data <= x"b2";
        when x"3f" => out_data <= x"75";

        when x"40" => out_data <= x"09";
        when x"41" => out_data <= x"83";
        when x"42" => out_data <= x"2c";
        when x"43" => out_data <= x"1a";
        when x"44" => out_data <= x"1b";
        when x"45" => out_data <= x"6e";
        when x"46" => out_data <= x"5a";
        when x"47" => out_data <= x"a0";
        when x"48" => out_data <= x"52";
        when x"49" => out_data <= x"3b";
        when x"4a" => out_data <= x"d6";
        when x"4b" => out_data <= x"b3";
        when x"4c" => out_data <= x"29";
        when x"4d" => out_data <= x"e3";
        when x"4e" => out_data <= x"2f";
        when x"4f" => out_data <= x"84";

        when x"50" => out_data <= x"53";
        when x"51" => out_data <= x"d1";
        when x"52" => out_data <= x"00";
        when x"53" => out_data <= x"ed";
        when x"54" => out_data <= x"20";
        when x"55" => out_data <= x"fc";
        when x"56" => out_data <= x"b1";
        when x"57" => out_data <= x"5b";
        when x"58" => out_data <= x"6a";
        when x"59" => out_data <= x"cb";
        when x"5a" => out_data <= x"be";
        when x"5b" => out_data <= x"39";
        when x"5c" => out_data <= x"4a";
        when x"5d" => out_data <= x"4c";
        when x"5e" => out_data <= x"58";
        when x"5f" => out_data <= x"cf";

        when x"60" => out_data <= x"d0";
        when x"61" => out_data <= x"ef";
        when x"62" => out_data <= x"aa";
        when x"63" => out_data <= x"fb";
        when x"64" => out_data <= x"43";
        when x"65" => out_data <= x"4d";
        when x"66" => out_data <= x"33";
        when x"67" => out_data <= x"85";
        when x"68" => out_data <= x"45";
        when x"69" => out_data <= x"f9";
        when x"6a" => out_data <= x"02";
        when x"6b" => out_data <= x"7f";
        when x"6c" => out_data <= x"50";
        when x"6d" => out_data <= x"3c";
        when x"6e" => out_data <= x"9f";
        when x"6f" => out_data <= x"a8";

        when x"70" => out_data <= x"51";
        when x"71" => out_data <= x"a3";
        when x"72" => out_data <= x"40";
        when x"73" => out_data <= x"8f";
        when x"74" => out_data <= x"92";
        when x"75" => out_data <= x"9d";
        when x"76" => out_data <= x"38";
        when x"77" => out_data <= x"f5";
        when x"78" => out_data <= x"bc";
        when x"79" => out_data <= x"b6";
        when x"7a" => out_data <= x"da";
        when x"7b" => out_data <= x"21";
        when x"7c" => out_data <= x"10";
        when x"7d" => out_data <= x"ff";
        when x"7e" => out_data <= x"f3";
        when x"7f" => out_data <= x"d2";

        when x"80" => out_data <= x"cd";
        when x"81" => out_data <= x"0c";
        when x"82" => out_data <= x"13";
        when x"83" => out_data <= x"ec";
        when x"84" => out_data <= x"5f";
        when x"85" => out_data <= x"97";
        when x"86" => out_data <= x"44";
        when x"87" => out_data <= x"17";
        when x"88" => out_data <= x"c4";
        when x"89" => out_data <= x"a7";
        when x"8a" => out_data <= x"7e";
        when x"8b" => out_data <= x"3d";
        when x"8c" => out_data <= x"64";
        when x"8d" => out_data <= x"5d";
        when x"8e" => out_data <= x"19";
        when x"8f" => out_data <= x"73";

        when x"90" => out_data <= x"60";
        when x"91" => out_data <= x"81";
        when x"92" => out_data <= x"4f";
        when x"93" => out_data <= x"dc";
        when x"94" => out_data <= x"22";
        when x"95" => out_data <= x"2a";
        when x"96" => out_data <= x"90";
        when x"97" => out_data <= x"88";
        when x"98" => out_data <= x"46";
        when x"99" => out_data <= x"ee";
        when x"9a" => out_data <= x"b8";
        when x"9b" => out_data <= x"14";
        when x"9c" => out_data <= x"de";
        when x"9d" => out_data <= x"5e";
        when x"9e" => out_data <= x"0b";
        when x"9f" => out_data <= x"db";

        when x"a0" => out_data <= x"e0";
        when x"a1" => out_data <= x"32";
        when x"a2" => out_data <= x"3a";
        when x"a3" => out_data <= x"0a";
        when x"a4" => out_data <= x"49";
        when x"a5" => out_data <= x"06";
        when x"a6" => out_data <= x"24";
        when x"a7" => out_data <= x"5c";
        when x"a8" => out_data <= x"c2";
        when x"a9" => out_data <= x"d3";
        when x"aa" => out_data <= x"ac";
        when x"ab" => out_data <= x"62";
        when x"ac" => out_data <= x"91";
        when x"ad" => out_data <= x"95";
        when x"ae" => out_data <= x"e4";
        when x"af" => out_data <= x"79";

        when x"b0" => out_data <= x"e7";
        when x"b1" => out_data <= x"c8";
        when x"b2" => out_data <= x"37";
        when x"b3" => out_data <= x"6d";
        when x"b4" => out_data <= x"8d";
        when x"b5" => out_data <= x"d5";
        when x"b6" => out_data <= x"4e";
        when x"b7" => out_data <= x"a9";
        when x"b8" => out_data <= x"6c";
        when x"b9" => out_data <= x"56";
        when x"ba" => out_data <= x"f4";
        when x"bb" => out_data <= x"ea";
        when x"bc" => out_data <= x"65";
        when x"bd" => out_data <= x"7a";
        when x"be" => out_data <= x"ae";
        when x"bf" => out_data <= x"08";

        when x"c0" => out_data <= x"ba";
        when x"c1" => out_data <= x"78";
        when x"c2" => out_data <= x"25";
        when x"c3" => out_data <= x"2e";
        when x"c4" => out_data <= x"1c";
        when x"c5" => out_data <= x"a6";
        when x"c6" => out_data <= x"b4";
        when x"c7" => out_data <= x"c6";
        when x"c8" => out_data <= x"e8";
        when x"c9" => out_data <= x"dd";
        when x"ca" => out_data <= x"74";
        when x"cb" => out_data <= x"1f";
        when x"cc" => out_data <= x"4b";
        when x"cd" => out_data <= x"bd";
        when x"ce" => out_data <= x"8b";
        when x"cf" => out_data <= x"8a";

        when x"d0" => out_data <= x"70";
        when x"d1" => out_data <= x"3e";
        when x"d2" => out_data <= x"b5";
        when x"d3" => out_data <= x"66";
        when x"d4" => out_data <= x"48";
        when x"d5" => out_data <= x"03";
        when x"d6" => out_data <= x"f6";
        when x"d7" => out_data <= x"0e";
        when x"d8" => out_data <= x"61";
        when x"d9" => out_data <= x"35";
        when x"da" => out_data <= x"57";
        when x"db" => out_data <= x"b9";
        when x"dc" => out_data <= x"86";
        when x"dd" => out_data <= x"c1";
        when x"de" => out_data <= x"1d";
        when x"df" => out_data <= x"9e";

        when x"e0" => out_data <= x"e1";
        when x"e1" => out_data <= x"f8";
        when x"e2" => out_data <= x"98";
        when x"e3" => out_data <= x"11";
        when x"e4" => out_data <= x"69";
        when x"e5" => out_data <= x"d9";
        when x"e6" => out_data <= x"8e";
        when x"e7" => out_data <= x"94";
        when x"e8" => out_data <= x"9b";
        when x"e9" => out_data <= x"1e";
        when x"ea" => out_data <= x"87";
        when x"eb" => out_data <= x"e9";
        when x"ec" => out_data <= x"ce";
        when x"ed" => out_data <= x"55";
        when x"ee" => out_data <= x"28";
        when x"ef" => out_data <= x"df";

        when x"f0" => out_data <= x"8c";
        when x"f1" => out_data <= x"a1";
        when x"f2" => out_data <= x"89";
        when x"f3" => out_data <= x"0d";
        when x"f4" => out_data <= x"bf";
        when x"f5" => out_data <= x"e6";
        when x"f6" => out_data <= x"42";
        when x"f7" => out_data <= x"68";
        when x"f8" => out_data <= x"41";
        when x"f9" => out_data <= x"99";
        when x"fa" => out_data <= x"2d";
        when x"fb" => out_data <= x"0f";
        when x"fc" => out_data <= x"b0";
        when x"fd" => out_data <= x"54";
        when x"fe" => out_data <= x"bb";
        when x"ff" => out_data <= x"16";

        when others => null;
    end case;
	 end process p_sbox;
end behaviour;
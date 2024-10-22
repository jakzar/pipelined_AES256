----------------
--Jakub Zaroda--
----------------
--modul wyznaczajacy poszczegolne klucze rundowe dla danej rundy
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

USE work.shift_array_pkg.all;

entity aes_keyregister_fun is port(
    in_clk   :   in std_logic;
    in_current_key  :   in std_logic_vector(255 downto 0);
    in_data  :   in shift_array;
    out_data :   out shift_array
);
end entity aes_keyregister_fun;

architecture behaviour of aes_keyregister_fun is
    signal temp_reg : shift_array;
begin
    --wpisanie do rejestru pomocniczego odpowiednich danych danych 
    temp_reg(0)<=in_current_key;
    temp_reg(1)<=in_data(0);
    inst_aes_keysch_fun_2: entity work.aes_keysch_fun_0 port map(in_data(0)(255 downto 128), in_data(0)(127 downto 0), "00000001",temp_reg(2));
    inst_aes_keysch_fun_3: entity work.aes_keysch_fun_1 port map(in_data(2)(255 downto 128), in_data(2)(127 downto 0),temp_reg(3));
    inst_aes_keysch_fun_4: entity work.aes_keysch_fun_0 port map(in_data(3)(255 downto 128), in_data(3)(127 downto 0), "00000010",temp_reg(4));
    inst_aes_keysch_fun_5: entity work.aes_keysch_fun_1 port map(in_data(4)(255 downto 128), in_data(4)(127 downto 0),temp_reg(5));
    inst_aes_keysch_fun_6: entity work.aes_keysch_fun_0 port map(in_data(5)(255 downto 128), in_data(5)(127 downto 0), "00000100",temp_reg(6));
    inst_aes_keysch_fun_7: entity work.aes_keysch_fun_1 port map(in_data(6)(255 downto 128), in_data(6)(127 downto 0),temp_reg(7));
    inst_aes_keysch_fun_8: entity work.aes_keysch_fun_0 port map(in_data(7)(255 downto 128), in_data(7)(127 downto 0), "00001000",temp_reg(8));
    inst_aes_keysch_fun_9: entity work.aes_keysch_fun_1 port map(in_data(8)(255 downto 128), in_data(8)(127 downto 0),temp_reg(9));
    inst_aes_keysch_fun_10: entity work.aes_keysch_fun_0 port map(in_data(9)(255 downto 128), in_data(9)(127 downto 0), "00010000",temp_reg(10));
    inst_aes_keysch_fun_11: entity work.aes_keysch_fun_1 port map(in_data(10)(255 downto 128), in_data(10)(127 downto 0),temp_reg(11));
    inst_aes_keysch_fun_12: entity work.aes_keysch_fun_0 port map(in_data(11)(255 downto 128), in_data(11)(127 downto 0), "00100000",temp_reg(12));
    inst_aes_keysch_fun_13: entity work.aes_keysch_fun_1 port map(in_data(12)(255 downto 128), in_data(12)(127 downto 0),temp_reg(13));
    inst_aes_keysch_fun_14: entity work.aes_keysch_fun_0 port map(in_data(13)(255 downto 128), in_data(13)(127 downto 0), "01000000",temp_reg(14));
    
    --przepisanie na magistrale wyjsciowa danych z rejestru pomocniczego
    process(in_clk)
    begin
        if(rising_edge(in_clk)) then
            out_data <= temp_reg;
        end if;
    end process;
end behaviour;
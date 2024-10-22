LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;

PACKAGE shift_array_pkg IS
    type shift_array is array (0 to 14) of std_logic_vector (255 downto 0);
END; 


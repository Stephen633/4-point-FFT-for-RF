----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 2024/02/26 17:59:32
-- Design Name: 
-- Module Name: FFT - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
--the math_real library only for simulation, it needs to use the floating point library when synthesis and implementation
use ieee.math_real.all;
use IEEE.math_complex.all;
--using numeric_std.all and math_real to conver vector to real
use IEEE.numeric_std.all;

entity FFT is
    Port ( 
            x0: in std_logic_vector (7 downto 0);
            x1: in std_logic_vector (7 downto 0);
            x2: in std_logic_vector (7 downto 0);
            x3: in std_logic_vector (7 downto 0);
            X0_REAL: out std_logic_vector (7 downto 0);
            X1_REAL: out std_logic_vector (7 downto 0);
            X2_REAL: out std_logic_vector (7 downto 0);
            X3_REAL: out std_logic_vector (7 downto 0);
            X0_IMG: out std_logic_vector (7 downto 0);
            X1_IMG: out std_logic_vector (7 downto 0);
            X2_IMG: out std_logic_vector (7 downto 0);
            X3_IMG: out std_logic_vector (7 downto 0)
          );
end FFT;

architecture Behavioral of FFT is

constant pi: real := 3.14159265359;
constant e: real :=2.71828182846;
signal temp0: real;
signal temp1: real;
signal temp2: real;
signal temp3: real;
signal tempr0: real;
signal tempr1: real;
signal tempr2: real;
signal tempr3: real;
signal tempi0: real;
signal tempi1: real;
signal tempi2: real;
signal tempi3: real;

signal middA: real;
signal middB: real;
signal middC: real;
signal middD: real;

signal eExp0: real;
signal eExp1: real;

begin
--convert the input to real and tempe number

temp0 <= real(to_integer(unsigned(x0)));
temp1 <= real(to_integer(unsigned(x1)));
temp2 <= real(to_integer(unsigned(x2)));
temp3 <= real(to_integer(unsigned(x3)));

--butterfly computer part A
middA <= temp0 + temp2;
middB <= temp0 - temp2;

middC <= temp1 + temp3;
middD <= temp1 - temp3;

-- e**(2*pi*0/4) = 1
eExp0 <= 1.0;
-- e**(2*pi*1/4) = 4.81047738097
eExp1 <= 4.81047738097;

--butterfly computing part B
tempr0 <= middA;
tempi0 <= eExp0 * middC;

tempr1 <= middB;
tempi1 <= eExp1 * middD;

tempr2 <= middA;
tempi2 <= 0.0 - eExp0 * middC;

tempr3 <= middB;
tempi3 <= 0.0 - eExp1 * middD;

--convert back to output
X0_REAL <= STD_LOGIC_VECTOR(to_SIGNED(INTEGER(tempr0),8));
X1_REAL <= STD_LOGIC_VECTOR(to_SIGNED(INTEGER(tempr1),8));
X2_REAL <= STD_LOGIC_VECTOR(to_SIGNED(INTEGER(tempr2),8));
X3_REAL <= STD_LOGIC_VECTOR(to_SIGNED(INTEGER(tempr3),8));

X0_IMG <= STD_LOGIC_VECTOR(to_SIGNED(INTEGER(tempi0),8));
X1_IMG <= STD_LOGIC_VECTOR(to_SIGNED(INTEGER(tempi1),8));
X2_IMG <= STD_LOGIC_VECTOR(to_SIGNED(INTEGER(tempi2),8));
X3_IMG <= STD_LOGIC_VECTOR(to_SIGNED(INTEGER(tempi3),8));

end Behavioral;

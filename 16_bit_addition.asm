
;<16_Bit_Addition>

jmp start

;data

;code
start: nop

MVI B, 0aFDh; Initialisiere Wert für Register B (8 MSB der 1. Zahl)
MVI C, 0aFFh; Initialisiere Wert für Register C (8 LSB der 1. Zahl)
MVI D, 0aAFh; Initialisiere Wert für Register D (8 MSB der 2. Zahl)
MVI E, 0aFEh; Initialisiere Wert für Register E (8 LSB der 2. Zahl)

MOV A, C; Kopiere den Wert des C (LSB der 1. Zahl) Registers in den Akkumulator.
ADD E;    Addiere den Wert aus E (LSB der 2. Zahl) und dem Akkumulator und lege das Ergebnis im Akkumulator ab. 
OUT 02;
MOV A, B; Kopiere den Wert aus dem B (MSB der 1. Zahl) Register in den Akkumulator. 
ADC D;    Addiere den Wert aus D (MSB der 2. Zahl) und dem Akkumulator und lege das Ergebnis im Akkumulator ab.
OUT 01; Gebe den momentanten Wert im Akkumulator in der Speicheradresse 00 aus.

MVI A, 0
JNC jump
MVI A, 1
jump: OUT 00

end: hlt

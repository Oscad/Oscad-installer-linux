EESchema Schematic File Version 2  date Friday 10 January 2014 03:37:19 PM IST
LIBS:power
LIBS:device
LIBS:transistors
LIBS:conn
LIBS:linear
LIBS:regul
LIBS:74xx
LIBS:cmos4000
LIBS:adc-dac
LIBS:memory
LIBS:xilinx
LIBS:special
LIBS:microcontrollers
LIBS:dsp
LIBS:microchip
LIBS:analog_switches
LIBS:motorola
LIBS:texas
LIBS:intel
LIBS:audio
LIBS:interface
LIBS:digital-audio
LIBS:philips
LIBS:display
LIBS:cypress
LIBS:siliconi
LIBS:opto
LIBS:atmel
LIBS:contrib
LIBS:valves
LIBS:analogSpice
LIBS:analogXSpice
LIBS:convergenceAidSpice
LIBS:converterSpice
LIBS:digitalSpice
LIBS:digitalXSpice
LIBS:linearSpice
LIBS:measurementSpice
LIBS:portSpice
LIBS:sourcesSpice
EELAYER 43  0
EELAYER END
$Descr A4 11700 8267
encoding utf-8
Sheet 1 1
Title ""
Date "10 jan 2014"
Rev ""
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L PORT U1
U 6 1 52CFC5EF
P 5700 3500
F 0 "U1" H 5700 3450 30  0000 C CNN
F 1 "PORT" H 5700 3500 30  0000 C CNN
	6    5700 3500
	-1   0    0    1   
$EndComp
$Comp
L PORT U1
U 4 1 52CFC5CA
P 4850 4150
F 0 "U1" H 4850 4100 30  0000 C CNN
F 1 "PORT" H 4850 4150 30  0000 C CNN
	4    4850 4150
	0    -1   -1   0   
$EndComp
$Comp
L PORT U1
U 7 1 52CFC5A6
P 4850 2850
F 0 "U1" H 4850 2800 30  0000 C CNN
F 1 "PORT" H 4850 2850 30  0000 C CNN
	7    4850 2850
	0    1    1    0   
$EndComp
$Comp
L PORT U1
U 2 1 52CFC58E
P 4200 3600
F 0 "U1" H 4200 3550 30  0000 C CNN
F 1 "PORT" H 4200 3600 30  0000 C CNN
	2    4200 3600
	1    0    0    -1  
$EndComp
$Comp
L PORT U1
U 3 1 52CFC576
P 4200 3400
F 0 "U1" H 4200 3350 30  0000 C CNN
F 1 "PORT" H 4200 3400 30  0000 C CNN
	3    4200 3400
	1    0    0    -1  
$EndComp
Connection ~ 4850 3900
Connection ~ 4450 3600
Connection ~ 4450 3400
Connection ~ 4850 3100
Connection ~ 5450 3500
Text GLabel 5450 3500 1    60   Input ~ 0
out
Text GLabel 4850 3900 0    60   Input ~ 0
VEE
Text GLabel 4850 3100 0    60   Input ~ 0
VCC
Text GLabel 4450 3400 1    60   Input ~ 0
nonin
Text GLabel 4450 3600 3    60   Input ~ 0
inv
$Comp
L TL071 U2
U 1 1 52CFC3DF
P 4950 3500
F 0 "U2" H 5100 3800 70  0000 C CNN
F 1 "opamp1" H 5100 3700 70  0000 C CNN
	1    4950 3500
	1    0    0    -1  
$EndComp
$EndSCHEMATC

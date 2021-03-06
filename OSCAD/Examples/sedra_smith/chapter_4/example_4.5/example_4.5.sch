EESchema Schematic File Version 2  date Thursday 16 May 2013 11:43:16 AM IST
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
LIBS:example_4.5-cache
EELAYER 25  0
EELAYER END
$Descr A4 11700 8267
encoding utf-8
Sheet 1 1
Title ""
Date "16 may 2013"
Rev ""
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
Wire Wire Line
	6600 4300 6600 4700
Wire Wire Line
	6600 3400 6600 3800
Wire Wire Line
	6600 1700 6600 2200
Wire Wire Line
	5000 3750 5000 5500
Connection ~ 5700 5500
Wire Wire Line
	5000 5500 6600 5500
Wire Wire Line
	5700 4700 5700 1700
Connection ~ 6600 5500
Connection ~ 6600 850 
Connection ~ 6600 2850
Connection ~ 5700 3200
Wire Wire Line
	6300 3200 5700 3200
Wire Wire Line
	6600 5500 6600 5200
Wire Wire Line
	6600 1200 6600 850 
Wire Wire Line
	5700 1200 5700 850 
Wire Wire Line
	5700 5500 5700 5200
Connection ~ 5700 3200
Wire Wire Line
	6600 850  5000 850 
Connection ~ 5700 850 
Wire Wire Line
	5000 850  5000 2850
Connection ~ 5800 5500
Wire Wire Line
	6600 2700 6600 3000
Wire Wire Line
	5800 5500 5800 5550
Connection ~ 6600 3650
$Comp
L VPLOT8_1 U4
U 2 1 519477A9
P 6900 3650
F 0 "U4" H 6750 3750 50  0000 C CNN
F 1 "VPLOT8_1" H 7050 3750 50  0000 C CNN
	2    6900 3650
	0    1    1    0   
$EndComp
$Comp
L IPLOT U2
U 1 1 51947793
P 6600 4050
F 0 "U2" H 6450 4150 50  0000 C CNN
F 1 "IPLOT" H 6750 4150 50  0000 C CNN
	1    6600 4050
	0    1    1    0   
$EndComp
$Comp
L IPLOT U1
U 1 1 518B75C0
P 6600 2450
F 0 "U1" H 6450 2550 50  0000 C CNN
F 1 "IPLOT" H 6750 2550 50  0000 C CNN
	1    6600 2450
	0    1    1    0   
$EndComp
$Comp
L VPLOT8_1 U4
U 1 1 518B74B3
P 6000 3200
F 0 "U4" H 5850 3300 50  0000 C CNN
F 1 "VPLOT8_1" H 6150 3300 50  0000 C CNN
	1    6000 3200
	0    1    1    0   
$EndComp
$Comp
L GND #PWR01
U 1 1 517A3B91
P 5800 5550
F 0 "#PWR01" H 5800 5550 30  0001 C CNN
F 1 "GND" H 5800 5480 30  0001 C CNN
	1    5800 5550
	1    0    0    -1  
$EndComp
$Comp
L PWR_FLAG #FLG02
U 1 1 517A3B8C
P 5800 5500
F 0 "#FLG02" H 5800 5770 30  0001 C CNN
F 1 "PWR_FLAG" H 5800 5730 30  0000 C CNN
	1    5800 5500
	1    0    0    -1  
$EndComp
$Comp
L DC v1
U 1 1 517A3ABD
P 5000 3300
F 0 "v1" H 4800 3400 60  0000 C CNN
F 1 "10" H 4800 3250 60  0000 C CNN
F 2 "R1" H 4700 3300 60  0000 C CNN
	1    5000 3300
	1    0    0    -1  
$EndComp
$Comp
L VPLOT8_1 U3
U 1 1 516BA47D
P 6900 2850
F 0 "U3" H 6750 2950 50  0000 C CNN
F 1 "VPLOT8_1" H 7050 2950 50  0000 C CNN
	1    6900 2850
	0    1    1    0   
$EndComp
$Comp
L R R2
U 1 1 5166F1C0
P 5700 4950
F 0 "R2" V 5780 4950 50  0000 C CNN
F 1 "10M" V 5700 4950 50  0000 C CNN
	1    5700 4950
	1    0    0    -1  
$EndComp
$Comp
L R R1
U 1 1 5166F1AE
P 5700 1450
F 0 "R1" V 5780 1450 50  0000 C CNN
F 1 "10M" V 5700 1450 50  0000 C CNN
	1    5700 1450
	1    0    0    -1  
$EndComp
$Comp
L R R4
U 1 1 5166F187
P 6600 4950
F 0 "R4" V 6680 4950 50  0000 C CNN
F 1 "6k" V 6600 4950 50  0000 C CNN
	1    6600 4950
	1    0    0    -1  
$EndComp
$Comp
L R R3
U 1 1 5166F163
P 6600 1450
F 0 "R3" V 6680 1450 50  0000 C CNN
F 1 "6k" V 6600 1450 50  0000 C CNN
	1    6600 1450
	1    0    0    -1  
$EndComp
$Comp
L MOS_N M1
U 1 1 5166F12C
P 6500 3200
F 0 "M1" H 6510 3370 60  0000 R CNN
F 1 "MOS_N" H 6510 3050 60  0000 R CNN
	1    6500 3200
	1    0    0    -1  
$EndComp
$EndSCHEMATC

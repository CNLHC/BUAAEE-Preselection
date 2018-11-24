EESchema Schematic File Version 4
LIBS:8330_EVA-cache
EELAYER 29 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 3 5
Title ""
Date ""
Rev ""
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L 8330_EVA-extra:AD8330 U3
U 1 1 5BF7E7E2
P 6450 3200
F 0 "U3" H 6450 3965 50  0000 C CNN
F 1 "AD8330" H 6450 3874 50  0000 C CNN
F 2 "Package_SO:QSOP-16_3.9x4.9mm_P0.635mm" H 6400 2450 50  0001 C CNN
F 3 "https://www.analog.com/media/en/technical-documentation/data-sheets/AD8330.pdf" H 6450 2350 50  0001 C CNN
	1    6450 3200
	1    0    0    -1  
$EndComp
$Comp
L Device:R R?
U 1 1 5BF9B361
P 1500 1150
F 0 "R?" H 1570 1196 50  0000 L CNN
F 1 "R" H 1570 1105 50  0000 L CNN
F 2 "" V 1430 1150 50  0001 C CNN
F 3 "~" H 1500 1150 50  0001 C CNN
	1    1500 1150
	1    0    0    -1  
$EndComp
$Comp
L Device:C C?
U 1 1 5BF9B6CC
P 2150 1200
F 0 "C?" V 1898 1200 50  0000 C CNN
F 1 "C" V 1989 1200 50  0000 C CNN
F 2 "" H 2188 1050 50  0001 C CNN
F 3 "~" H 2150 1200 50  0001 C CNN
	1    2150 1200
	0    1    1    0   
$EndComp
$Comp
L Device:C C?
U 1 1 5BFA5F5C
P 5050 2750
F 0 "C?" H 5150 2650 50  0000 R CNN
F 1 "0.1u" H 5100 2850 50  0000 R CNN
F 2 "" H 5088 2600 50  0001 C CNN
F 3 "~" H 5050 2750 50  0001 C CNN
	1    5050 2750
	0    -1   -1   0   
$EndComp
$Comp
L Device:C C?
U 1 1 5BFA682C
P 5050 3050
F 0 "C?" H 5150 2950 50  0000 R CNN
F 1 "0.1u" H 5100 3150 50  0000 R CNN
F 2 "" H 5088 2900 50  0001 C CNN
F 3 "~" H 5050 3050 50  0001 C CNN
	1    5050 3050
	0    -1   -1   0   
$EndComp
$Sheet
S 4250 700  1050 1050
U 5BFB4FFD
F0 "SingleToDifferential" 50
F1 "SingleToDifferential.sch" 50
$EndSheet
$EndSCHEMATC

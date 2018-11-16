EESchema Schematic File Version 4
EELAYER 29 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 2 2
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
L Interface_USB:FT232H U?
U 1 1 5BEE3BEC
P 6200 3650
F 0 "U?" H 6200 5331 50  0000 C CNN
F 1 "FT232H" H 6200 5240 50  0000 C CNN
F 2 "" H 6200 3650 50  0001 C CNN
F 3 "http://www.ftdichip.com/Products/ICs/FT232H.htm" H 6200 3650 50  0001 C CNN
	1    6200 3650
	1    0    0    -1  
$EndComp
Wire Wire Line
	5800 5150 5800 5250
Wire Wire Line
	5800 5250 5900 5250
Wire Wire Line
	5900 5250 5900 5150
Wire Wire Line
	6000 5150 6000 5250
Wire Wire Line
	6000 5250 5900 5250
Connection ~ 5900 5250
Wire Wire Line
	6100 5150 6100 5250
Wire Wire Line
	6100 5250 6000 5250
Connection ~ 6000 5250
Wire Wire Line
	6200 5150 6200 5250
Wire Wire Line
	6200 5250 6100 5250
Connection ~ 6100 5250
Wire Wire Line
	6300 5150 6300 5250
Wire Wire Line
	6300 5250 6200 5250
Connection ~ 6200 5250
Wire Wire Line
	6400 5150 6400 5250
Wire Wire Line
	6400 5250 6300 5250
Connection ~ 6300 5250
Wire Wire Line
	6500 5150 6500 5250
Wire Wire Line
	6500 5250 6400 5250
Connection ~ 6400 5250
Wire Wire Line
	6600 5150 6600 5250
Wire Wire Line
	6600 5250 6500 5250
Connection ~ 6500 5250
Wire Wire Line
	6700 5150 6700 5250
Wire Wire Line
	6700 5250 6600 5250
Connection ~ 6600 5250
Wire Wire Line
	6800 5150 6800 5250
Wire Wire Line
	6800 5250 6700 5250
Connection ~ 6700 5250
$Comp
L power:Earth #PWR?
U 1 1 5BEE6A05
P 5800 5350
F 0 "#PWR?" H 5800 5100 50  0001 C CNN
F 1 "Earth" H 5800 5200 50  0001 C CNN
F 2 "" H 5800 5350 50  0001 C CNN
F 3 "~" H 5800 5350 50  0001 C CNN
	1    5800 5350
	1    0    0    -1  
$EndComp
Wire Wire Line
	5800 5350 5800 5250
Connection ~ 5800 5250
$Comp
L pspice:CAP C?
U 1 1 5BEE9420
P 3500 4850
F 0 "C?" H 3678 4896 50  0000 L CNN
F 1 "27pF" H 3678 4805 50  0000 L CNN
F 2 "" H 3500 4850 50  0001 C CNN
F 3 "~" H 3500 4850 50  0001 C CNN
	1    3500 4850
	1    0    0    -1  
$EndComp
$Comp
L pspice:CAP C?
U 1 1 5BEEA035
P 4250 4850
F 0 "C?" H 4428 4896 50  0000 L CNN
F 1 "27pF" H 4428 4805 50  0000 L CNN
F 2 "" H 4250 4850 50  0001 C CNN
F 3 "~" H 4250 4850 50  0001 C CNN
	1    4250 4850
	1    0    0    -1  
$EndComp
$Comp
L Device:Crystal Y?
U 1 1 5BEEAC6A
P 3900 4550
F 0 "Y?" H 3900 4818 50  0000 C CNN
F 1 "12Mhz" H 3900 4727 50  0000 C CNN
F 2 "" H 3900 4550 50  0001 C CNN
F 3 "~" H 3900 4550 50  0001 C CNN
	1    3900 4550
	1    0    0    -1  
$EndComp
Wire Wire Line
	4250 4550 4250 4600
Wire Wire Line
	4250 4550 5300 4550
Wire Wire Line
	3500 5250 4250 5250
Wire Wire Line
	4250 5250 4250 5100
Wire Wire Line
	4250 5250 4850 5250
Connection ~ 4250 5250
Wire Wire Line
	5300 4150 3500 4150
Wire Wire Line
	3500 4150 3500 4550
Wire Wire Line
	3750 4550 3500 4550
Connection ~ 3500 4550
Wire Wire Line
	3500 4550 3500 4600
Wire Wire Line
	4050 4550 4250 4550
Connection ~ 4250 4550
Wire Wire Line
	3500 5100 3500 5250
Wire Wire Line
	5300 3550 4850 3550
$Comp
L Device:R R?
U 1 1 5BEF1ED3
P 4850 4850
F 0 "R?" H 4920 4896 50  0000 L CNN
F 1 "12k" H 4920 4805 50  0000 L CNN
F 2 "" V 4780 4850 50  0001 C CNN
F 3 "~" H 4850 4850 50  0001 C CNN
	1    4850 4850
	1    0    0    -1  
$EndComp
Wire Wire Line
	4850 3550 4850 4700
Wire Wire Line
	4850 5000 4850 5250
Connection ~ 4850 5250
Wire Wire Line
	4850 5250 5800 5250
$Comp
L Connector:USB_B_Micro J?
U 1 1 5BEF4049
P 2300 3150
F 0 "J?" H 2070 3047 50  0000 R CNN
F 1 "USB_B_Micro" H 2070 3138 50  0000 R CNN
F 2 "" H 2450 3100 50  0001 C CNN
F 3 "~" H 2450 3100 50  0001 C CNN
	1    2300 3150
	1    0    0    1   
$EndComp
$Comp
L Device:Ferrite_Bead FB?
U 1 1 5BEFC068
P 3050 3600
F 0 "FB?" H 3187 3646 50  0000 L CNN
F 1 "600R/0.5A" H 3187 3555 50  0000 L CNN
F 2 "" V 2980 3600 50  0001 C CNN
F 3 "~" H 3050 3600 50  0001 C CNN
	1    3050 3600
	1    0    0    -1  
$EndComp
Wire Wire Line
	3050 3450 3050 3350
Wire Wire Line
	3050 3350 2600 3350
$Comp
L pspice:CAP C?
U 1 1 5BEFE072
P 3050 2650
F 0 "C?" H 3228 2696 50  0000 L CNN
F 1 "10nf" H 3228 2605 50  0000 L CNN
F 2 "" H 3050 2650 50  0001 C CNN
F 3 "~" H 3050 2650 50  0001 C CNN
	1    3050 2650
	1    0    0    -1  
$EndComp
Wire Wire Line
	3050 2900 3050 3350
Connection ~ 3050 3350
Wire Wire Line
	3050 2400 3050 2300
Wire Wire Line
	3050 2300 2300 2300
Wire Wire Line
	2300 2300 2300 2750
Wire Wire Line
	2600 3050 5300 3050
Wire Wire Line
	2600 3150 5300 3150
NoConn ~ 2600 2950
Text Notes 1350 2100 0    50   ~ 0
"ID" is used for OTG Applications, just leave it alone\n
$EndSCHEMATC

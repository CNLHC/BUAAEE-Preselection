EESchema Schematic File Version 4
LIBS:8330_EVA-cache
EELAYER 29 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 4 5
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
L 8330_EVA-extra:AD8131 U4
U 1 1 5BFB9A92
P 5200 3450
F 0 "U4" H 5175 3865 50  0000 C CNN
F 1 "AD8131" H 5175 3774 50  0000 C CNN
F 2 "Package_SO:SOIC-8_3.9x4.9mm_P1.27mm" H 5350 3050 50  0001 C CNN
F 3 "https://www.analog.com/media/en/technical-documentation/data-sheets/AD8131.pdf" H 5350 2950 50  0001 C CNN
	1    5200 3450
	1    0    0    -1  
$EndComp
Text HLabel 3500 3300 0    50   Input ~ 0
SignalIn
Text HLabel 3400 3900 0    50   Input ~ 0
Ground
$Comp
L Device:R R7
U 1 1 5BFB9A9A
P 3900 3650
F 0 "R7" H 3750 3750 50  0000 L CNN
F 1 "49.9" H 3800 3600 50  0000 L CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" V 3830 3650 50  0001 C CNN
F 3 "~" H 3900 3650 50  0001 C CNN
	1    3900 3650
	1    0    0    -1  
$EndComp
Wire Wire Line
	3500 3300 3900 3300
Wire Wire Line
	3900 3300 3900 3500
$Comp
L power:Earth #PWR0102
U 1 1 5BFB9AA2
P 3900 4000
F 0 "#PWR0102" H 3900 3750 50  0001 C CNN
F 1 "Earth" H 3900 3850 50  0001 C CNN
F 2 "" H 3900 4000 50  0001 C CNN
F 3 "~" H 3900 4000 50  0001 C CNN
	1    3900 4000
	1    0    0    -1  
$EndComp
Wire Wire Line
	3900 3800 3900 3900
Wire Wire Line
	5650 3300 5650 2950
Wire Wire Line
	3900 2950 3900 3300
Connection ~ 3900 3300
$Comp
L Device:C C31
U 1 1 5BFB9AAC
P 4150 3650
F 0 "C31" H 4250 3550 50  0000 R CNN
F 1 "0.1u" H 4200 3750 50  0000 R CNN
F 2 "Capacitor_SMD:C_0603_1608Metric_Pad1.05x0.95mm_HandSolder" H 4188 3500 50  0001 C CNN
F 3 "~" H 4150 3650 50  0001 C CNN
	1    4150 3650
	-1   0    0    1   
$EndComp
Wire Wire Line
	4150 3400 4150 3500
Wire Wire Line
	4150 3800 4150 3900
Wire Wire Line
	4150 3900 4050 3900
Connection ~ 3900 3900
Wire Wire Line
	3900 3900 3900 4000
$Comp
L Device:R R8
U 1 1 5BFB9AB7
P 4400 3650
F 0 "R8" H 4250 3750 50  0000 L CNN
F 1 "24.9" H 4300 3600 50  0000 L CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" V 4330 3650 50  0001 C CNN
F 3 "~" H 4400 3650 50  0001 C CNN
	1    4400 3650
	1    0    0    -1  
$EndComp
Wire Wire Line
	4150 3400 4700 3400
Text HLabel 3550 2550 0    50   Input ~ 0
VCC_+5V
Wire Wire Line
	4700 3500 4650 3500
$Comp
L Device:C C34
U 1 1 5BFB9AC0
P 4900 4550
F 0 "C34" H 5000 4450 50  0000 R CNN
F 1 "0.1u" H 4950 4650 50  0000 R CNN
F 2 "Capacitor_SMD:C_0603_1608Metric_Pad1.05x0.95mm_HandSolder" H 4938 4400 50  0001 C CNN
F 3 "~" H 4900 4550 50  0001 C CNN
	1    4900 4550
	-1   0    0    1   
$EndComp
$Comp
L Device:C C35
U 1 1 5BFB9AC6
P 5300 4550
F 0 "C35" H 5400 4450 50  0000 R CNN
F 1 "10u" H 5350 4650 50  0000 R CNN
F 2 "Capacitor_SMD:C_0603_1608Metric_Pad1.05x0.95mm_HandSolder" H 5338 4400 50  0001 C CNN
F 3 "~" H 5300 4550 50  0001 C CNN
	1    5300 4550
	-1   0    0    1   
$EndComp
Wire Wire Line
	5650 3500 5950 3500
Wire Wire Line
	6200 3500 6200 4400
Wire Wire Line
	6200 4400 5300 4400
Wire Wire Line
	4900 4400 5300 4400
Connection ~ 5300 4400
Text HLabel 3500 4400 0    50   Input ~ 0
VEE_-5V
Connection ~ 4900 4400
Wire Wire Line
	3400 3900 3900 3900
$Comp
L power:Earth #PWR0103
U 1 1 5BFB9AD5
P 5100 5000
F 0 "#PWR0103" H 5100 4750 50  0001 C CNN
F 1 "Earth" H 5100 4850 50  0001 C CNN
F 2 "" H 5100 5000 50  0001 C CNN
F 3 "~" H 5100 5000 50  0001 C CNN
	1    5100 5000
	1    0    0    -1  
$EndComp
Wire Wire Line
	5300 4700 5300 4850
Wire Wire Line
	5300 4850 5100 4850
Wire Wire Line
	4900 4700 4900 4850
Wire Wire Line
	4900 4850 5100 4850
Connection ~ 5100 4850
Wire Wire Line
	5100 5000 5100 4850
$Comp
L Device:C C36
U 1 1 5BFB9AE1
P 5950 3750
F 0 "C36" H 6050 3650 50  0000 R CNN
F 1 "10n" H 6000 3850 50  0000 R CNN
F 2 "Capacitor_SMD:C_0603_1608Metric_Pad1.05x0.95mm_HandSolder" H 5988 3600 50  0001 C CNN
F 3 "~" H 5950 3750 50  0001 C CNN
	1    5950 3750
	-1   0    0    1   
$EndComp
Wire Wire Line
	5950 3600 5950 3500
Connection ~ 5950 3500
Wire Wire Line
	5950 3500 6200 3500
$Comp
L power:Earth #PWR0104
U 1 1 5BFB9AEA
P 5950 4050
F 0 "#PWR0104" H 5950 3800 50  0001 C CNN
F 1 "Earth" H 5950 3900 50  0001 C CNN
F 2 "" H 5950 4050 50  0001 C CNN
F 3 "~" H 5950 4050 50  0001 C CNN
	1    5950 4050
	1    0    0    -1  
$EndComp
Wire Wire Line
	5950 4050 5950 3900
Wire Wire Line
	5400 3950 5300 3950
Wire Wire Line
	5300 3950 5300 3800
Wire Wire Line
	5300 3800 5650 3800
Wire Wire Line
	5650 3800 5650 3600
Wire Wire Line
	3900 2950 5650 2950
$Comp
L Device:C C30
U 1 1 5BFB9AF8
P 4050 2700
F 0 "C30" H 4150 2600 50  0000 R CNN
F 1 "0.1u" H 4100 2800 50  0000 R CNN
F 2 "Capacitor_SMD:C_0603_1608Metric_Pad1.05x0.95mm_HandSolder" H 4088 2550 50  0001 C CNN
F 3 "~" H 4050 2700 50  0001 C CNN
	1    4050 2700
	-1   0    0    1   
$EndComp
$Comp
L Device:C C32
U 1 1 5BFB9AFE
P 4300 2700
F 0 "C32" H 4400 2600 50  0000 R CNN
F 1 "10u" H 4350 2800 50  0000 R CNN
F 2 "Capacitor_SMD:C_0603_1608Metric_Pad1.05x0.95mm_HandSolder" H 4338 2550 50  0001 C CNN
F 3 "~" H 4300 2700 50  0001 C CNN
	1    4300 2700
	-1   0    0    1   
$EndComp
Wire Wire Line
	4400 3500 4400 3300
Wire Wire Line
	4400 3300 4700 3300
Wire Wire Line
	4400 3800 4400 3900
Connection ~ 4150 3900
$Comp
L Device:C C33
U 1 1 5BFB9B08
P 4600 3650
F 0 "C33" H 4700 3550 50  0000 R CNN
F 1 "10n" H 4650 3750 50  0000 R CNN
F 2 "Capacitor_SMD:C_0603_1608Metric_Pad1.05x0.95mm_HandSolder" H 4638 3500 50  0001 C CNN
F 3 "~" H 4600 3650 50  0001 C CNN
	1    4600 3650
	-1   0    0    1   
$EndComp
Wire Wire Line
	4650 3500 4600 3500
Connection ~ 4650 3500
Wire Wire Line
	4600 3800 4600 3900
Wire Wire Line
	4150 3900 4400 3900
Connection ~ 4400 3900
Wire Wire Line
	4400 3900 4600 3900
Wire Wire Line
	4700 3600 4700 3950
Wire Wire Line
	4700 3950 4800 3950
Wire Wire Line
	4050 2550 4300 2550
Wire Wire Line
	4300 2550 4650 2550
Wire Wire Line
	4650 2550 4650 3500
Connection ~ 4300 2550
Wire Wire Line
	4050 2550 3550 2550
Connection ~ 4050 2550
Wire Wire Line
	4050 2850 4050 3050
Connection ~ 4050 3900
Wire Wire Line
	4050 3900 3900 3900
Wire Wire Line
	4300 2850 4300 3050
Wire Wire Line
	4300 3050 4050 3050
Connection ~ 4050 3050
Wire Wire Line
	4050 3050 4050 3900
Wire Wire Line
	3500 4400 4900 4400
NoConn ~ 5650 3400
Text HLabel 7800 3450 2    50   Input ~ 0
OutHI
Text HLabel 7800 3150 2    50   Input ~ 0
OutLO
Wire Wire Line
	7150 3150 7800 3150
Wire Wire Line
	7150 3450 7800 3450
Text Label 7150 3450 0    50   ~ 0
131OutL
Text Label 7150 3150 0    50   ~ 0
131OutH
Text Label 5400 3950 0    50   ~ 0
131OutL
Text Label 4800 3950 0    50   ~ 0
131OutH
$EndSCHEMATC

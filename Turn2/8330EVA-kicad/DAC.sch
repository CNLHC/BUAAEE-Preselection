EESchema Schematic File Version 4
LIBS:8330_EVA-cache
EELAYER 29 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 5 5
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
L 8330_EVA-extra:AD5312 U5
U 1 1 5C0CBF97
P 5700 3400
F 0 "U5" H 5700 3915 50  0000 C CNN
F 1 "AD5312" H 5700 3824 50  0000 C CNN
F 2 "Package_SO:MSOP-10_3x3mm_P0.5mm" H 5700 2950 50  0001 C CNN
F 3 "" H 5700 2950 50  0001 C CNN
	1    5700 3400
	-1   0    0    -1  
$EndComp
$Comp
L Reference_Voltage:REF192 U6
U 1 1 5C0CD4C7
P 6750 2700
F 0 "U6" V 6654 2356 50  0000 R CNN
F 1 "REF192" V 6745 2356 50  0000 R CNN
F 2 "Package_SO:SOIC-8_3.9x4.9mm_P1.27mm" H 6750 2650 50  0001 C CIN
F 3 "http://www.analog.com/static/imported-files/data_sheets/REF19xSeries.pdf" H 6750 2650 50  0001 C CIN
	1    6750 2700
	0    -1   1    0   
$EndComp
Text HLabel 2600 2700 0    50   Input ~ 0
VCC_+5V
Text HLabel 2500 3500 0    50   Input ~ 0
SPIClk
Text HLabel 2500 3400 0    50   Input ~ 0
SPIMOSI
Wire Wire Line
	2500 3400 5200 3400
Wire Wire Line
	5200 3700 5200 3850
Text HLabel 8000 3700 2    50   Input ~ 0
ChannelA
Wire Wire Line
	6200 3700 8000 3700
Text HLabel 8000 3850 2    50   Input ~ 0
ChannelB
Wire Wire Line
	5200 3850 8000 3850
Wire Wire Line
	7050 2700 7050 3000
Wire Wire Line
	6750 3000 6750 3200
Wire Wire Line
	6750 3500 6200 3500
Wire Wire Line
	6200 3600 6750 3600
Wire Wire Line
	6750 3600 6750 3500
Connection ~ 6750 3500
Wire Wire Line
	6200 3400 6350 3400
Wire Wire Line
	6350 3400 6350 2700
Connection ~ 6350 2700
Wire Wire Line
	6350 2700 6450 2700
Wire Wire Line
	5200 3300 4900 3300
Wire Wire Line
	4900 3300 4900 4250
Wire Wire Line
	4900 4250 6450 4250
Connection ~ 4900 4250
Wire Wire Line
	2500 3500 5200 3500
Text HLabel 2500 3600 0    50   Input ~ 0
SPICs
Wire Wire Line
	2500 3600 5200 3600
Wire Wire Line
	6200 3300 6450 3300
Wire Wire Line
	6450 3300 6450 4250
Connection ~ 6450 4250
Wire Wire Line
	6450 4250 7050 4250
Text HLabel 2500 4250 0    50   Input ~ 0
Ground
Wire Wire Line
	6750 2300 6750 2200
Wire Wire Line
	6750 2200 6050 2200
Wire Wire Line
	6050 2200 6050 2700
Connection ~ 6050 2700
Wire Wire Line
	6050 2700 6350 2700
$Comp
L Device:C C40
U 1 1 5C0D77AA
P 7500 2700
F 0 "C40" H 7615 2746 50  0000 L CNN
F 1 "10u" H 7615 2655 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric_Pad1.05x0.95mm_HandSolder" H 7538 2550 50  0001 C CNN
F 3 "~" H 7500 2700 50  0001 C CNN
	1    7500 2700
	1    0    0    -1  
$EndComp
Wire Wire Line
	7500 2850 7500 3000
Wire Wire Line
	7500 3000 7050 3000
Connection ~ 7050 3000
Wire Wire Line
	7050 3000 7050 3200
Wire Wire Line
	7500 2550 7500 2200
Wire Wire Line
	7500 2200 6750 2200
Connection ~ 6750 2200
$Comp
L Device:C C41
U 1 1 5C0D8F63
P 7950 2700
F 0 "C41" H 8065 2746 50  0000 L CNN
F 1 "0.1u" H 8065 2655 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric_Pad1.05x0.95mm_HandSolder" H 7988 2550 50  0001 C CNN
F 3 "~" H 7950 2700 50  0001 C CNN
	1    7950 2700
	1    0    0    -1  
$EndComp
Wire Wire Line
	7950 2550 7950 2200
Wire Wire Line
	7950 2200 7500 2200
Connection ~ 7500 2200
Wire Wire Line
	7950 2850 7950 3000
Wire Wire Line
	7950 3000 7500 3000
Connection ~ 7500 3000
$Comp
L Device:C C38
U 1 1 5C0D9F40
P 6900 3200
F 0 "C38" V 6648 3200 50  0000 C CNN
F 1 "1u" V 6739 3200 50  0000 C CNN
F 2 "Capacitor_SMD:C_0603_1608Metric_Pad1.05x0.95mm_HandSolder" H 6938 3050 50  0001 C CNN
F 3 "~" H 6900 3200 50  0001 C CNN
	1    6900 3200
	0    1    1    0   
$EndComp
Connection ~ 7050 3200
Wire Wire Line
	7050 3200 7050 3500
Connection ~ 6750 3200
Wire Wire Line
	6750 3200 6750 3500
$Comp
L Device:C C39
U 1 1 5C0DA65E
P 6900 3500
F 0 "C39" V 6648 3500 50  0000 C CNN
F 1 "0.1u" V 6739 3500 50  0000 C CNN
F 2 "Capacitor_SMD:C_0603_1608Metric_Pad1.05x0.95mm_HandSolder" H 6938 3350 50  0001 C CNN
F 3 "~" H 6900 3500 50  0001 C CNN
	1    6900 3500
	0    1    1    0   
$EndComp
Connection ~ 7050 3500
Wire Wire Line
	7050 3500 7050 4250
$Comp
L Device:C C37
U 1 1 5C0DB093
P 4650 3050
F 0 "C37" H 4765 3096 50  0000 L CNN
F 1 "1u" H 4765 3005 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric_Pad1.05x0.95mm_HandSolder" H 4688 2900 50  0001 C CNN
F 3 "~" H 4650 3050 50  0001 C CNN
	1    4650 3050
	1    0    0    -1  
$EndComp
Wire Wire Line
	2600 2700 4650 2700
Wire Wire Line
	4650 2900 4650 2700
Connection ~ 4650 2700
Wire Wire Line
	4650 2700 6050 2700
Wire Wire Line
	4650 3200 4650 4250
Wire Wire Line
	2500 4250 4650 4250
Connection ~ 4650 4250
Wire Wire Line
	4650 4250 4900 4250
$EndSCHEMATC

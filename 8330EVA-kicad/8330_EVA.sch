EESchema Schematic File Version 4
LIBS:8330_EVA-cache
EELAYER 29 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 1 5
Title ""
Date ""
Rev ""
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Sheet
S 3050 4750 950  850 
U 5BEE3A6A
F0 "USB2SPI" 50
F1 "USB2SPI.sch" 50
F2 "MPSSE_SCK" I R 4000 4950 50 
F3 "MPSSE_MOSI" I R 4000 5100 50 
F4 "MPSSE_MISO" I R 4000 5250 50 
F5 "MPSSE_CS" I R 4000 5400 50 
F6 "USB_D+" I L 3050 5200 50 
F7 "USB_D-" I L 3050 5100 50 
F8 "VBUS" I L 3050 5400 50 
F9 "Ground" I L 3050 5550 50 
F10 "VCC_+5V" I L 3050 4800 50 
$EndSheet
$Sheet
S 5850 3400 950  850 
U 5BF7C1D8
F0 "VCA" 50
F1 "AD8330.sch" 50
F2 "OPLO" I R 6800 3700 50 
F3 "OPHI" I R 6800 3900 50 
F4 "VMAG" I L 5850 4100 50 
F5 "VDBS" I L 5850 4000 50 
F6 "VCC_+5V" I L 5850 3500 50 
F7 "VEE_-5V" I L 5850 3600 50 
F8 "GROUND" I L 5850 4200 50 
F9 "SignalIN" I L 5850 3850 50 
$EndSheet
$Comp
L Connector:Conn_Coaxial J2
U 1 1 5BF938E3
P 3400 3850
F 0 "J2" H 3550 4050 50  0000 L CNN
F 1 "Conn_Coaxial" H 3500 3734 50  0000 L CNN
F 2 "Connector_Coaxial:SMA_Amphenol_132134-14_Vertical" H 3400 3850 50  0001 C CNN
F 3 " ~" H 3400 3850 50  0001 C CNN
	1    3400 3850
	-1   0    0    -1  
$EndComp
$Comp
L Connector:Conn_Coaxial J4
U 1 1 5BF93FB8
P 7450 3700
F 0 "J4" H 7550 3582 50  0000 L CNN
F 1 "Conn_Coaxial" H 7550 3673 50  0000 L CNN
F 2 "Connector_Coaxial:SMA_Amphenol_132134-11_Vertical" H 7450 3700 50  0001 C CNN
F 3 " ~" H 7450 3700 50  0001 C CNN
	1    7450 3700
	1    0    0    1   
$EndComp
$Comp
L Connector:Conn_Coaxial J5
U 1 1 5BF9438D
P 7450 3900
F 0 "J5" H 7550 3875 50  0000 L CNN
F 1 "Conn_Coaxial" H 7550 3784 50  0000 L CNN
F 2 "Connector_Coaxial:SMA_Amphenol_132134-11_Vertical" H 7450 3900 50  0001 C CNN
F 3 " ~" H 7450 3900 50  0001 C CNN
	1    7450 3900
	1    0    0    -1  
$EndComp
$Sheet
S 4250 4750 800  900 
U 5BF9AAF9
F0 "DAC" 50
F1 "DAC.sch" 50
F2 "VCC_+5V" I L 4250 4800 50 
F3 "SPIClk" I L 4250 4950 50 
F4 "SPIMOSI" I L 4250 5100 50 
F5 "ChannelA" I R 5050 5050 50 
F6 "ChannelB" I R 5050 5200 50 
F7 "SPICs" I L 4250 5400 50 
F8 "Ground" I L 4250 5550 50 
$EndSheet
Wire Wire Line
	7250 3900 6800 3900
Wire Wire Line
	6800 3700 7250 3700
Wire Wire Line
	4250 4950 4000 4950
Wire Wire Line
	4250 5100 4000 5100
Wire Wire Line
	4250 5400 4000 5400
Wire Wire Line
	5050 5050 5250 5050
Wire Wire Line
	5250 5050 5250 4000
Wire Wire Line
	5300 4100 5300 5200
Wire Wire Line
	5300 5200 5050 5200
NoConn ~ 4000 5250
Wire Wire Line
	5350 4200 5350 5750
Wire Wire Line
	5350 5750 5000 5750
Wire Wire Line
	4250 5550 4150 5550
Wire Wire Line
	4150 5550 4150 5750
Wire Wire Line
	3400 4050 2500 4050
Wire Wire Line
	2500 4050 2500 5750
Wire Wire Line
	2500 5750 4150 5750
Connection ~ 4150 5750
Connection ~ 5350 5750
$Comp
L power:Earth #PWR0101
U 1 1 5C0E471A
P 5000 6000
F 0 "#PWR0101" H 5000 5750 50  0001 C CNN
F 1 "Earth" H 5000 5850 50  0001 C CNN
F 2 "" H 5000 6000 50  0001 C CNN
F 3 "~" H 5000 6000 50  0001 C CNN
	1    5000 6000
	1    0    0    -1  
$EndComp
Wire Wire Line
	5000 6000 5000 5750
Connection ~ 5000 5750
Wire Wire Line
	5000 5750 4150 5750
$Comp
L Connector:Conn_01x03_Male J3
U 1 1 5C0E5EB0
P 5100 3600
F 0 "J3" H 5208 3881 50  0000 C CNN
F 1 "Conn_01x03_Male" H 5208 3790 50  0000 C CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x03_P2.54mm_Vertical" H 5100 3600 50  0001 C CNN
F 3 "~" H 5100 3600 50  0001 C CNN
	1    5100 3600
	1    0    0    -1  
$EndComp
Wire Wire Line
	3600 3850 5850 3850
Wire Wire Line
	5250 4000 5850 4000
Wire Wire Line
	5300 4100 5850 4100
Wire Wire Line
	5350 4200 5850 4200
Wire Wire Line
	5300 3500 5500 3500
Wire Wire Line
	5300 3700 5800 3700
Wire Wire Line
	5800 3700 5800 3600
Wire Wire Line
	5800 3600 5850 3600
Wire Wire Line
	5300 3600 5650 3600
Wire Wire Line
	5650 3600 5650 5750
Connection ~ 5650 5750
Wire Wire Line
	5650 5750 5350 5750
Wire Wire Line
	7450 4100 7450 5750
Wire Wire Line
	5650 5750 7150 5750
Wire Wire Line
	7450 3500 7150 3500
Wire Wire Line
	7150 3500 7150 5750
Connection ~ 7150 5750
Wire Wire Line
	7150 5750 7450 5750
$Comp
L Connector:USB_B_Micro J?
U 1 1 5C0F0C42
P 1850 5200
AR Path="/5BEE3A6A/5C0F0C42" Ref="J?"  Part="1" 
AR Path="/5C0F0C42" Ref="J1"  Part="1" 
F 0 "J1" H 1620 5097 50  0000 R CNN
F 1 "USB_B_Micro" H 1620 5188 50  0000 R CNN
F 2 "Connector_USB:USB_Micro-B_Molex_47346-0001" H 2000 5150 50  0001 C CNN
F 3 "~" H 2000 5150 50  0001 C CNN
	1    1850 5200
	1    0    0    1   
$EndComp
Wire Wire Line
	3050 4800 2950 4800
Wire Wire Line
	2950 4800 2950 4600
Wire Wire Line
	2950 4600 4200 4600
Wire Wire Line
	4200 4600 4200 4800
Wire Wire Line
	4200 4800 4250 4800
Wire Wire Line
	5500 3500 5500 4600
Wire Wire Line
	5500 4600 4200 4600
Connection ~ 5500 3500
Wire Wire Line
	5500 3500 5850 3500
Connection ~ 4200 4600
Wire Wire Line
	3050 5100 2150 5100
Wire Wire Line
	2150 5200 3050 5200
Wire Wire Line
	3050 5400 2150 5400
Wire Wire Line
	2250 5550 3050 5550
Wire Wire Line
	1750 4800 1750 4650
Wire Wire Line
	1750 4650 1850 4650
Wire Wire Line
	1850 4650 1850 4800
Wire Wire Line
	1850 4650 2250 4650
Wire Wire Line
	2250 4650 2250 5550
Connection ~ 1850 4650
NoConn ~ 2150 5000
$EndSCHEMATC

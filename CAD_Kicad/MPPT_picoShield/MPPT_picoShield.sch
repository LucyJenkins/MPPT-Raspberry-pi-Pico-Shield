EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 1 1
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
L Device:D_Schottky D2
U 1 1 622E4A92
P 4750 1300
F 0 "D2" H 4750 1517 50  0000 C CNN
F 1 "MBRS3200T3" H 4750 1426 50  0000 C CNN
F 2 "Custom_MPPT:MBRS3200T3G" H 4750 1300 50  0001 C CNN
F 3 "~" H 4750 1300 50  0001 C CNN
	1    4750 1300
	1    0    0    -1  
$EndComp
$Comp
L Device:C C3
U 1 1 622E3852
P 5600 1700
F 0 "C3" H 5715 1746 50  0000 L CNN
F 1 ".1µF" H 5715 1655 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric" H 5638 1550 50  0001 C CNN
F 3 "~" H 5600 1700 50  0001 C CNN
	1    5600 1700
	-1   0    0    1   
$EndComp
$Comp
L Device:CP1 C2
U 1 1 622E3E3C
P 5150 1700
F 0 "C2" H 5265 1746 50  0000 L CNN
F 1 "47µF" H 5265 1655 50  0000 L CNN
F 2 "" H 5150 1700 50  0001 C CNN
F 3 "~" H 5150 1700 50  0001 C CNN
	1    5150 1700
	-1   0    0    1   
$EndComp
$Comp
L pspice:INDUCTOR L1
U 1 1 622E53B7
P 4300 1700
F 0 "L1" H 4300 1915 50  0000 C CNN
F 1 "1mH" H 4300 1824 50  0000 C CNN
F 2 "" H 4300 1700 50  0001 C CNN
F 3 "~" H 4300 1700 50  0001 C CNN
	1    4300 1700
	0    -1   -1   0   
$EndComp
Wire Wire Line
	5150 1300 5600 1300
Wire Wire Line
	5600 1300 5600 1550
Wire Wire Line
	5150 2400 5600 2400
Wire Wire Line
	5150 1550 5150 1300
Connection ~ 5150 2400
Wire Wire Line
	4300 1450 4300 1300
Wire Wire Line
	5150 1300 4900 1300
Connection ~ 5150 1300
Wire Wire Line
	4300 1300 4600 1300
$Comp
L Device:CP1 C1
U 1 1 6234D214
P 1500 1700
F 0 "C1" H 1615 1746 50  0000 L CNN
F 1 "47µF" H 1615 1655 50  0000 L CNN
F 2 "" H 1500 1700 50  0001 C CNN
F 3 "~" H 1500 1700 50  0001 C CNN
	1    1500 1700
	1    0    0    -1  
$EndComp
Wire Wire Line
	1500 1550 1500 1300
$Comp
L Connector:Screw_Terminal_01x02 J1
U 1 1 623571FA
P 1050 1750
F 0 "J1" H 968 1425 50  0000 C CNN
F 1 "PV_input" H 968 1516 50  0000 C CNN
F 2 "TerminalBlock:TerminalBlock_bornier-2_P5.08mm" H 1050 1750 50  0001 C CNN
F 3 "~" H 1050 1750 50  0001 C CNN
	1    1050 1750
	-1   0    0    1   
$EndComp
$Comp
L Device:D_Schottky D1
U 1 1 6235EF08
P 2850 1300
F 0 "D1" H 2850 1517 50  0000 C CNN
F 1 "MBRS3200T3" H 2850 1426 50  0000 C CNN
F 2 "Custom_MPPT:MBRS3200T3G" H 2850 1300 50  0001 C CNN
F 3 "~" H 2850 1300 50  0001 C CNN
	1    2850 1300
	-1   0    0    1   
$EndComp
$Comp
L Device:R_US R30
U 1 1 6236181F
P 1900 1500
F 0 "R30" H 1968 1546 50  0000 L CNN
F 1 "1M" H 1968 1455 50  0000 L CNN
F 2 "Resistor_SMD:R_0603_1608Metric" V 1940 1490 50  0001 C CNN
F 3 "~" H 1900 1500 50  0001 C CNN
	1    1900 1500
	1    0    0    -1  
$EndComp
$Comp
L Device:R_US R31
U 1 1 62362779
P 1900 1900
F 0 "R31" H 1968 1946 50  0000 L CNN
F 1 "100k" H 1968 1855 50  0000 L CNN
F 2 "Resistor_SMD:R_0603_1608Metric" V 1940 1890 50  0001 C CNN
F 3 "~" H 1900 1900 50  0001 C CNN
	1    1900 1900
	1    0    0    -1  
$EndComp
Wire Wire Line
	1500 1300 1900 1300
Wire Wire Line
	1900 1300 1900 1350
Connection ~ 1900 1300
Wire Wire Line
	1250 1650 1350 1650
Wire Wire Line
	1350 1650 1350 1300
Wire Wire Line
	1350 1300 1500 1300
Connection ~ 1500 1300
Wire Wire Line
	1350 1750 1250 1750
$Comp
L Device:R_Shunt_US R26
U 1 1 62377A18
P 2250 2400
F 0 "R26" V 2117 2400 50  0000 C CNN
F 1 "100m+/-1% 1W" V 2026 2400 50  0000 C CNN
F 2 "Resistor_SMD:R_1206_3216Metric" V 2180 2400 50  0001 C CNN
F 3 "~" H 2250 2400 50  0001 C CNN
	1    2250 2400
	0    -1   -1   0   
$EndComp
Text GLabel 3850 900  0    50   Input ~ 0
Drive1
$Comp
L Device:Q_PMOS_GDS Q1
U 1 1 6230BB3D
P 3950 1200
F 0 "Q1" V 4292 1200 50  0000 C CNN
F 1 "PMOS_GDS_TO220" V 4201 1200 50  0000 C CNN
F 2 "Package_TO_SOT_THT:TO-220-3_Vertical" H 4150 1300 50  0001 C CNN
F 3 "~" H 3950 1200 50  0001 C CNN
	1    3950 1200
	0    1    1    0   
$EndComp
Wire Wire Line
	3950 1000 3950 900 
Wire Wire Line
	3850 900  3950 900 
Text GLabel 3000 1900 2    50   Output ~ 0
Shunt_PV+
Text GLabel 3000 2200 2    50   Output ~ 0
Shunt_PV-
Text GLabel 2000 1700 2    50   Output ~ 0
VPV_sense
Text GLabel 5950 2400 2    50   Output ~ 0
MPPT_out+
Text GLabel 5950 1300 2    50   Output ~ 0
MPPT_out-
Text GLabel 3650 1150 2    50   Output ~ 0
QS1
Wire Wire Line
	3550 1300 3550 1150
Wire Wire Line
	3550 1150 3650 1150
Connection ~ 5600 2400
Wire Wire Line
	5950 1300 5600 1300
Connection ~ 5600 1300
$Comp
L power:GND #PWR?
U 1 1 6245C1F6
P 1900 2150
F 0 "#PWR?" H 1900 1900 50  0001 C CNN
F 1 "GND" H 1905 1977 50  0000 C CNN
F 2 "" H 1900 2150 50  0001 C CNN
F 3 "" H 1900 2150 50  0001 C CNN
	1    1900 2150
	1    0    0    -1  
$EndComp
Wire Wire Line
	1350 2400 1500 2400
Wire Wire Line
	1900 2150 1900 2050
Wire Wire Line
	1350 1750 1350 2400
Wire Wire Line
	1500 1850 1500 2400
Wire Wire Line
	5150 1850 5150 2400
Wire Wire Line
	5600 1850 5600 2400
Wire Wire Line
	4300 1950 4300 2400
Wire Wire Line
	4300 2400 5150 2400
Text Notes 1350 1250 0    50   ~ 0
Vpv + Vbat
Text Notes 5600 2500 0    50   ~ 0
Vbat\n
Text Notes 5650 1250 0    50   ~ 0
GND
Wire Notes Line
	3500 750  3500 2650
Wire Notes Line
	850  2650 850  750 
Text Notes 4150 700  0    100  ~ 20
Buck boost SMPS
Connection ~ 4300 2400
Wire Wire Line
	1900 1300 2700 1300
Wire Wire Line
	5600 2400 5950 2400
$Comp
L Connector:Screw_Terminal_01x03 J2
U 1 1 6248BE78
P 1050 4450
F 0 "J2" H 1130 4492 50  0000 L CNN
F 1 "Battery_pack" H 1130 4401 50  0000 L CNN
F 2 "TerminalBlock:TerminalBlock_bornier-3_P5.08mm" H 1050 4450 50  0001 C CNN
F 3 "~" H 1050 4450 50  0001 C CNN
	1    1050 4450
	-1   0    0    1   
$EndComp
$Comp
L Device:R_US R32
U 1 1 624911CA
P 1500 4700
F 0 "R32" H 1568 4746 50  0000 L CNN
F 1 "1M" H 1568 4655 50  0000 L CNN
F 2 "Resistor_SMD:R_0603_1608Metric" V 1540 4690 50  0001 C CNN
F 3 "~" H 1500 4700 50  0001 C CNN
	1    1500 4700
	1    0    0    -1  
$EndComp
$Comp
L Device:R_US R33
U 1 1 624911D0
P 1500 5100
F 0 "R33" H 1568 5146 50  0000 L CNN
F 1 "100k" H 1568 5055 50  0000 L CNN
F 2 "Resistor_SMD:R_0603_1608Metric" V 1540 5090 50  0001 C CNN
F 3 "~" H 1500 5100 50  0001 C CNN
	1    1500 5100
	1    0    0    -1  
$EndComp
Wire Wire Line
	1500 4950 1500 4900
Text GLabel 1700 4900 2    50   Output ~ 0
VCell1_sense
Wire Wire Line
	1500 4900 1700 4900
Connection ~ 1500 4900
Wire Wire Line
	1500 4900 1500 4850
$Comp
L power:GND #PWR?
U 1 1 624911DB
P 1500 5350
F 0 "#PWR?" H 1500 5100 50  0001 C CNN
F 1 "GND" H 1505 5177 50  0000 C CNN
F 2 "" H 1500 5350 50  0001 C CNN
F 3 "" H 1500 5350 50  0001 C CNN
	1    1500 5350
	1    0    0    -1  
$EndComp
Wire Wire Line
	1500 5350 1500 5300
$Comp
L Device:R_US R34
U 1 1 62493677
P 2350 4700
F 0 "R34" H 2418 4746 50  0000 L CNN
F 1 "1M" H 2418 4655 50  0000 L CNN
F 2 "Resistor_SMD:R_0603_1608Metric" V 2390 4690 50  0001 C CNN
F 3 "~" H 2350 4700 50  0001 C CNN
	1    2350 4700
	1    0    0    -1  
$EndComp
$Comp
L Device:R_US R35
U 1 1 6249367D
P 2350 5100
F 0 "R35" H 2418 5146 50  0000 L CNN
F 1 "100k" H 2418 5055 50  0000 L CNN
F 2 "Resistor_SMD:R_0603_1608Metric" V 2390 5090 50  0001 C CNN
F 3 "~" H 2350 5100 50  0001 C CNN
	1    2350 5100
	1    0    0    -1  
$EndComp
Wire Wire Line
	2350 4950 2350 4900
Text GLabel 2550 4900 2    50   Output ~ 0
VCell2_sense
Wire Wire Line
	2350 4900 2550 4900
Connection ~ 2350 4900
Wire Wire Line
	2350 4900 2350 4850
$Comp
L power:GND #PWR?
U 1 1 62493688
P 2350 5350
F 0 "#PWR?" H 2350 5100 50  0001 C CNN
F 1 "GND" H 2355 5177 50  0000 C CNN
F 2 "" H 2350 5350 50  0001 C CNN
F 3 "" H 2350 5350 50  0001 C CNN
	1    2350 5350
	1    0    0    -1  
$EndComp
Wire Wire Line
	2350 5350 2350 5250
Wire Wire Line
	1500 5300 1350 5300
Wire Wire Line
	1350 5300 1350 4550
Wire Wire Line
	1350 4550 1250 4550
Connection ~ 1500 5300
Wire Wire Line
	1500 5300 1500 5250
Wire Wire Line
	1500 4550 1500 4450
Wire Wire Line
	1500 4450 1250 4450
Wire Wire Line
	2350 4550 2350 4350
$Comp
L Device:R_Shunt_US R28
U 1 1 624A1CF9
P 1900 4350
F 0 "R28" V 1767 4350 50  0000 C CNN
F 1 "100m+/-1%" V 1676 4350 50  0000 C CNN
F 2 "Resistor_SMD:R_1206_3216Metric" V 1830 4350 50  0001 C CNN
F 3 "~" H 1900 4350 50  0001 C CNN
	1    1900 4350
	0    -1   -1   0   
$EndComp
Text GLabel 2700 3900 2    50   Output ~ 0
Batt_out+
Text GLabel 2700 4200 2    50   Output ~ 0
batt_out-
Wire Wire Line
	1800 4200 1800 3900
Wire Wire Line
	1800 3900 2100 3900
Wire Wire Line
	1250 4350 1600 4350
Wire Wire Line
	2100 4350 2350 4350
Text GLabel 2550 4350 2    50   Output ~ 0
Vbat
Wire Wire Line
	2350 4350 2550 4350
Connection ~ 2350 4350
Text Notes 1700 700  0    100  ~ 20
PV input\n
Text Notes 950  2900 0    100  ~ 20
Battery pack input\n
Text Notes 6900 700  0    100  ~ 20
Buck boost control\n
Text Notes 8700 2900 0    100  ~ 20
µcontroller
Text GLabel 1300 3100 0    50   Input ~ 0
MPPT_out+
Text GLabel 2700 3300 2    50   Output ~ 0
Batt_in+
Text GLabel 2700 3600 2    50   Output ~ 0
batt_in-
$Comp
L Device:D_Schottky D3
U 1 1 62515FA0
P 1600 4050
F 0 "D3" V 1646 3970 50  0000 R CNN
F 1 "MBRS3200T3" V 1555 3970 50  0000 R CNN
F 2 "Custom_MPPT:MBRS3200T3G" H 1600 4050 50  0001 C CNN
F 3 "~" H 1600 4050 50  0001 C CNN
	1    1600 4050
	0    -1   -1   0   
$EndComp
Wire Wire Line
	1600 3800 1600 3900
Wire Wire Line
	1600 4200 1600 4350
Connection ~ 1600 4350
Wire Wire Line
	1600 4350 1700 4350
Text Notes 2050 5900 0    100  ~ 20
User Interface
$Comp
L Device:LED D3
U 1 1 62544138
P 1850 7100
F 0 "D3" V 1889 6982 50  0000 R CNN
F 1 "RED" V 1798 6982 50  0000 R CNN
F 2 "LED_SMD:LED_0805_2012Metric" H 1850 7100 50  0001 C CNN
F 3 "~" H 1850 7100 50  0001 C CNN
	1    1850 7100
	0    -1   -1   0   
$EndComp
$Comp
L Device:LED D4
U 1 1 62545148
P 2200 7100
F 0 "D4" V 2239 6982 50  0000 R CNN
F 1 "GR" V 2148 6982 50  0000 R CNN
F 2 "LED_SMD:LED_0805_2012Metric" H 2200 7100 50  0001 C CNN
F 3 "~" H 2200 7100 50  0001 C CNN
	1    2200 7100
	0    -1   -1   0   
$EndComp
$Comp
L Device:LED D5
U 1 1 62547CE3
P 2550 7100
F 0 "D5" V 2589 6982 50  0000 R CNN
F 1 "GR" V 2498 6982 50  0000 R CNN
F 2 "LED_SMD:LED_0805_2012Metric" H 2550 7100 50  0001 C CNN
F 3 "~" H 2550 7100 50  0001 C CNN
	1    2550 7100
	0    -1   -1   0   
$EndComp
Wire Wire Line
	1850 7250 1850 7450
Wire Wire Line
	2550 7250 2550 7450
Wire Wire Line
	2200 7250 2200 7450
$Comp
L Device:LED D1
U 1 1 6256D0AA
P 1150 7100
F 0 "D1" V 1189 6982 50  0000 R CNN
F 1 "GR" V 1098 6982 50  0000 R CNN
F 2 "LED_SMD:LED_0805_2012Metric" H 1150 7100 50  0001 C CNN
F 3 "~" H 1150 7100 50  0001 C CNN
	1    1150 7100
	0    -1   -1   0   
$EndComp
$Comp
L Device:LED D2
U 1 1 6256D0B0
P 1500 7100
F 0 "D2" V 1539 6982 50  0000 R CNN
F 1 "RED" V 1448 6982 50  0000 R CNN
F 2 "LED_SMD:LED_0805_2012Metric" H 1500 7100 50  0001 C CNN
F 3 "~" H 1500 7100 50  0001 C CNN
	1    1500 7100
	0    -1   -1   0   
$EndComp
Wire Wire Line
	1150 7250 1150 7450
Wire Wire Line
	1500 7250 1500 7450
Connection ~ 1850 7450
Connection ~ 2200 7450
Connection ~ 2550 7450
Wire Wire Line
	2200 7450 2550 7450
Wire Wire Line
	1850 7450 2200 7450
Wire Wire Line
	1150 7450 1500 7450
Connection ~ 1500 7450
Wire Wire Line
	1500 7450 1850 7450
$Comp
L Device:R_US R1
U 1 1 6257A954
P 1150 6750
F 0 "R1" H 1218 6796 50  0000 L CNN
F 1 "470" H 1218 6705 50  0000 L CNN
F 2 "Resistor_SMD:R_0603_1608Metric" V 1190 6740 50  0001 C CNN
F 3 "~" H 1150 6750 50  0001 C CNN
	1    1150 6750
	1    0    0    -1  
$EndComp
$Comp
L Device:R_US R2
U 1 1 6257E5AE
P 1500 6750
F 0 "R2" H 1568 6796 50  0000 L CNN
F 1 "470" H 1568 6705 50  0000 L CNN
F 2 "Resistor_SMD:R_0603_1608Metric" V 1540 6740 50  0001 C CNN
F 3 "~" H 1500 6750 50  0001 C CNN
	1    1500 6750
	1    0    0    -1  
$EndComp
$Comp
L Device:R_US R3
U 1 1 6258211B
P 1850 6750
F 0 "R3" H 1918 6796 50  0000 L CNN
F 1 "470" H 1918 6705 50  0000 L CNN
F 2 "Resistor_SMD:R_0603_1608Metric" V 1890 6740 50  0001 C CNN
F 3 "~" H 1850 6750 50  0001 C CNN
	1    1850 6750
	1    0    0    -1  
$EndComp
$Comp
L Device:R_US R4
U 1 1 62585B95
P 2200 6750
F 0 "R4" H 2268 6796 50  0000 L CNN
F 1 "1k" H 2268 6705 50  0000 L CNN
F 2 "Resistor_SMD:R_0603_1608Metric" V 2240 6740 50  0001 C CNN
F 3 "~" H 2200 6750 50  0001 C CNN
	1    2200 6750
	1    0    0    -1  
$EndComp
$Comp
L Device:R_US R5
U 1 1 6258D0F3
P 2550 6750
F 0 "R5" H 2618 6796 50  0000 L CNN
F 1 "2k" H 2618 6705 50  0000 L CNN
F 2 "Resistor_SMD:R_0603_1608Metric" V 2590 6740 50  0001 C CNN
F 3 "~" H 2550 6750 50  0001 C CNN
	1    2550 6750
	1    0    0    -1  
$EndComp
Wire Wire Line
	1150 6950 1150 6900
Wire Wire Line
	1500 6950 1500 6900
Wire Wire Line
	1850 6950 1850 6900
Wire Wire Line
	2200 6950 2200 6900
Wire Wire Line
	2550 6950 2550 6900
$Comp
L power:GND #PWR?
U 1 1 625E96C3
P 2550 7550
F 0 "#PWR?" H 2550 7300 50  0001 C CNN
F 1 "GND" H 2555 7377 50  0000 C CNN
F 2 "" H 2550 7550 50  0001 C CNN
F 3 "" H 2550 7550 50  0001 C CNN
	1    2550 7550
	1    0    0    -1  
$EndComp
Wire Wire Line
	2550 7550 2550 7450
Wire Wire Line
	2550 6600 2550 6150
Text GLabel 950  6150 0    50   Input ~ 0
Vbat
Text GLabel 950  6350 0    50   Input ~ 0
OV_LED
Text GLabel 950  6450 0    50   Input ~ 0
UV_LED
Text GLabel 950  6550 0    50   Input ~ 0
SIG_LED
Wire Wire Line
	950  6150 2550 6150
Connection ~ 2550 6150
Wire Wire Line
	2200 6600 2200 6250
Wire Wire Line
	2200 6250 950  6250
Wire Wire Line
	1850 6600 1850 6350
Wire Wire Line
	1850 6350 950  6350
Wire Wire Line
	950  6450 1500 6450
Wire Wire Line
	1500 6450 1500 6600
Wire Wire Line
	950  6550 1150 6550
Wire Wire Line
	1150 6550 1150 6600
$Comp
L power:VCC #PWR?
U 1 1 62667F8C
P 950 6250
F 0 "#PWR?" H 950 6100 50  0001 C CNN
F 1 "VCC" V 965 6377 50  0000 L CNN
F 2 "" H 950 6250 50  0001 C CNN
F 3 "" H 950 6250 50  0001 C CNN
	1    950  6250
	0    -1   -1   0   
$EndComp
Text Notes 5400 5900 0    100  ~ 20
Memory unit
$Comp
L power:+5V #PWR?
U 1 1 6277424B
P 10650 1100
F 0 "#PWR?" H 10650 950 50  0001 C CNN
F 1 "+5V" V 10665 1228 50  0000 L CNN
F 2 "" H 10650 1100 50  0001 C CNN
F 3 "" H 10650 1100 50  0001 C CNN
	1    10650 1100
	0    1    1    0   
$EndComp
Text GLabel 1300 3200 0    50   Input ~ 0
MPPT_out-
$Comp
L power:GND #PWR?
U 1 1 627A0163
P 1350 3250
F 0 "#PWR?" H 1350 3000 50  0001 C CNN
F 1 "GND" H 1355 3077 50  0000 C CNN
F 2 "" H 1350 3250 50  0001 C CNN
F 3 "" H 1350 3250 50  0001 C CNN
	1    1350 3250
	1    0    0    -1  
$EndComp
Wire Wire Line
	1300 3100 1600 3100
Wire Wire Line
	1300 3200 1350 3200
Wire Wire Line
	1350 3200 1350 3250
Text Notes 8950 700  0    100  ~ 20
5V LDO & Voltage output
Wire Notes Line
	6500 750  6500 2650
Connection ~ 9450 1100
Wire Wire Line
	9300 1100 9450 1100
Wire Wire Line
	9950 1500 9950 1600
$Comp
L power:GND #PWR?
U 1 1 6278091F
P 9950 1600
F 0 "#PWR?" H 9950 1350 50  0001 C CNN
F 1 "GND" H 9955 1427 50  0000 C CNN
F 2 "" H 9950 1600 50  0001 C CNN
F 3 "" H 9950 1600 50  0001 C CNN
	1    9950 1600
	1    0    0    -1  
$EndComp
Connection ~ 10500 1100
Wire Wire Line
	10500 1100 10650 1100
Text GLabel 9300 1100 0    50   Input ~ 0
Vbat
Wire Wire Line
	10500 1100 10500 1150
Wire Wire Line
	10250 1100 10500 1100
Connection ~ 9950 1500
Wire Wire Line
	10500 1500 10500 1450
Wire Wire Line
	9950 1500 10500 1500
Wire Wire Line
	9950 1500 9950 1400
Wire Wire Line
	9450 1500 9950 1500
Wire Wire Line
	9450 1450 9450 1500
Wire Wire Line
	9450 1100 9650 1100
Wire Wire Line
	9450 1150 9450 1100
$Comp
L Device:CP1 C5
U 1 1 6274A517
P 10500 1300
F 0 "C5" H 10615 1346 50  0000 L CNN
F 1 "10µF" H 10615 1255 50  0000 L CNN
F 2 "" H 10500 1300 50  0001 C CNN
F 3 "~" H 10500 1300 50  0001 C CNN
	1    10500 1300
	-1   0    0    1   
$EndComp
$Comp
L Regulator_Linear:LF50_TO220 U10
U 1 1 62741899
P 9950 1100
F 0 "U10" H 9950 1342 50  0000 C CNN
F 1 "LF50_TO220" H 9950 1251 50  0000 C CNN
F 2 "Package_TO_SOT_THT:TO-220-3_Vertical" H 9950 1325 50  0001 C CIN
F 3 "http://www.st.com/content/ccc/resource/technical/document/datasheet/c4/0e/7e/2a/be/bc/4c/bd/CD00000546.pdf/files/CD00000546.pdf/jcr:content/translations/en.CD00000546.pdf" H 9950 1050 50  0001 C CNN
	1    9950 1100
	1    0    0    -1  
$EndComp
$Comp
L Connector:Screw_Terminal_01x04 J3
U 1 1 62841410
P 10350 2150
F 0 "J3" H 10430 2142 50  0000 L CNN
F 1 "V_out" H 10430 2051 50  0000 L CNN
F 2 "TerminalBlock:TerminalBlock_bornier-4_P5.08mm" H 10350 2150 50  0001 C CNN
F 3 "~" H 10350 2150 50  0001 C CNN
	1    10350 2150
	1    0    0    -1  
$EndComp
Text GLabel 10000 2050 0    50   Input ~ 0
Vbat
$Comp
L power:+5V #PWR?
U 1 1 628588DD
P 9700 2050
F 0 "#PWR?" H 9700 1900 50  0001 C CNN
F 1 "+5V" H 9715 2223 50  0000 C CNN
F 2 "" H 9700 2050 50  0001 C CNN
F 3 "" H 9700 2050 50  0001 C CNN
	1    9700 2050
	1    0    0    -1  
$EndComp
$Comp
L power:VCC #PWR?
U 1 1 6285914D
P 9500 2050
F 0 "#PWR?" H 9500 1900 50  0001 C CNN
F 1 "VCC" H 9515 2223 50  0000 C CNN
F 2 "" H 9500 2050 50  0001 C CNN
F 3 "" H 9500 2050 50  0001 C CNN
	1    9500 2050
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 6285A3D9
P 9700 2400
F 0 "#PWR?" H 9700 2150 50  0001 C CNN
F 1 "GND" H 9705 2227 50  0000 C CNN
F 2 "" H 9700 2400 50  0001 C CNN
F 3 "" H 9700 2400 50  0001 C CNN
	1    9700 2400
	1    0    0    -1  
$EndComp
Wire Wire Line
	10000 2050 10150 2050
Wire Wire Line
	9700 2050 9700 2150
Wire Wire Line
	9700 2150 10150 2150
Wire Wire Line
	9500 2050 9500 2250
Wire Wire Line
	9500 2250 10150 2250
Wire Wire Line
	9700 2400 9700 2350
Wire Wire Line
	9700 2350 10150 2350
$Comp
L Device:C C4
U 1 1 6288874B
P 9450 1300
F 0 "C4" H 9565 1346 50  0000 L CNN
F 1 ".1µF" H 9565 1255 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric" H 9488 1150 50  0001 C CNN
F 3 "~" H 9450 1300 50  0001 C CNN
	1    9450 1300
	-1   0    0    1   
$EndComp
Wire Notes Line
	11100 2650 11100 750 
Wire Notes Line
	850  750  11100 750 
Wire Notes Line
	8800 750  8800 2650
$Comp
L Switch:SW_Push SW1
U 1 1 628C1521
P 4300 6750
F 0 "SW1" V 4346 6702 50  0000 R CNN
F 1 "RESET" V 4255 6702 50  0000 R CNN
F 2 "" H 4300 6950 50  0001 C CNN
F 3 "~" H 4300 6950 50  0001 C CNN
	1    4300 6750
	0    -1   -1   0   
$EndComp
Wire Wire Line
	4300 7450 4300 6950
Text GLabel 950  6050 0    50   Output ~ 0
RESET_SW
Wire Wire Line
	950  6050 4300 6050
Wire Wire Line
	4300 6050 4300 6550
Wire Notes Line
	4600 5950 4600 7800
Wire Notes Line
	7000 5950 7000 6550
Wire Notes Line
	500  5950 7000 5950
$Comp
L power:GND #PWR?
U 1 1 6296CEB8
P 6850 7500
F 0 "#PWR?" H 6850 7250 50  0001 C CNN
F 1 "GND" H 6855 7327 50  0000 C CNN
F 2 "" H 6850 7500 50  0001 C CNN
F 3 "" H 6850 7500 50  0001 C CNN
	1    6850 7500
	1    0    0    -1  
$EndComp
Wire Wire Line
	6800 7400 6850 7400
Wire Wire Line
	6850 7400 6850 7500
$Comp
L power:VCC #PWR?
U 1 1 6297D326
P 4900 6800
F 0 "#PWR?" H 4900 6650 50  0001 C CNN
F 1 "VCC" V 4915 6927 50  0000 L CNN
F 2 "" H 4900 6800 50  0001 C CNN
F 3 "" H 4900 6800 50  0001 C CNN
	1    4900 6800
	0    -1   -1   0   
$EndComp
Wire Wire Line
	5100 6800 4900 6800
$Comp
L power:GND #PWR?
U 1 1 629865F1
P 4900 7000
F 0 "#PWR?" H 4900 6750 50  0001 C CNN
F 1 "GND" V 4905 6872 50  0000 R CNN
F 2 "" H 4900 7000 50  0001 C CNN
F 3 "" H 4900 7000 50  0001 C CNN
	1    4900 7000
	0    1    1    0   
$EndComp
Wire Wire Line
	4900 7000 5100 7000
Wire Notes Line
	3150 2950 3150 5650
Text GLabel 6850 5300 0    50   Input ~ 0
SD_DETECT
Wire Wire Line
	10500 3800 10500 3900
Wire Wire Line
	10450 3800 10500 3800
Wire Wire Line
	10450 4500 10650 4500
Text GLabel 10650 4500 2    50   Input ~ 0
RESET_SW
Wire Wire Line
	10500 3500 10600 3500
Connection ~ 10500 3500
Wire Wire Line
	10500 3600 10500 3500
Wire Wire Line
	10450 3600 10500 3600
Wire Wire Line
	10450 3500 10500 3500
$Comp
L power:+5V #PWR?
U 1 1 6271E923
P 10600 3500
F 0 "#PWR?" H 10600 3350 50  0001 C CNN
F 1 "+5V" V 10615 3628 50  0000 L CNN
F 2 "" H 10600 3500 50  0001 C CNN
F 3 "" H 10600 3500 50  0001 C CNN
	1    10600 3500
	0    1    1    0   
$EndComp
Wire Wire Line
	10500 3900 10600 3900
Connection ~ 10500 3900
Wire Wire Line
	10500 4000 10500 3900
Wire Wire Line
	10450 4000 10500 4000
Wire Wire Line
	10450 3900 10500 3900
$Comp
L power:VCC #PWR?
U 1 1 62708652
P 10600 3900
F 0 "#PWR?" H 10600 3750 50  0001 C CNN
F 1 "VCC" H 10615 4073 50  0000 C CNN
F 2 "" H 10600 3900 50  0001 C CNN
F 3 "" H 10600 3900 50  0001 C CNN
	1    10600 3900
	0    1    1    0   
$EndComp
Wire Wire Line
	8050 4300 7850 4300
Text GLabel 7850 4300 0    50   Output ~ 0
SIG_LED
Wire Wire Line
	8050 3900 7850 3900
Text GLabel 7850 3900 0    50   Output ~ 0
OV_LED
Wire Wire Line
	8050 3800 7850 3800
Text GLabel 7850 3800 0    50   Output ~ 0
UV_LED
Wire Wire Line
	8050 3600 7850 3600
Text GLabel 7850 3600 0    50   Output ~ 0
Buzzer
Wire Wire Line
	10650 4100 10450 4100
Text GLabel 10650 4400 2    50   Input ~ 0
VCell2_sense
Text GLabel 10650 4300 2    50   Input ~ 0
VCell1_sense
Wire Wire Line
	6950 3600 6950 3450
Wire Wire Line
	7300 3600 7300 3450
$Comp
L power:VCC #PWR?
U 1 1 6230D670
P 7300 3450
F 0 "#PWR?" H 7300 3300 50  0001 C CNN
F 1 "VCC" H 7315 3623 50  0000 C CNN
F 2 "" H 7300 3450 50  0001 C CNN
F 3 "" H 7300 3450 50  0001 C CNN
	1    7300 3450
	1    0    0    -1  
$EndComp
$Comp
L power:VCC #PWR?
U 1 1 6230CA89
P 6950 3450
F 0 "#PWR?" H 6950 3300 50  0001 C CNN
F 1 "VCC" H 6965 3623 50  0000 C CNN
F 2 "" H 6950 3450 50  0001 C CNN
F 3 "" H 6950 3450 50  0001 C CNN
	1    6950 3450
	1    0    0    -1  
$EndComp
Wire Wire Line
	7300 4100 8050 4100
Connection ~ 7300 4100
Wire Wire Line
	7300 3900 7300 4100
Wire Wire Line
	6900 4100 7300 4100
Wire Wire Line
	6950 4000 8050 4000
Connection ~ 6950 4000
Wire Wire Line
	6950 3900 6950 4000
Wire Wire Line
	6900 4000 6950 4000
$Comp
L Device:R_US R10
U 1 1 62309309
P 6950 3750
F 0 "R10" H 7018 3796 50  0000 L CNN
F 1 "10k" H 7018 3705 50  0000 L CNN
F 2 "Resistor_SMD:R_0603_1608Metric" V 6990 3740 50  0001 C CNN
F 3 "~" H 6950 3750 50  0001 C CNN
	1    6950 3750
	1    0    0    -1  
$EndComp
$Comp
L Device:R_US R11
U 1 1 62308EC2
P 7300 3750
F 0 "R11" H 7368 3796 50  0000 L CNN
F 1 "10k" H 7368 3705 50  0000 L CNN
F 2 "Resistor_SMD:R_0603_1608Metric" V 7340 3740 50  0001 C CNN
F 3 "~" H 7300 3750 50  0001 C CNN
	1    7300 3750
	1    0    0    -1  
$EndComp
Wire Wire Line
	10450 4400 10650 4400
Wire Wire Line
	10650 4300 10450 4300
Text GLabel 10650 4100 2    50   Input ~ 0
Vpv_sense
Wire Wire Line
	8050 3500 7850 3500
Text GLabel 7850 3500 0    50   Output ~ 0
PWM1
Wire Wire Line
	10450 3700 10600 3700
$Comp
L power:GND #PWR?
U 1 1 622F91C3
P 10600 3700
F 0 "#PWR?" H 10600 3450 50  0001 C CNN
F 1 "GND" V 10605 3572 50  0000 R CNN
F 2 "" H 10600 3700 50  0001 C CNN
F 3 "" H 10600 3700 50  0001 C CNN
	1    10600 3700
	0    -1   -1   0   
$EndComp
Wire Wire Line
	10450 4200 10600 4200
$Comp
L power:GND #PWR?
U 1 1 622F8EFA
P 10600 4200
F 0 "#PWR?" H 10600 3950 50  0001 C CNN
F 1 "GND" V 10605 4072 50  0000 R CNN
F 2 "" H 10600 4200 50  0001 C CNN
F 3 "" H 10600 4200 50  0001 C CNN
	1    10600 4200
	0    -1   -1   0   
$EndComp
Wire Wire Line
	10450 4700 10600 4700
$Comp
L power:GND #PWR?
U 1 1 622F8A32
P 10600 4700
F 0 "#PWR?" H 10600 4450 50  0001 C CNN
F 1 "GND" V 10605 4572 50  0000 R CNN
F 2 "" H 10600 4700 50  0001 C CNN
F 3 "" H 10600 4700 50  0001 C CNN
	1    10600 4700
	0    -1   -1   0   
$EndComp
Wire Wire Line
	10450 5200 10600 5200
$Comp
L power:GND #PWR?
U 1 1 622F85D0
P 10600 5200
F 0 "#PWR?" H 10600 4950 50  0001 C CNN
F 1 "GND" V 10605 5072 50  0000 R CNN
F 2 "" H 10600 5200 50  0001 C CNN
F 3 "" H 10600 5200 50  0001 C CNN
	1    10600 5200
	0    -1   -1   0   
$EndComp
Wire Wire Line
	9200 5600 9200 5750
$Comp
L power:GND #PWR?
U 1 1 622F7D54
P 9200 5750
F 0 "#PWR?" H 9200 5500 50  0001 C CNN
F 1 "GND" V 9205 5622 50  0000 R CNN
F 2 "" H 9200 5750 50  0001 C CNN
F 3 "" H 9200 5750 50  0001 C CNN
	1    9200 5750
	1    0    0    -1  
$EndComp
Wire Wire Line
	8050 5200 7900 5200
$Comp
L power:GND #PWR?
U 1 1 622F7898
P 7900 5200
F 0 "#PWR?" H 7900 4950 50  0001 C CNN
F 1 "GND" V 7905 5072 50  0000 R CNN
F 2 "" H 7900 5200 50  0001 C CNN
F 3 "" H 7900 5200 50  0001 C CNN
	1    7900 5200
	0    1    1    0   
$EndComp
Wire Wire Line
	8050 4700 7900 4700
$Comp
L power:GND #PWR?
U 1 1 622F75B3
P 7900 4700
F 0 "#PWR?" H 7900 4450 50  0001 C CNN
F 1 "GND" V 7905 4572 50  0000 R CNN
F 2 "" H 7900 4700 50  0001 C CNN
F 3 "" H 7900 4700 50  0001 C CNN
	1    7900 4700
	0    1    1    0   
$EndComp
Wire Wire Line
	8050 4200 7900 4200
$Comp
L power:GND #PWR?
U 1 1 622F72C8
P 7900 4200
F 0 "#PWR?" H 7900 3950 50  0001 C CNN
F 1 "GND" V 7905 4072 50  0000 R CNN
F 2 "" H 7900 4200 50  0001 C CNN
F 3 "" H 7900 4200 50  0001 C CNN
	1    7900 4200
	0    1    1    0   
$EndComp
Wire Wire Line
	8050 3700 7900 3700
$Comp
L power:GND #PWR?
U 1 1 622F6801
P 7900 3700
F 0 "#PWR?" H 7900 3450 50  0001 C CNN
F 1 "GND" V 7905 3572 50  0000 R CNN
F 2 "" H 7900 3700 50  0001 C CNN
F 3 "" H 7900 3700 50  0001 C CNN
	1    7900 3700
	0    1    1    0   
$EndComp
$Comp
L Device:Buzzer BZ1
U 1 1 62533947
P 3600 6750
F 0 "BZ1" H 3752 6779 50  0000 L CNN
F 1 "Buzzer" H 3752 6688 50  0000 L CNN
F 2 "Custom_MPPT:PKM13EPYH4002-B0" V 3575 6850 50  0001 C CNN
F 3 "~" V 3575 6850 50  0001 C CNN
	1    3600 6750
	1    0    0    -1  
$EndComp
$Comp
L Device:Q_NMOS_DGS Q3
U 1 1 625BCEF9
P 3400 7150
F 0 "Q3" H 3605 7196 50  0000 L CNN
F 1 "NMOS_DGS_SOT23" H 3605 7105 50  0000 L CNN
F 2 "Package_TO_SOT_SMD:SOT-23" H 3600 7250 50  0001 C CNN
F 3 "~" H 3400 7150 50  0001 C CNN
	1    3400 7150
	1    0    0    -1  
$EndComp
$Comp
L Device:R_US R6
U 1 1 625D0838
P 3500 6400
F 0 "R6" H 3568 6446 50  0000 L CNN
F 1 "2k" H 3568 6355 50  0000 L CNN
F 2 "Resistor_SMD:R_0603_1608Metric" V 3540 6390 50  0001 C CNN
F 3 "~" H 3500 6400 50  0001 C CNN
	1    3500 6400
	1    0    0    -1  
$EndComp
Wire Wire Line
	3500 7450 3500 7350
Wire Wire Line
	3500 6950 3500 6850
Wire Wire Line
	3500 6650 3500 6550
Text GLabel 3150 7150 0    50   Input ~ 0
Buzzer
Wire Wire Line
	3500 6150 3500 6250
Wire Wire Line
	2550 6150 3500 6150
$Comp
L Device:Q_NMOS_DGS Q2
U 1 1 629F99F1
P 7600 1950
F 0 "Q2" H 7805 1996 50  0000 L CNN
F 1 "NMOS_DGS_SOT23" H 7805 1905 50  0000 L CNN
F 2 "Package_TO_SOT_SMD:SOT-23" H 7800 2050 50  0001 C CNN
F 3 "~" H 7600 1950 50  0001 C CNN
	1    7600 1950
	1    0    0    -1  
$EndComp
Wire Wire Line
	7250 1950 7400 1950
$Comp
L power:GND #PWR?
U 1 1 62A0130A
P 7700 2250
F 0 "#PWR?" H 7700 2000 50  0001 C CNN
F 1 "GND" H 7705 2077 50  0000 C CNN
F 2 "" H 7700 2250 50  0001 C CNN
F 3 "" H 7700 2250 50  0001 C CNN
	1    7700 2250
	1    0    0    -1  
$EndComp
Wire Wire Line
	7700 2250 7700 2150
Text GLabel 7250 1950 0    50   Input ~ 0
PWM1
Text GLabel 7800 1650 2    50   Output ~ 0
Drive1
Text GLabel 7250 1150 0    50   Input ~ 0
QS1
$Comp
L Device:R_US R7
U 1 1 62A3D6E4
P 7700 1400
F 0 "R7" H 7768 1446 50  0000 L CNN
F 1 "1k 1W" H 7768 1355 50  0000 L CNN
F 2 "Resistor_SMD:R_1206_3216Metric" V 7740 1390 50  0001 C CNN
F 3 "~" H 7700 1400 50  0001 C CNN
	1    7700 1400
	1    0    0    -1  
$EndComp
Wire Wire Line
	7250 1150 7700 1150
Wire Wire Line
	7700 1150 7700 1250
Wire Wire Line
	7700 1550 7700 1650
Wire Wire Line
	7800 1650 7700 1650
Connection ~ 7700 1650
Wire Wire Line
	7700 1650 7700 1750
$Comp
L power:VCC #PWR?
U 1 1 62477A73
P 3800 3350
F 0 "#PWR?" H 3800 3200 50  0001 C CNN
F 1 "VCC" H 3815 3523 50  0000 C CNN
F 2 "" H 3800 3350 50  0001 C CNN
F 3 "" H 3800 3350 50  0001 C CNN
	1    3800 3350
	1    0    0    -1  
$EndComp
$Comp
L Device:R_US R16
U 1 1 624AA80C
P 5850 3900
F 0 "R16" H 5918 3946 50  0000 L CNN
F 1 "10k" H 5918 3855 50  0000 L CNN
F 2 "Resistor_SMD:R_0603_1608Metric" V 5890 3890 50  0001 C CNN
F 3 "~" H 5850 3900 50  0001 C CNN
	1    5850 3900
	1    0    0    -1  
$EndComp
$Comp
L Device:R_US R15
U 1 1 624AA806
P 5600 3900
F 0 "R15" H 5668 3946 50  0000 L CNN
F 1 "10k" H 5668 3855 50  0000 L CNN
F 2 "Resistor_SMD:R_0603_1608Metric" V 5640 3890 50  0001 C CNN
F 3 "~" H 5600 3900 50  0001 C CNN
	1    5600 3900
	1    0    0    -1  
$EndComp
$Comp
L Device:R_US R14
U 1 1 62496EB2
P 5350 3900
F 0 "R14" H 5418 3946 50  0000 L CNN
F 1 "10k" H 5418 3855 50  0000 L CNN
F 2 "Resistor_SMD:R_0603_1608Metric" V 5390 3890 50  0001 C CNN
F 3 "~" H 5350 3900 50  0001 C CNN
	1    5350 3900
	1    0    0    -1  
$EndComp
$Comp
L Device:R_US R13
U 1 1 62496EAC
P 5100 3900
F 0 "R13" H 5168 3946 50  0000 L CNN
F 1 "10k" H 5168 3855 50  0000 L CNN
F 2 "Resistor_SMD:R_0603_1608Metric" V 5140 3890 50  0001 C CNN
F 3 "~" H 5100 3900 50  0001 C CNN
	1    5100 3900
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 624815E6
P 3800 3650
F 0 "#PWR?" H 3800 3400 50  0001 C CNN
F 1 "GND" H 3805 3477 50  0000 C CNN
F 2 "" H 3800 3650 50  0001 C CNN
F 3 "" H 3800 3650 50  0001 C CNN
	1    3800 3650
	1    0    0    -1  
$EndComp
$Comp
L Device:C C10
U 1 1 6245B053
P 3800 3500
F 0 "C10" H 3915 3546 50  0000 L CNN
F 1 ".1µF" H 3915 3455 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric" H 3838 3350 50  0001 C CNN
F 3 "~" H 3800 3500 50  0001 C CNN
	1    3800 3500
	-1   0    0    1   
$EndComp
$Comp
L Power_Management:INA3221 U2
U 1 1 623213A3
P 4550 4450
F 0 "U2" H 4550 5331 50  0000 L CNN
F 1 "INA3221" H 4550 5240 50  0000 L CNN
F 2 "Package_DFN_QFN:Texas_RGV_S-PVQFN-N16_EP2.1x2.1mm" H 4550 5550 50  0001 C CNN
F 3 "http://www.ti.com/lit/ds/symlink/ina3221.pdf" H 4550 5150 50  0001 C CNN
	1    4550 4450
	1    0    0    -1  
$EndComp
$Comp
L power:VCC #PWR?
U 1 1 6244F173
P 4450 3600
F 0 "#PWR?" H 4450 3450 50  0001 C CNN
F 1 "VCC" H 4465 3773 50  0000 C CNN
F 2 "" H 4450 3600 50  0001 C CNN
F 3 "" H 4450 3600 50  0001 C CNN
	1    4450 3600
	1    0    0    -1  
$EndComp
Wire Wire Line
	4450 3750 4450 3600
Wire Wire Line
	5300 4550 5050 4550
Wire Wire Line
	5300 4650 5050 4650
Text GLabel 5300 4550 2    50   BiDi ~ 0
I2C0_SDA
Text GLabel 5300 4650 2    50   Input ~ 0
I2C0_SCL
Connection ~ 4650 5150
Wire Wire Line
	5150 5150 4650 5150
Wire Wire Line
	5150 4750 5150 5150
Wire Wire Line
	5050 4750 5150 4750
Wire Wire Line
	4550 5150 4650 5150
Connection ~ 4550 5150
Wire Wire Line
	4550 5200 4550 5150
Wire Wire Line
	4650 5150 4650 5050
Wire Wire Line
	4450 5150 4550 5150
Wire Wire Line
	4450 5050 4450 5150
$Comp
L power:GND #PWR?
U 1 1 623F19EE
P 4550 5200
F 0 "#PWR?" H 4550 4950 50  0001 C CNN
F 1 "GND" H 4555 5027 50  0000 C CNN
F 2 "" H 4550 5200 50  0001 C CNN
F 3 "" H 4550 5200 50  0001 C CNN
	1    4550 5200
	1    0    0    -1  
$EndComp
Wire Wire Line
	4050 4750 3850 4750
Wire Wire Line
	4050 4650 3850 4650
Wire Wire Line
	4050 4450 3850 4450
Wire Wire Line
	4050 4350 3850 4350
Wire Wire Line
	4050 4150 3850 4150
Wire Wire Line
	4050 4050 3850 4050
Text GLabel 3850 4450 0    50   Input ~ 0
batt_out-
Text GLabel 3850 4350 0    50   Input ~ 0
Batt_out+
Text GLabel 3850 4750 0    50   Input ~ 0
Shunt_PV-
Text GLabel 3850 4650 0    50   Input ~ 0
Shunt_PV+
Text GLabel 3850 4150 0    50   Input ~ 0
batt_in-
Text GLabel 3850 4050 0    50   Input ~ 0
Batt_in+
Text GLabel 6900 4000 0    50   BiDi ~ 0
I2C0_SDA
Text GLabel 6900 4100 0    50   Output ~ 0
I2C0_SCL
$Comp
L power:VCC #PWR?
U 1 1 624E1432
P 5600 3600
F 0 "#PWR?" H 5600 3450 50  0001 C CNN
F 1 "VCC" H 5615 3773 50  0000 C CNN
F 2 "" H 5600 3600 50  0001 C CNN
F 3 "" H 5600 3600 50  0001 C CNN
	1    5600 3600
	1    0    0    -1  
$EndComp
Wire Wire Line
	5600 3750 5600 3700
Wire Wire Line
	5350 3750 5350 3700
Wire Wire Line
	5350 3700 5600 3700
Connection ~ 5600 3700
Wire Wire Line
	5600 3700 5600 3600
Wire Wire Line
	5850 3750 5850 3700
Wire Wire Line
	5850 3700 5600 3700
Wire Wire Line
	5050 4050 5100 4050
Wire Wire Line
	5050 4350 5850 4350
Wire Wire Line
	5050 4250 5600 4250
Wire Wire Line
	4650 3750 4650 3700
Wire Wire Line
	4650 3700 5100 3700
Wire Wire Line
	5100 3700 5100 3750
Wire Wire Line
	5350 4050 5350 4150
Wire Wire Line
	5350 4150 5050 4150
Wire Wire Line
	5600 4050 5600 4250
Wire Wire Line
	5850 4050 5850 4350
Wire Wire Line
	5900 4150 5350 4150
Connection ~ 5350 4150
Wire Wire Line
	5900 4250 5600 4250
Connection ~ 5600 4250
Wire Wire Line
	5900 4350 5850 4350
Connection ~ 5850 4350
Text GLabel 5900 4150 2    50   Output ~ 0
CRITICAL
Text GLabel 5900 4250 2    50   Output ~ 0
WARNING
Text GLabel 5900 4350 2    50   Output ~ 0
TC
Wire Notes Line
	850  2650 11100 2650
Text Notes 4100 2900 0    100  ~ 20
Current sensor
Text GLabel 7850 4600 0    50   Input ~ 0
CRITICAL
Text GLabel 7850 4500 0    50   Input ~ 0
WARNING
Text GLabel 7850 4400 0    50   Input ~ 0
TC
Wire Wire Line
	8050 4400 7850 4400
Wire Wire Line
	8050 4500 7850 4500
Wire Wire Line
	8050 4600 7850 4600
Text GLabel 7850 4800 0    50   Output ~ 0
SPI_SCK
Text GLabel 7850 4900 0    50   Output ~ 0
SPI_MOSI
Text GLabel 7850 5000 0    50   Input ~ 0
SPI_MISO
Text GLabel 7850 5100 0    50   Output ~ 0
SPI_CS
Wire Wire Line
	7850 4800 8050 4800
Wire Wire Line
	8050 4900 7850 4900
Wire Wire Line
	8050 5000 7850 5000
Wire Wire Line
	8050 5100 7850 5100
Wire Notes Line
	6350 2950 6350 5650
Wire Notes Line
	500  2950 11200 2950
Wire Notes Line
	7350 5650 7350 6500
Wire Notes Line
	500  5650 7350 5650
Text GLabel 5100 6900 0    50   Input ~ 0
SPI_SCK
Text GLabel 5100 6600 0    50   Input ~ 0
SPI_CS
NoConn ~ 5100 6500
NoConn ~ 5100 7200
Text GLabel 5100 6700 0    50   Input ~ 0
SPI_MOSI
Text GLabel 5100 7100 0    50   Output ~ 0
SPI_MISO
Text GLabel 5100 7300 0    50   Output ~ 0
SD_DETECT
$Comp
L power:GND #PWR?
U 1 1 628E5877
P 4700 6350
F 0 "#PWR?" H 4700 6100 50  0001 C CNN
F 1 "GND" H 4705 6177 50  0000 C CNN
F 2 "" H 4700 6350 50  0001 C CNN
F 3 "" H 4700 6350 50  0001 C CNN
	1    4700 6350
	1    0    0    -1  
$EndComp
$Comp
L power:VCC #PWR?
U 1 1 628E5871
P 5100 6250
F 0 "#PWR?" H 5100 6100 50  0001 C CNN
F 1 "VCC" H 5115 6423 50  0000 C CNN
F 2 "" H 5100 6250 50  0001 C CNN
F 3 "" H 5100 6250 50  0001 C CNN
	1    5100 6250
	1    0    0    -1  
$EndComp
$Comp
L Connector:Micro_SD_Card_Det_Hirose_DM3AT J4
U 1 1 629256A5
P 6000 6900
F 0 "J4" H 5950 7717 50  0000 C CNN
F 1 "Micro_SD_Card_Det_Hirose_DM3AT" H 5950 7626 50  0000 C CNN
F 2 "Custom_MPPT:DM3ATSFPEJM5" H 8050 7600 50  0001 C CNN
F 3 "https://www.hirose.com/product/en/download_file/key_name/DM3/category/Catalog/doc_file_id/49662/?file_category_id=4&item_id=195&is_series=1" H 6000 7000 50  0001 C CNN
	1    6000 6900
	1    0    0    -1  
$EndComp
$Comp
L Device:C C11
U 1 1 6297C430
P 4900 6300
F 0 "C11" V 4648 6300 50  0000 C CNN
F 1 ".1µF" V 4739 6300 50  0000 C CNN
F 2 "Capacitor_SMD:C_0603_1608Metric" H 4938 6150 50  0001 C CNN
F 3 "~" H 4900 6300 50  0001 C CNN
	1    4900 6300
	0    1    1    0   
$EndComp
Wire Wire Line
	4700 6350 4700 6300
Wire Wire Line
	4700 6300 4750 6300
Wire Wire Line
	5050 6300 5100 6300
Wire Wire Line
	5100 6300 5100 6250
$Comp
L Device:R_US R12
U 1 1 62A3F116
P 6950 5050
F 0 "R12" H 7018 5096 50  0000 L CNN
F 1 "10k" H 7018 5005 50  0000 L CNN
F 2 "Resistor_SMD:R_0603_1608Metric" V 6990 5040 50  0001 C CNN
F 3 "~" H 6950 5050 50  0001 C CNN
	1    6950 5050
	1    0    0    -1  
$EndComp
Wire Wire Line
	6950 4900 6950 4750
$Comp
L power:VCC #PWR?
U 1 1 62AA6FD9
P 6950 4750
F 0 "#PWR?" H 6950 4600 50  0001 C CNN
F 1 "VCC" H 6965 4923 50  0000 C CNN
F 2 "" H 6950 4750 50  0001 C CNN
F 3 "" H 6950 4750 50  0001 C CNN
	1    6950 4750
	1    0    0    -1  
$EndComp
Wire Wire Line
	6850 5300 6950 5300
Wire Wire Line
	6950 5300 6950 5200
Wire Wire Line
	6950 5300 8050 5300
Connection ~ 6950 5300
$Comp
L power:GND #PWR?
U 1 1 62AE9D8F
P 5050 7500
F 0 "#PWR?" H 5050 7250 50  0001 C CNN
F 1 "GND" H 5055 7327 50  0000 C CNN
F 2 "" H 5050 7500 50  0001 C CNN
F 3 "" H 5050 7500 50  0001 C CNN
	1    5050 7500
	1    0    0    -1  
$EndComp
Wire Wire Line
	5050 7500 5050 7400
Wire Wire Line
	5050 7400 5100 7400
NoConn ~ 9100 5600
NoConn ~ 9300 5600
Text GLabel 10650 4800 2    50   BiDi ~ 0
GP21
Text GLabel 10650 4900 2    50   BiDi ~ 0
GP20
Text GLabel 10650 5000 2    50   BiDi ~ 0
GP19
Text GLabel 10650 5100 2    50   BiDi ~ 0
GP18
Text GLabel 10650 5300 2    50   BiDi ~ 0
GP17
Text GLabel 10650 5400 2    50   BiDi ~ 0
GP16
Text GLabel 7850 5400 0    50   BiDi ~ 0
GP15
Wire Wire Line
	10000 6350 10150 6350
Wire Wire Line
	10000 6250 10150 6250
Wire Wire Line
	10000 6150 10150 6150
Wire Wire Line
	10000 6050 10150 6050
Wire Wire Line
	10000 5950 10150 5950
Wire Wire Line
	10000 5850 10150 5850
Wire Wire Line
	10000 5750 10150 5750
$Comp
L Connector:Conn_01x07_Female J5
U 1 1 62BD2963
P 10350 6050
F 0 "J5" H 10378 6076 50  0000 L CNN
F 1 "GPIO breakout" H 10378 5985 50  0000 L CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x07_P2.54mm_Vertical" H 10350 6050 50  0001 C CNN
F 3 "~" H 10350 6050 50  0001 C CNN
	1    10350 6050
	1    0    0    -1  
$EndComp
Text GLabel 10000 6350 0    50   BiDi ~ 0
GP15
Text GLabel 10000 6250 0    50   BiDi ~ 0
GP16
Text GLabel 10000 6150 0    50   BiDi ~ 0
GP17
Text GLabel 10000 6050 0    50   BiDi ~ 0
GP18
Text GLabel 10000 5950 0    50   BiDi ~ 0
GP19
Text GLabel 10000 5850 0    50   BiDi ~ 0
GP20
Text GLabel 10000 5750 0    50   BiDi ~ 0
GP21
$Comp
L Custom_MPPT:RaspiPico U1
U 1 1 622F4745
P 8150 3450
F 0 "U1" H 9250 3615 50  0000 C CNN
F 1 "RaspiPico" H 9250 3524 50  0000 C CNN
F 2 "Custom_MPPT:RaspiPico" H 8200 3500 50  0001 C CNN
F 3 "" H 8200 3500 50  0001 C CNN
	1    8150 3450
	1    0    0    -1  
$EndComp
Wire Wire Line
	10450 4800 10650 4800
Wire Wire Line
	10650 4900 10450 4900
Wire Wire Line
	10450 5000 10650 5000
Wire Wire Line
	10650 5100 10450 5100
Wire Wire Line
	10450 5300 10650 5300
Wire Wire Line
	10650 5400 10450 5400
Wire Wire Line
	7850 5400 8050 5400
$Comp
L Device:R_US R24
U 1 1 62CD965F
P 2250 3900
F 0 "R24" V 2045 3900 50  0000 C CNN
F 1 "5" V 2136 3900 50  0000 C CNN
F 2 "Resistor_SMD:R_0603_1608Metric" V 2290 3890 50  0001 C CNN
F 3 "~" H 2250 3900 50  0001 C CNN
	1    2250 3900
	0    1    1    0   
$EndComp
$Comp
L Device:R_US R25
U 1 1 62CDA8DB
P 2250 4200
F 0 "R25" V 2045 4200 50  0000 C CNN
F 1 "5" V 2136 4200 50  0000 C CNN
F 2 "Resistor_SMD:R_0603_1608Metric" V 2290 4190 50  0001 C CNN
F 3 "~" H 2250 4200 50  0001 C CNN
	1    2250 4200
	0    1    1    0   
$EndComp
$Comp
L Device:C C22
U 1 1 62CEA140
P 2650 4050
F 0 "C22" H 2765 4096 50  0000 L CNN
F 1 ".1µF" H 2765 4005 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric" H 2688 3900 50  0001 C CNN
F 3 "~" H 2650 4050 50  0001 C CNN
	1    2650 4050
	-1   0    0    1   
$EndComp
Wire Wire Line
	2000 4200 2100 4200
$Comp
L Device:R_US R22
U 1 1 62DBDC5D
P 2250 3300
F 0 "R22" V 2045 3300 50  0000 C CNN
F 1 "5" V 2136 3300 50  0000 C CNN
F 2 "Resistor_SMD:R_0603_1608Metric" V 2290 3290 50  0001 C CNN
F 3 "~" H 2250 3300 50  0001 C CNN
	1    2250 3300
	0    1    1    0   
$EndComp
$Comp
L Device:R_US R23
U 1 1 62DBDC63
P 2250 3600
F 0 "R23" V 2045 3600 50  0000 C CNN
F 1 "5" V 2136 3600 50  0000 C CNN
F 2 "Resistor_SMD:R_0603_1608Metric" V 2290 3590 50  0001 C CNN
F 3 "~" H 2250 3600 50  0001 C CNN
	1    2250 3600
	0    1    1    0   
$EndComp
$Comp
L Device:R_Shunt_US R27
U 1 1 62515109
P 1600 3600
F 0 "R27" H 1512 3646 50  0000 R CNN
F 1 "100m+/-1% 1W" H 1512 3555 50  0000 R CNN
F 2 "Resistor_SMD:R_1206_3216Metric" V 1530 3600 50  0001 C CNN
F 3 "~" H 1600 3600 50  0001 C CNN
	1    1600 3600
	1    0    0    -1  
$EndComp
$Comp
L Device:C C21
U 1 1 62E1B00F
P 2650 3450
F 0 "C21" H 2765 3496 50  0000 L CNN
F 1 ".1µF" H 2765 3405 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric" H 2688 3300 50  0001 C CNN
F 3 "~" H 2650 3450 50  0001 C CNN
	1    2650 3450
	-1   0    0    1   
$EndComp
Wire Wire Line
	2100 3600 2000 3600
Wire Wire Line
	2000 3600 2000 3700
Wire Wire Line
	2000 3700 1750 3700
Wire Wire Line
	1750 3500 1900 3500
Wire Wire Line
	1900 3500 1900 3300
Wire Wire Line
	1900 3300 2100 3300
Wire Wire Line
	2700 3300 2650 3300
Wire Wire Line
	1600 3400 1600 3100
$Comp
L Device:R_US R20
U 1 1 62F58F8F
P 2550 1900
F 0 "R20" V 2345 1900 50  0000 C CNN
F 1 "5" V 2436 1900 50  0000 C CNN
F 2 "Resistor_SMD:R_0603_1608Metric" V 2590 1890 50  0001 C CNN
F 3 "~" H 2550 1900 50  0001 C CNN
	1    2550 1900
	0    1    1    0   
$EndComp
$Comp
L Device:R_US R21
U 1 1 62F58F95
P 2550 2200
F 0 "R21" V 2345 2200 50  0000 C CNN
F 1 "5" V 2436 2200 50  0000 C CNN
F 2 "Resistor_SMD:R_0603_1608Metric" V 2590 2190 50  0001 C CNN
F 3 "~" H 2550 2200 50  0001 C CNN
	1    2550 2200
	0    1    1    0   
$EndComp
$Comp
L Device:C C20
U 1 1 62F58F9B
P 2950 2050
F 0 "C20" H 3065 2096 50  0000 L CNN
F 1 ".1µF" H 3065 2005 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric" H 2988 1900 50  0001 C CNN
F 3 "~" H 2950 2050 50  0001 C CNN
	1    2950 2050
	-1   0    0    1   
$EndComp
Wire Wire Line
	1900 1650 1900 1700
Wire Wire Line
	2350 2250 2350 2200
Wire Wire Line
	2350 2200 2400 2200
Wire Wire Line
	2150 2250 2150 1900
Wire Wire Line
	2150 1900 2400 1900
Wire Wire Line
	1900 1700 2000 1700
Connection ~ 1900 1700
Wire Wire Line
	1900 1700 1900 1750
Wire Wire Line
	3000 1300 3550 1300
Connection ~ 3550 1300
Wire Wire Line
	4150 1300 4300 1300
Connection ~ 4300 1300
Wire Wire Line
	3550 1300 3750 1300
Wire Wire Line
	2450 2400 4300 2400
Wire Wire Line
	2050 2400 1500 2400
Connection ~ 1500 2400
Wire Wire Line
	2550 7450 3500 7450
Connection ~ 3500 7450
Wire Wire Line
	3500 7450 4300 7450
Wire Wire Line
	3150 7150 3200 7150
Wire Wire Line
	2700 2200 2950 2200
Wire Wire Line
	2700 1900 2950 1900
Connection ~ 2950 1900
Wire Wire Line
	2950 1900 3000 1900
Connection ~ 2950 2200
Wire Wire Line
	2950 2200 3000 2200
Connection ~ 2650 3900
Wire Wire Line
	2650 3900 2700 3900
Connection ~ 2650 4200
Wire Wire Line
	2650 4200 2700 4200
Wire Wire Line
	2400 4200 2650 4200
Wire Wire Line
	2400 3900 2650 3900
Connection ~ 2650 3300
Connection ~ 2650 3600
Wire Wire Line
	2650 3600 2700 3600
Wire Wire Line
	2400 3600 2650 3600
Wire Wire Line
	2400 3300 2650 3300
$EndSCHEMATC

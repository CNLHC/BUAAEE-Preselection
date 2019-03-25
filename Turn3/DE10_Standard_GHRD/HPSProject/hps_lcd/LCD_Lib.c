// ============================================================================
// Copyright (c) 2013 by Terasic Technologies Inc.
// ============================================================================
//
// Permission:
//
//   Terasic grants permission to use and modify this code for use
//   in synthesis for all Terasic Development Boards and Altera Development 
//   Kits made by Terasic.  Other use of this code, including the selling 
//   ,duplication, or modification of any portion is strictly prohibited.
//
// Disclaimer:
//
//   This VHDL/Verilog or C/C++ source code is intended as a design reference
//   which illustrates how these types of functions can be implemented.
//   It is the user's responsibility to verify their design for
//   consistency and functionality through the use of formal
//   verification methods.  Terasic provides no warranty regarding the use 
//   or functionality of this code.
//
// ============================================================================
//           
//  Terasic Technologies Inc
//  9F., No.176, Sec.2, Gongdao 5th Rd, East Dist, Hsinchu City, 30070. Taiwan
//  
//  
//                     web: http://www.terasic.com/  
//                     email: support@terasic.com
//
// ============================================================================



#include "LCD_Lib.h"
#include "LCD_Driver.h"


void LCD_Init(void){
    
  //  Display_Reset();
  
    
    // (3) ADC select: Normal display (ADC command D0 = “L”)
   // Display_SetADC(true); // normal

   
    // Common output state selection (~normal)
    LCDDrv_SetOuputStatusSelect(false); // invert to match mechanisum
    
    // (6) LCD Bias (true:default)
  //  Display_SetBias(true);//    
    
    // (4 ?) Power control register (D2, D1, D0) = (follower, regulator, booster) = (1, 1, 1)
    LCDDrv_SetPowerControl(0x07);

    // Setting the build-in resistance radio
   // Display_SetResistorRatio(4);
    
    // Electronic volume control (adjust brightnesss: 0x01~0x3F, 0x20:disable)
    //  Display_SetElectricVolume(0x20);
    //Display_SetOsc(true);
    
    // delay 
    //usleep(5u);
    
    // (9) set display start line: at first line
    LCDDrv_SetStartLine(0);

    
    // (11) Page address register set at page 0
    LCDDrv_SetPageAddr(0);
    // (10) Column address counter set at address 0
    LCDDrv_SetColAddr(0);
    
    // Display on
    LCDDrv_Display(true);
}


void LCD_SetStartAddr(uint8_t x, uint8_t y){
    LCDDrv_SetPageAddr(y/8);
    LCDDrv_SetColAddr(x);
}



void LCD_Clear(void){
    int Page, i;
    for(Page=0;Page<8;Page++){
        LCDDrv_SetPageAddr(Page);
        LCDDrv_SetColAddr(0);
        for(i=0;i<132;i++){
            LCDDrv_WriteData(0x00);
        }    
    }
}




void LCD_FrameCopy(uint8_t *Data){
		int Page;
		
		uint8_t *pPageData = Data;
    for(Page=0;Page<8;Page++){
        LCD_SetStartAddr(0, Page*8);
        LCDDrv_WriteMultiData(pPageData, 128);
        pPageData += 128;
    }   	
}
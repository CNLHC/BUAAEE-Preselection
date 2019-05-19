#include "AD7606Driver.h"
#include "AD9910Driver.h"
#include "FTD2xxBitMode.h"
#include "ftd2xx.h"
#include "ftd4232driver.h"
#include <DAC8563Driver.h>
#include <chrono>
#include <libMPSSE_spi.h>
#include <math.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <thread>

auto CheckStatus = [](FT_STATUS ft, const char *s) {
  if (ft == FT_OK)
    return;
  else
    printf("FTStatus Chck Error: %s", s);
};

int main() {
  Init_libMPSSE();
  FTD4232driver tFTD;
  tFTD.listAllDevices();
  //  tFTD.listSPIDevices();
  FT_HANDLE spiHandle;
  FT_HANDLE GPIOHandle;
  FT_HANDLE UartHandle;

  FT_STATUS ftStatus;

  ftStatus = FT_Open(3, &GPIOHandle);
  CheckStatus(ftStatus, "GPIO Port Open");
  ftStatus = FT_Open(1, &UartHandle);
  CheckStatus(ftStatus, "Uart Port Open");
  FT_SetBaudRate(UartHandle,115200);
  FT_SetDataCharacteristics(UartHandle,FT_BITS_8,FT_STOP_BITS_1,FT_PARITY_NONE);


  ftStatus = SPI_OpenChannel(0, &spiHandle);
  CheckStatus(ftStatus, "SPI Port Open");

  ftStatus = FT_SetBitMode(GPIOHandle, 0xff, FT_BITMODE_ASYNC_BITBANG);
  CheckStatus(ftStatus, "GPIO Init");

  ChannelConfig spiConf;
  spiConf.ClockRate = 150000;
  spiConf.configOptions = SPI_CONFIG_OPTION_MODE2 | SPI_CONFIG_OPTION_CS_DBUS5 |
                          SPI_CONFIG_OPTION_CS_ACTIVELOW;
  spiConf.LatencyTimer = 0;
  spiConf.Pin = 0;
  ftStatus = SPI_InitChannel(spiHandle, &spiConf);
  CheckStatus(ftStatus, "SPI Init");

  auto h9910 =
      AD9910Driver(spiHandle, GPIOHandle, 4,
                   SPI_CONFIG_OPTION_MODE0 | SPI_CONFIG_OPTION_CS_DBUS3 |
                       SPI_CONFIG_OPTION_CS_ACTIVELOW);
  auto h7606 =
      AD7606Driver(spiHandle, GPIOHandle,
                   SPI_CONFIG_OPTION_MODE0 | SPI_CONFIG_OPTION_CS_DBUS4 |
                       SPI_CONFIG_OPTION_CS_ACTIVELOW,
                   6, 7);
  auto h8563 =
      DAC8563Driver(spiHandle, GPIOHandle,
                    SPI_CONFIG_OPTION_MODE2 | SPI_CONFIG_OPTION_CS_DBUS5 |
                        SPI_CONFIG_OPTION_CS_ACTIVELOW);

//  auto a = h7606.ReadAllChannels();
//  for (auto &i :a)
//    printf("%d\n", i);
//  h8563.Init();
//  while(1){
//    h8563.setDualChannelValue(4.33);
//  }

//  h9910.Init();
//  h9910.setSingleTuneOutput(0x3FFF,12345678);

  uint8 buffer[1000];
  float voltage;
  uint16  data;
  for(int i=0;i<500;++i){
    voltage=i*20.0/500.0-10.0;
    data = (unsigned)((voltage+10.0)*0xffff/20.0);
    buffer[2*i]=(uint8)(data>>8);
    buffer[2*i+1]=(uint8)data;
  }
  uint32 dummy;
  while(1){
    FT_Write(UartHandle,buffer,1000,&dummy);
    std::this_thread::sleep_for(std::chrono::milliseconds(1000));
  }






}

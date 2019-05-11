/*
        Simple example to open a maximum of 4 devices - write some data then
   read it back. Shows one method of using list devices also. Assumes the
   devices have a loopback connector on them and they also have a serial number

        To build use the following gcc statement
        (assuming you have the d2xx library in the /usr/local/lib directory).
        gcc -o simple main.c -L. -lftd2xx -Wl,-rpath /usr/local/lib
*/

#include "AD9910Driver.h"
#include "ftd2xx.h"
#include "ftd4232driver.h"
#include <chrono>
#include <libMPSSE_spi.h>
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
  //  tFTD.listAllDevices();
  //  tFTD.listSPIDevices();
  FT_HANDLE spiHandle;
  FT_HANDLE GPIOHandle;
  FT_STATUS ftStatus;
  ftStatus = FT_Open(1, &GPIOHandle);
  CheckStatus(ftStatus, "GPIO Port Open");
  ftStatus = SPI_OpenChannel(0, &spiHandle);
  CheckStatus(ftStatus, "SPI Port Open");

  ftStatus = FT_SetBitMode(GPIOHandle, 0xff, FT_BITMODE_SYNC_BITBANG);
  CheckStatus(ftStatus, "GPIO Init");

  ChannelConfig spiConf;
  spiConf.ClockRate = 50000;
  spiConf.configOptions = SPI_CONFIG_OPTION_MODE0 | SPI_CONFIG_OPTION_CS_DBUS3 |
                          SPI_CONFIG_OPTION_CS_ACTIVELOW;
  spiConf.LatencyTimer = 2;
  spiConf.Pin = 0;
  ftStatus = SPI_InitChannel(spiHandle, &spiConf);
  CheckStatus(ftStatus, "SPI Init");

  auto h9910 = AD9910Driver(spiHandle, GPIOHandle);

  uint8 test[4] = {0, 0x40, 0x00, 0x02};
  h9910.WriteRegister(0x00, 4, test);

  uint8 test3[4] = {0x05, 0x0f, 0x41, 0x32};
  h9910.WriteRegister(0x02, 4, test3);

  uint8 test4[8] = {0x3f, 0xff, 0xff, 0x00, 0x0a, 0x3d, 0x70, 0xa4};
  h9910.WriteRegister(0x0e, 8, test4);

  uint8 db[4];
  h9910.ReadRegister(0x02, 4, db);
  for (auto &i : db)
    printf("0x%x\n", i);
}

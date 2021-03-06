//
// Created by cn on 2019/5/11.
//

#include "AD9910Driver.h"
#include "libMPSSE_spi.h"
#include <chrono>
#include <thread>

bool AD9910Driver::WriteRegister(uint8 address, uint8 length, uint8 *data) {
  SPI_ChangeCS(mSPIHandle,mMPSSEConfig);
  uint8 ad9910cmd = address & 0b01111111;
  uint32 writternCb;
  SPI_Write(mSPIHandle, &ad9910cmd, 1, &writternCb,
            SPI_TRANSFER_OPTIONS_CHIPSELECT_ENABLE |
                SPI_TRANSFER_OPTIONS_SIZE_IN_BYTES);

  SPI_Write(mSPIHandle, data, length, &writternCb,
            SPI_TRANSFER_OPTIONS_SIZE_IN_BYTES |
                SPI_TRANSFER_OPTIONS_CHIPSELECT_DISABLE);

  std::this_thread::sleep_for(std::chrono::milliseconds(1));
  pIOUReset();
  std::this_thread::sleep_for(std::chrono::milliseconds(1));
  pIOUSet();
  std::this_thread::sleep_for(std::chrono::milliseconds(1));
  pIOUReset();
  return TRUE;
}

bool AD9910Driver::ReadRegister(uint8 address, uint8 length, uint8 *buf) {
  SPI_ChangeCS(mSPIHandle,mMPSSEConfig);
  uint8 ad9910cmd = address | 0b10000000;
  uint32 writternCb;
  SPI_Write(mSPIHandle, &ad9910cmd, 1, &writternCb,
            SPI_TRANSFER_OPTIONS_CHIPSELECT_ENABLE |
                SPI_TRANSFER_OPTIONS_SIZE_IN_BYTES);
  SPI_Read(mSPIHandle, buf, length, &writternCb,
           SPI_TRANSFER_OPTIONS_SIZE_IN_BYTES |
               SPI_TRANSFER_OPTIONS_CHIPSELECT_DISABLE);
}

AD9910Driver::AD9910Driver(FT_HANDLE SPIHandle, FT_HANDLE GPIOHandle,
                           uint8 UpdatePinNum, uint32 MPSSEConfig)
    : mSPIHandle(SPIHandle), mGPIOHandle(GPIOHandle),
      mIOUpdatePinNo(UpdatePinNum), mMPSSEConfig(MPSSEConfig) {}

void AD9910Driver::pIOUReset() {
  mBitMode.BitReset(mGPIOHandle,mIOUpdatePinNo);
}

void AD9910Driver::pIOUSet() {
  mBitMode.BitSet(mGPIOHandle,mIOUpdatePinNo);
}

void AD9910Driver::Init() {
  //Set CFR1
  uint8 test[4] = {0, 0x40, 0x00, 0x02};
  WriteRegister(0x00, 4, test);

  //Set CFR2
  uint8 test5[4] = {0x01, 0x40, 0x08, 0x20};
  WriteRegister(0x01, 4, test5);

  //Set CFR3
  uint8 test3[4] = {0x05, 0x0f, 0x41, 0x32};
  WriteRegister(0x02, 4, test3);

  //Set DAC
  uint8 test6[4] = {0x00, 0x00, 0x00, 0xff};
  WriteRegister(0x03, 4, test6);

//  For Test
//  uint8 db[4];
//  ReadRegister(0x02, 4, db);
//  for (auto &i : db)
//    printf("0x%x\n", i);
}

void AD9910Driver::setSingleTuneOutput(uint16 amp, double Freq) {

  uint32 FTW=(uint64)Freq*4294967296/1000000000;
  uint8 profile[8] = {0x00, 0x00, 0x00, 0x00, 0x0a, 0x3d, 0x70, 0xa4};

  profile[0] = 0x00| (uint8)((uint16)amp>>8);
  profile[1] = (uint8)(amp);


  profile[4] = (uint8)(FTW>>24);
  profile[5] = (uint8)(FTW>>16);
  profile[6] = (uint8)(FTW>>8);
  profile[7] = (uint8)(FTW);

  WriteRegister(0x0e, 8,profile);

}


void AD9910Driver::linearFreqSweep(double Start, double Stop, double seconds) {
    if(Stop<Start)
        return;
    uint64  tTimeStep = (seconds*1000000)/100.0;
    double tFreqStep = (Stop-Start)/100.0;
    for(int i=0;i<=100;i++){
        setSingleTuneOutput(0x3FFF,Start+tFreqStep*i);
        std::this_thread::sleep_for(std::chrono::microseconds(tTimeStep));
    }
}


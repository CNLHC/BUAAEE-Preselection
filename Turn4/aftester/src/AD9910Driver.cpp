//
// Created by cn on 2019/5/11.
//

#include "AD9910Driver.h"
#include "libMPSSE_spi.h"
#include <chrono>
#include <thread>

bool AD9910Driver::WriteRegister(uint8 address, uint8 length, uint8 *data) {
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

  uint8 ad9910cmd = address | 0b10000000;
  uint32 writternCb;
  SPI_Write(mSPIHandle, &ad9910cmd, 1, &writternCb,
            SPI_TRANSFER_OPTIONS_CHIPSELECT_ENABLE |
                SPI_TRANSFER_OPTIONS_SIZE_IN_BYTES);
  SPI_Read(mSPIHandle, buf, length, &writternCb,
           SPI_TRANSFER_OPTIONS_SIZE_IN_BYTES |
               SPI_TRANSFER_OPTIONS_CHIPSELECT_DISABLE);
}

AD9910Driver::AD9910Driver(FT_HANDLE SPIHandle, FT_HANDLE GPIOHandle)
    : mSPIHandle(SPIHandle), mGPIOHandle(GPIOHandle), mIOUpdateSet(0xff),
      mIOUpdateReSet(0x00) {}

void AD9910Driver::pIOUReset() {
  uint32 dummy;
  FT_Write(mGPIOHandle, &mIOUpdateReSet, 1, &dummy);
}
void AD9910Driver::pIOUSet() {
  uint32 dummy;
  FT_Write(mGPIOHandle, &mIOUpdateSet, 1, &dummy);
}

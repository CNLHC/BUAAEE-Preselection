//
// Created by cn on 2019/5/11.
//

#ifndef AFTESTER_SRC_AD9910DRIVER_H_
#define AFTESTER_SRC_AD9910DRIVER_H_
#include "libMPSSE_spi.h"

class AD9910Driver {

public:
  AD9910Driver(FT_HANDLE SPIHandle, FT_HANDLE GPIOHandle);
  bool WriteRegister(uint8 address, uint8 length, uint8 *data);
  bool ReadRegister(uint8 address, uint8 length, uint8 *buf);

private:
  void pIOUSet();
  void pIOUReset();

  FT_HANDLE mSPIHandle;
  FT_HANDLE mGPIOHandle;
  uint8 mIOUpdateSet;
  uint8 mIOUpdateReSet;
};

#endif // AFTESTER_SRC_AD9910DRIVER_H_

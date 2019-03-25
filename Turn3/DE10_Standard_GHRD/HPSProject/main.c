#include <stdio.h>
#include <unistd.h>
#include <fcntl.h>
#include <sys/mman.h>
#include "hwlib.h"
#include "socal/socal.h"
#include "socal/hps.h"
#include "socal/alt_gpio.h"
#include "inc/mm_bridge_0.h"

#define HW_REGS_BASE ( ALT_STM_OFST )
#define HW_REGS_SPAN ( 0x04000000 )
#define HW_REGS_MASK ( HW_REGS_SPAN - 1 )



int main() {
	void *virtual_base;
	int fd;
	int loop_count;

	if( ( fd = open( "/dev/mem", ( O_RDWR | O_SYNC ) ) ) == -1 ) {
		printf( "ERROR: could not open \"/dev/mem\"...\n" );
		return( 1 );
	}

	virtual_base = mmap( NULL, HW_REGS_SPAN, ( PROT_READ | PROT_WRITE ), MAP_SHARED, fd, HW_REGS_BASE );

	if( virtual_base == MAP_FAILED ) {
		printf( "ERROR: mmap() failed...\n" );
		close( fd );
		return( 1 );
	}
	void *h2p_lw_led_addr;
	void *FPGASwitchAddr;
	void *FPGAButtonAddr;
	void *FreqRefCountMSB;
	void *FreqRefCountLSB;
	void *FreqSigCountMSB;
	void *FreqSigCountLSB;
	void *PhaseCountMSB;
	void *PhaseCountLSB;
	void *FreqID;
	FreqID=virtual_base + ( ( unsigned long  )( ALT_LWFPGASLVS_OFST +FREQUENCYMETER_0_SYSID_QSYS_0_BASE ) & ( unsigned long)( HW_REGS_MASK ) );
	h2p_lw_led_addr=virtual_base + ( ( unsigned long  )( ALT_LWFPGASLVS_OFST + LED_PIO_BASE ) & ( unsigned long)( HW_REGS_MASK ) );
	FPGAButtonAddr=virtual_base + ( ( unsigned long  )( ALT_LWFPGASLVS_OFST + BUTTON_PIO_BASE ) & ( unsigned long)( HW_REGS_MASK ) );
	FPGASwitchAddr=virtual_base + ( ( unsigned long  )( ALT_LWFPGASLVS_OFST + DIPSW_PIO_BASE) & ( unsigned long)( HW_REGS_MASK ) );
	FreqRefCountMSB = virtual_base + ( ( unsigned long  )( ALT_LWFPGASLVS_OFST +FREQUENCYMETER_0_PIOREFCOUNTMSB_BASE ) & ( unsigned long)( HW_REGS_MASK ) );
	FreqRefCountLSB = virtual_base + ( ( unsigned long  )( ALT_LWFPGASLVS_OFST +FREQUENCYMETER_0_PIOREFCOUNTLSB_BASE ) & ( unsigned long)( HW_REGS_MASK ) );
	FreqSigCountMSB = virtual_base + ( ( unsigned long  )( ALT_LWFPGASLVS_OFST +FREQUENCYMETER_0_PIOSIGCOUNTMSB_BASE ) & ( unsigned long)( HW_REGS_MASK ) );
	FreqSigCountLSB = virtual_base + ( ( unsigned long  )( ALT_LWFPGASLVS_OFST +FREQUENCYMETER_0_PIOSIGCOUNTLSB_BASE ) & ( unsigned long)( HW_REGS_MASK ) );
	PhaseCountMSB =  virtual_base + ( ( unsigned long  )( ALT_LWFPGASLVS_OFST + FREQUENCYMETER_0_PIOPHACOUNTMSB_BASE) & ( unsigned long)( HW_REGS_MASK ) );
	PhaseCountLSB =  virtual_base + ( ( unsigned long  )( ALT_LWFPGASLVS_OFST + FREQUENCYMETER_0_PIOPHACOUNTLSB_BASE) & ( unsigned long)( HW_REGS_MASK ) );
	

	loop_count = 0;
	int16_t DIPSWValue;
	int8_t ButtonValue;
	uint32_t refCountMSB;
	uint32_t refCountLSB;
	uint64_t refCount;
	uint32_t sigCountMSB;
	uint32_t sigCountLSB;
	uint64_t sigCount;
	uint32_t phaCountMSB;
	uint32_t phaCountLSB;
	uint64_t phaCount;

	printf("FREQ_ID:%d\n",*(uint32_t*)FreqID);
	while( loop_count < 60 ) {
		DIPSWValue= *(uint16_t*)FPGASwitchAddr;
		refCountMSB =*(uint32_t*)FreqRefCountMSB;
		refCountLSB =*(uint32_t*)FreqRefCountLSB;
		refCount = (refCountMSB<<32)+(refCountLSB);
		sigCountMSB =*(uint32_t*)FreqSigCountMSB;
		sigCountLSB =*(uint32_t*)FreqSigCountLSB;
		sigCount = (sigCountMSB<<32)+(sigCountLSB&0x00000000ffffffff);
		phaCountMSB =*(uint32_t*)PhaseCountMSB;
		phaCountLSB =*(uint32_t*)PhaseCountLSB;
		phaCount = (phaCountMSB<<32)+(phaCountLSB);
		if(sigCount!=0){
			usleep(1000*500);
			double phaseDiffInus= (double)phaCount/500;
			double FreqInHz = (double)sigCount/refCount*50000000;

			printf("mode: %d\n",DIPSWValue);
			printf("Freq: %fHz (%lld\t%lld)\n",refCount,sigCount);
			// phaseDiffInus +=  0.04*(phaCount/384.0);
			printf("Phase Diff: %fus\n",phaseDiffInus);
			printf("Duty Cycle: %.2f\n",(double)phaseDiffInus/(1000000/FreqInHz));
			loop_count++;
		}
	} 
	
	if( munmap( virtual_base, HW_REGS_SPAN ) != 0 ) {
		printf( "ERROR: munmap() failed...\n" );
		close( fd );
		return( 1 );
	}

	close( fd );
	return( 0 );
}

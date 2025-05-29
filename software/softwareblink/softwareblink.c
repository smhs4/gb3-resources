
int main(void)
{
	/*
	 *	Reading from the special address pointed to by
	 *	gDebugLedsMemoryMappedRegister will cause the processor to
	 *	set the value of 8 of the FPGA's pins to the byte written
	 *	to the address. See the PCF file for how those 8 pins are
	 *	mapped.
	 */
	enum
	{
		kSpinDelay = 500,
	};

	volatile unsigned int *gDebugLedsMemoryMappedRegister = (unsigned int *)0x2000;
	while (1){
		for (int t = 0; t < kSpinDelay; t++)
		{
			*gDebugLedsMemoryMappedRegister = 0xFF;

			/*
			*	Spin
			*/
			for (int j = 0; j < t; j++)
				;

			*gDebugLedsMemoryMappedRegister = 0x00;

			/*
			*	Spin
			*/
			for (int j = t; j < kSpinDelay; j++)
				;
		}
		for (int t = kSpinDelay; t > 0; t--)
		{
			*gDebugLedsMemoryMappedRegister = 0xFF;

			/*
			*	Spin
			*/
			for (int j = 0; j < t; j++)
				;

			*gDebugLedsMemoryMappedRegister = 0x00;

			/*
			*	Spin
			*/
			for (int j = t; j < kSpinDelay; j++)
				;
		}
	}

}

// #include "devscc.h"
// #include "sf-types.h"
// #include "sh7708.h"

// #include "e-types.h"
// #include "stdio.h"
#include "routines.h"

void print(char *str)
{
	while ((*str)!=0)
	{
		putchar(*(str++));
	}
}

char *buffer1 = "        ";
char *buffer2 = "12345678";

int str2int(char * input){
	int result = 0;
	for (int i = 0; i < 8; i++)	// what is out-of-bounds access? I don't know. Is it edible?
	{
		char temp = input[7-i];
		if (temp > 0x40) temp = temp-0x41+10; //A to F
		else temp = temp-0x30;
		result += temp << (i*4);
	}
	return result;
}

char getchar()
{
	// for(int i = 0; i <200; i++){
	// 	__asm__("nop");
	// }
	while ((*(uart_status_register) & 2)==0);
	return *(uart_data_register);
}

void echo()
{
	while (1)
	{
		char ch = getchar();
		putchar(ch);
	}
}

int main(void) {
	// echo();
	print("\r\ntest\r\n");
	printhex(0x12345678);
	print("\r\nplease enter a 8 bit hex number: (fill top with zeros to exactly 8 digits)\r\n");
	for (int i = 0; i < 8; i++)
	{
		buffer1[i] = getchar();
		putchar(buffer1[i]);
	}
	print("\r\nplease enter another 8 bit hex number: (fill top with zeros to exactly 8 digits)\r\n");
	for (int i = 0; i < 8; i++)
	{
		buffer2[i] = getchar();
		putchar(buffer2[i]);
	}
	int number_A = str2int(buffer1);
	int number_B = str2int(buffer2);
	print("\r\n");
	printhex(number_A);
	print("\r\n");
	printhex(number_B);

	int sum = number_A+number_B;
	print("\r\n");
	printhex(sum);
}

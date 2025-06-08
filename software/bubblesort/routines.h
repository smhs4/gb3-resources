volatile char * const led_register = (char *) 0x2000;
volatile char * const uart_data_register = (char *) 0x2004;
volatile char * const uart_status_register = (char *) 0x2005;

void printhex(int number);
int putchar(int ch);
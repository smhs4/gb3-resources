
#include <string.h>

enum
{
    kBaseDelay = 400000,
	kDotDelay = 2*kBaseDelay,  // Delay for a dot
    kDashDelay = 18*kBaseDelay, // Delay for a dash
    kSymbolSpaceDelay = 2*kBaseDelay, // Delay between symbols in a letter
    kLetterSpaceDelay = 6*kBaseDelay, // Delay between letters
    kWordSpaceDelay = 18*kBaseDelay   // Delay between words
};

volatile unsigned int *gDebugLedsMemoryMappedRegister = (unsigned int *)0x2000;

// Function to blink the LED for a dot
void blinkDot()
{
    *gDebugLedsMemoryMappedRegister = 0xFF;
    for (int j = 0; j < kDotDelay; j++)
        ;
    *gDebugLedsMemoryMappedRegister = 0x00;
    for (int j = 0; j < kSymbolSpaceDelay; j++)
        ;
}

// Function to blink the LED for a dash
void blinkDash()
{
    *gDebugLedsMemoryMappedRegister = 0xFF;
    for (int j = 0; j < kDashDelay; j++)
        ;
    *gDebugLedsMemoryMappedRegister = 0x00;
    for (int j = 0; j < kSymbolSpaceDelay; j++)
        ;
}

// Function to blink Morse code for a given character
void blinkMorseCodeForChar(char c)
{
    switch (c)
    {
    case 'A':
    case 'a':
        blinkDot();
        blinkDash();
        break;
    case 'B':
    case 'b':
        blinkDash();
        blinkDot();
        blinkDot();
        blinkDot();
        break;
    case 'C':
    case 'c':
        blinkDash();
        blinkDot();
        blinkDash();
        blinkDot();
        break;
    case 'D':
    case 'd':
        blinkDash();
        blinkDot();
        blinkDot();
        break;
    case 'E':
    case 'e':
        blinkDot();
        break;
    case 'F':
    case 'f':
        blinkDot();
        blinkDot();
        blinkDash();
        blinkDot();
        break;
    case 'G':
    case 'g':
        blinkDash();
        blinkDash();
        blinkDot();
        break;
    case 'H':
    case 'h':
        blinkDot();
        blinkDot();
        blinkDot();
        blinkDot();
        break;
    case 'I':
    case 'i':
        blinkDot();
        blinkDot();
        break;
    case 'J':
    case 'j':
        blinkDot();
        blinkDash();
        blinkDash();
        blinkDash();
        break;
    case 'K':
    case 'k':
        blinkDash();
        blinkDot();
        blinkDash();
        break;
    case 'L':
    case 'l':
        blinkDot();
        blinkDash();
        blinkDot();
        blinkDot();
        break;
    case 'M':
    case 'm':
        blinkDash();
        blinkDash();
        break;
    case 'N':
    case 'n':
        blinkDash();
        blinkDot();
        break;
    case 'O':
    case 'o':
        blinkDash();
        blinkDash();
        blinkDash();
        break;
    case 'P':
    case 'p':
        blinkDot();
        blinkDash();
        blinkDash();
        blinkDot();
        break;
    case 'Q':
    case 'q':
        blinkDash();
        blinkDash();
        blinkDot();
        blinkDash();
        break;
    case 'R':
    case 'r':
        blinkDot();
        blinkDash();
        blinkDot();
        break;
    case 'S':
    case 's':
        blinkDot();
        blinkDot();
        blinkDot();
        break;
    case 'T':
    case 't':
        blinkDash();
        break;
    case 'U':
    case 'u':
        blinkDot();
        blinkDot();
        blinkDash();
        break;
    case 'V':
    case 'v':
        blinkDot();
        blinkDot();
        blinkDot();
        blinkDash();
        break;
    case 'W':
    case 'w':
        blinkDot();
        blinkDash();
        blinkDash();
        break;
    case 'X':
    case 'x':
        blinkDash();
        blinkDot();
        blinkDot();
        blinkDash();
        break;
    case 'Y':
    case 'y':
        blinkDash();
        blinkDot();
        blinkDash();
        blinkDash();
        break;
    case 'Z':
    case 'z':
        blinkDash();
        blinkDash();
        blinkDot();
        blinkDot();
        break;
    // case ' ':
    //     for (int j = 0; j < kWordSpaceDelay; j++)
    //         ;
    //     break;
    default:
        break;
    }
	for (int i = 0; i < kLetterSpaceDelay; i++)
		;
}

int main(void)
{
    const char *message = "HELLO WORLD";

    while (1)
    {
        for (int i = 0; i < 11; i++)
        {
			if (message[i] == ' ')
			{
				// If the character is a space, add a longer delay
				for (int j = 0; j < kWordSpaceDelay; j++)
					;
			} else {
				blinkMorseCodeForChar(message[i]);
			}
        }
        for (int j = 0; j < kWordSpaceDelay; j++)
            ;
    }
}
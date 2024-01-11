# LED DIMMER
## Overview:
This project was made to control a led brightness which is connected to 8051 microcontroller. 

## Challenges:
The main challenge is that 8051 microcontroller unlike modern microcontroller doesn't have any analog output pins.

## Solution:
By using assembly language and making use of external interrupts a PMW (**P**ulse **W**edth **M**odulation ) was made to change the output voltage by changing the ratio of the time at which the led is on or off.
8 levels was made while displaying the current level value on a common anode 7-segment.

### notes
All the buttons and leds are connected with pull up resistors.\
7-segment is common anode.\
DPTR regester is used to jump to the level function.

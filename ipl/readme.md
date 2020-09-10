# IPL - Inital Program Loader

Beginnings for a ipl based on arduino to upload program to microelf board
Attention: ONLY works if using 3-pos toggle switches with a middle position,
for IN and D0-D7!

IN, D0-D7 MUST be in the middle position when arduino is active after reset/power on!
BUT have LOAD in off position first and switch to ON after power on.

Otherwise a short circuit will probably damage arduino and/or microelf - you have been warned!

Better insert min 220 ohm resistors in above lines to limit current on such case.

USE AT OWN RISC!

```
  (c) 2020 Peter Sieg - released under GNU GPL V2
  Before switching on, make SURE the D0-D7 and IN are in the middle position!!
  = NO connection to GND or VCC.
  Otherwise a short circuit will happen!
  And RUN and MP must be OFF. And LOAD must be ON
  Only start operating toogle switches AFTER buildin LED starts blinking!
  First start with switching LOAD to OFF and RUN to ON after inital program has loaded.

  View from bottom pcb with toggle switches - TIL displays on other side:
          1 - GND                  1 - Pin 14 on 74LS279
  D7-D0   2 - signal     IN switch 2 - GND
          3 = +5V                  3 - Pin 15 on 74LS279
*/
   
#define D0 2 
#define D1 3
#define D2 4
#define D3 5
#define D4 6
#define D5 7
#define D6 8
#define D7 9
#define STROBE_R 10 // Pin 14 on 74LS279
#define STROBE_S 11 // Pin 15 on 74LS279

```

![Bild](https://github.com/petersieg/cosmac-elf/blob/master/elf-white.jpeg)

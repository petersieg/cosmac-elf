# cosmac elf

Some files for Cosmac Elf self build simple computer based on 1976 article in Popular Electronics based on CDP1802 cpu.

Updates:
2020-07-26: a18.zip to include Mac OS X binary and source changes.


![Bild](https://github.com/petersieg/cosmac-elf/blob/master/microelf.jpg)

Und mit weißer Platine:

![Bild](https://github.com/petersieg/cosmac-elf/blob/master/microelf-weiß.jpeg)

Files:

cosmac.zip - Win 16-bit emulator for windows up to XP. For Win10 64-bit, one can use: https://github.com/otya128/winevdm

a18 - assembler incl. C source - DOS version requires cwsdpmi.exe

microelf - pcb files for Eagle and Elecrow incl. supporting files. By Mike Riley (see links).

EDIT: Have tried to convert brd to utilize 12 equal switches (no special IN switch; no mod needed). See file Microelf_pcb2.zip
(Verified working on 2020-01-24).

palm_elf.zip - TinyELF emulator and ElfASM assembler incl. pdb editor in java.

simelf - Cosmac ELF emulator in javascript. Start emu.html.

Links:

http://www.elf-emulation.com/hardware.html

http://www.retrotechnology.com/memship/memship.html

http://www.donnelly-house.net/programming/cdp1802/simelf/

https://groups.io/g/cosmacelf

Kleinstes Programm: LOAD 7B IN 30 IN 00 IN 00 IN LOAD wieder weg; dann RUN. Sollte Q-LED leuchten..

smallest counter program:

@0000:EF 80 BF AF 9E 5F 1E 64 30 01 .

NOP code is C4 if filling first bytes is needed.
 
Würfel (Throw a dice):
````
@0000:
F8 00 B2
F8 FF A2 E2
F8 00 AA
37 0A
37 1A
1A 8A
FF 06
32 17
E2
30 0C
AA
30 0C
8A FC 01
52 64 22
30 07
````

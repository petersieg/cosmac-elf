# cosmac elf

Some files for Cosmac Elf self build simple computer based on 1976 article in Popular Electronics based on CDP1802 cpu.

![Bild](https://github.com/petersieg/cosmac-elf/blob/master/microelf.jpg)

Files:

cosmac.zip - Win 16-bit emulator for windows up to XP. For Win10 64-bit, one can use: https://github.com/otya128/winevdm

a18 - assembler incl. C source

microelf - pcb files for Eagle and Elecrow incl. supporting files. By Mike Riley (see links).

EDIT: Have tried to convert brd to utilize 12 equal switches (no special IN switch; no mod needed). UNTESTED!! See file Microelf_pcb2.zip

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

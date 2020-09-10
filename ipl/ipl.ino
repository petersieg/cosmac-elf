/*Microelf Initial Program Loader V 0.1
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


void outbyte(char c) {

    // output to parallel port
    if (c & 128) digitalWrite(D7, HIGH); else digitalWrite(D7, LOW);
    if (c & 64)  digitalWrite(D6, HIGH); else digitalWrite(D6, LOW);
    if (c & 32)  digitalWrite(D5, HIGH); else digitalWrite(D5, LOW);
    if (c & 16)  digitalWrite(D4, HIGH); else digitalWrite(D4, LOW);
    if (c & 8)   digitalWrite(D3, HIGH); else digitalWrite(D3, LOW);
    if (c & 4)   digitalWrite(D2, HIGH); else digitalWrite(D2, LOW);
    if (c & 2)   digitalWrite(D1, HIGH); else digitalWrite(D1, LOW);
    if (c & 1)   digitalWrite(D0, HIGH); else digitalWrite(D0, LOW);

    // Strobe
    delay(50);
    digitalWrite(STROBE_R, HIGH);
    digitalWrite(STROBE_S, LOW);
    delay(50);
    digitalWrite(STROBE_R, LOW);
    digitalWrite(STROBE_S, HIGH);
    delay(50);  
}

void setup() {

  // initialize digital pin LED_BUILTIN as an output.
  pinMode(LED_BUILTIN, OUTPUT);
  // set output pins and set data to C4 = NOP
  delay(500);  
  pinMode(D0, OUTPUT);
  digitalWrite(D1, LOW);
  pinMode(D1, OUTPUT);
  digitalWrite(D1, LOW);
  pinMode(D2, OUTPUT);
  digitalWrite(D2, HIGH);
  pinMode(D3, OUTPUT);
  digitalWrite(D3, LOW);
  pinMode(D4, OUTPUT);
  digitalWrite(D4, LOW);
  pinMode(D5, OUTPUT);
  digitalWrite(D5, LOW);
  pinMode(D6, OUTPUT);
  digitalWrite(D6, HIGH);
  pinMode(D7, OUTPUT);
  digitalWrite(D7, HIGH);
  pinMode(STROBE_R, OUTPUT);
  pinMode(STROBE_S, OUTPUT);
  digitalWrite(STROBE_R, LOW);
  digitalWrite(STROBE_S, HIGH);
  delay(1500);  
 
  //Serial.begin(9600);
  /* LED on
  outbyte(0x7B);
  outbyte(0x30);
  outbyte(0x00);
  outbyte(0x00);*/
  /* smallest counter
  outbyte(0xEF);
  outbyte(0x80);
  outbyte(0xBF);
  outbyte(0xAF);
  outbyte(0x9E);
  outbyte(0x5F);
  outbyte(0x1E);
  outbyte(0x64);
  outbyte(0x30);
  outbyte(0x01);*/
  // meister - Mastermind
  outbyte(0xF8);
  outbyte(0x05);
  outbyte(0xA2);
  outbyte(0xF8);
  outbyte(0xE0);
  outbyte(0xA7);
  outbyte(0xF8);
  outbyte(0xE8);
  outbyte(0xA6);
  outbyte(0xF8);
  outbyte(0xA0);
  outbyte(0xA8);
  outbyte(0xF8);
  outbyte(0xB0);
  outbyte(0xA9);
  outbyte(0xF8);
  outbyte(0x0A);
  outbyte(0xA5);
  outbyte(0x85);
  outbyte(0x3A);
  outbyte(0x19);
  outbyte(0xF8);
  outbyte(0x0A);
  outbyte(0xA5);
  outbyte(0x25);
  outbyte(0x3F);
  outbyte(0x13);
  outbyte(0x37);
  outbyte(0x1C);
  outbyte(0x7A);
  outbyte(0x85);
  outbyte(0x57);
  outbyte(0x17);
  outbyte(0x56);
  outbyte(0x16);
  outbyte(0x22);
  outbyte(0x82);
  outbyte(0x3A);
  outbyte(0x10);
  outbyte(0xF8);
  outbyte(0xE0);
  outbyte(0xA7);
  outbyte(0xE7);
  outbyte(0xF8);
  outbyte(0x04);
  outbyte(0xA3);
  outbyte(0x47);
  outbyte(0xF5);
  outbyte(0x32);
  outbyte(0x63);
  outbyte(0x23);
  outbyte(0x83);
  outbyte(0x3A);
  outbyte(0x2F);
  outbyte(0xF8);
  outbyte(0xE0);
  outbyte(0xA7);
  outbyte(0xF8);
  outbyte(0x03);
  outbyte(0xA3);
  outbyte(0x47);
  outbyte(0x17);
  outbyte(0xF5);
  outbyte(0x32);
  outbyte(0x63);
  outbyte(0x27);
  outbyte(0x23);
  outbyte(0x83);
  outbyte(0x3A);
  outbyte(0x3D);
  outbyte(0xF8);
  outbyte(0xE0);
  outbyte(0xA7);
  outbyte(0xF8);
  outbyte(0x02);
  outbyte(0xA3);
  outbyte(0x47);
  outbyte(0x17);
  outbyte(0x17);
  outbyte(0xF5);
  outbyte(0x32);
  outbyte(0x63);
  outbyte(0x27);
  outbyte(0x27);
  outbyte(0x23);
  outbyte(0x83);
  outbyte(0x3A);
  outbyte(0x4D);
  outbyte(0xF8);
  outbyte(0xE0);
  outbyte(0xA7);
  outbyte(0x47);
  outbyte(0x17);
  outbyte(0x17);
  outbyte(0x17);
  outbyte(0xF5);
  outbyte(0x3A);
  outbyte(0x66);
  outbyte(0x7B);
  outbyte(0x30);
  outbyte(0x00);
  outbyte(0xF8);
  outbyte(0xF0);
  outbyte(0xA1);
  outbyte(0xF8);
  outbyte(0xEE);
  outbyte(0x51);
  outbyte(0xE1);
  outbyte(0x64);
  outbyte(0xF8);
  outbyte(0xE0);
  outbyte(0xA7);
  outbyte(0x3F);
  outbyte(0x71);
  outbyte(0x37);
  outbyte(0x73);
  outbyte(0x6C);
  outbyte(0xA4);
  outbyte(0x64);
  outbyte(0x84);
  outbyte(0xAA);
  outbyte(0xE1);
  outbyte(0x3F);
  outbyte(0x7B);
  outbyte(0x37);
  outbyte(0x7D);
  outbyte(0x6C);
  outbyte(0xAB);
  outbyte(0xE7);
  outbyte(0xF5);
  outbyte(0x3A);
  outbyte(0x8D);
  outbyte(0x18);
  outbyte(0x17);
  outbyte(0x2A);
  outbyte(0x8A);
  outbyte(0x3A);
  outbyte(0x7A);
  outbyte(0x30);
  outbyte(0xA1);
  outbyte(0xF8);
  outbyte(0xE8);
  outbyte(0xA6);
  outbyte(0xE6);
  outbyte(0x84);
  outbyte(0xAD);
  outbyte(0x8B);
  outbyte(0xF5);
  outbyte(0x3A);
  outbyte(0x9A);
  outbyte(0x19);
  outbyte(0x30);
  outbyte(0x86);
  outbyte(0x16);
  outbyte(0x2D);
  outbyte(0x8D);
  outbyte(0x3A);
  outbyte(0x93);
  outbyte(0x30);
  outbyte(0x86);
  outbyte(0xE1);
  outbyte(0xF8);
  outbyte(0xF0);
  outbyte(0xA1);
  outbyte(0x88);
  outbyte(0x51);
  outbyte(0x64);
  outbyte(0xF8);
  outbyte(0xA0);
  outbyte(0xA8);
  outbyte(0x89);
  outbyte(0x51);
  outbyte(0x3F);
  outbyte(0xAD);
  outbyte(0x37);
  outbyte(0xAF);
  outbyte(0x64);
  outbyte(0xF8);
  outbyte(0xB0);
  outbyte(0xA9);
  outbyte(0xC4);
  outbyte(0xF8);
  outbyte(0xF0);
  outbyte(0xA1);
  outbyte(0xE1);
  outbyte(0xF8);
  outbyte(0xE0);
  outbyte(0xA7);
  outbyte(0x30);
  outbyte(0x78);
  
  // Make output now input pins to allow operate from toggle switches
  pinMode(D0, INPUT_PULLUP);
  pinMode(D1, INPUT_PULLUP);
  pinMode(D2, INPUT_PULLUP);
  pinMode(D3, INPUT_PULLUP);
  pinMode(D4, INPUT_PULLUP);
  pinMode(D5, INPUT_PULLUP);
  pinMode(D6, INPUT_PULLUP);
  pinMode(D7, INPUT_PULLUP);
  pinMode(STROBE_R, INPUT_PULLUP);
  pinMode(STROBE_S, INPUT_PULLUP);
}


void loop() {
  digitalWrite(LED_BUILTIN, HIGH);   // turn the LED on (HIGH is the voltage level)
  delay(1000);                       // wait for a second
  digitalWrite(LED_BUILTIN, LOW);    // turn the LED off by making the voltage LOW
  delay(1000);                       // wait for a second
}

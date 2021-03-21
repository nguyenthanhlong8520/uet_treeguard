//Woon Jun Shen
//UM402 (433 MHz UART)
#include <SoftwareSerial.h>

SoftwareSerial mySerial(2, 3); //TX, RX
// gnd SET_A and SET_B for Normal Mode (Send and Receive)

void setup() {
  Serial.begin(9600);
  mySerial.begin(9600);
}

void loop() {
//  if(Serial.available() > 0){//Read from serial monitor and send over UM402
//    String input = Serial.readString();
//    mySerial.println(input);    
//  }

   int myPins[] = {2, 4, 8, 3, 6};
   for (byte i = 0; i < 5; i = i + 1) {
       Serial.print(myPins[i]);
  }
   mySerial.print(myPins[0]);
   mySerial.print(myPins[1]);
   mySerial.print(myPins[2]);
   mySerial.print(myPins[3]);
   mySerial.print(myPins[4]);
   delay(2000) ;
// 
//  if(mySerial.available() > 1){//Read from UM402 and send to serial monitor
//    String input = mySerial.readString();
//    Serial.println(input);    
//  }
//  delay(20);
}

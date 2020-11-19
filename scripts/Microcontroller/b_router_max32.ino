/*
  Luke Horne
 
  Makes Arduino send 1 character via XBee wireless to another XBee connected
  to a computer via a USB cable.

  The circuit:
  * RX is digital pin 18 (connect to TX of XBee)
  * TX is digital pin 19 (connect to RX of XBee)
 
*/

#include <SoftwareSerial.h>
#include "Wire.h"
#define TMP102_I2C_ADDRESS 72 /* This is the I2C address for our chip. This value is correct if you tie the ADD0 pin to ground. See the datasheet for some other values. */

SoftwareSerial Xbee(16, 17); // RX,TX

int pin = 8;  // Check what pin to use
int outblink = 13; // LED pin to blink
int duration; // Duration of the pulse

int current;

void setup()  {
   Wire.begin(); // start the I2C library
   Serial.begin(57600); //open serial monitor
   

   // set the data rate for the SoftwareSerial port
   Xbee.begin(115200); //open uart monitor(send info through zigbee)
   
   pinMode(pin, INPUT); // PWM input pin
   pinMode(outblink, OUTPUT); // LED Blink pin, using the build in LED on pin 13
}

void loop()
{
  Xbee.print('b');
  get_MQ7GasSend();
  Serial.println();
  get_sendTemp102();
  Serial.println();
  get_smoke();
  Serial.println();
  Xbee.print('Z');

  if (Xbee.available() > 0) {
    current = Xbee.read();
    while(current != 'Z') {
      Xbee.write(current);
      Serial.write(current);
      current = Xbee.read();
    } Xbee.print('Z');
    Serial.print('Z');
  } Serial.println();

  delay(15000); //declaring data rate
}

void get_MQ7GasSend() {
  float sensorVoltage;
  float sensorValue;
 
  sensorValue = analogRead(A0);
  sensorVoltage = sensorValue/1024*3.3;

  Xbee.print('C');
  Xbee.print(sensorVoltage);
  Serial.print(sensorVoltage);
  
}

void get_sendTemp102()  {
  byte firstbyte, secondbyte; //these are the bytes we read from the TMP102 temperature registers
  int val; /* an int is capable of storing two bytes, this is where we "chuck" the two bytes together. */
 
 
  Wire.beginTransmission(TMP102_I2C_ADDRESS); //Say hi to the sensor.
  Wire.write(0x00);
  Wire.endTransmission();
  Wire.requestFrom(TMP102_I2C_ADDRESS, 2);
  Wire.endTransmission();
 
 
  firstbyte      = (Wire.read());
  /*read the TMP102 datasheet - here we read one byte from
   each of the temperature registers on the TMP102*/
  secondbyte     = (Wire.read());
  /*The first byte contains the most significant bits, and
   the second the less significant */
    val = firstbyte;
    if ((firstbyte & 0x80) > 0)
    {
      val |= 0x0F00;
    }
    val <<= 4;
 /* MSB */
    val |= (secondbyte >> 4);
 
  Xbee.print('T');
  Xbee.print(val*0.0625);
  Serial.print(val*0.0625);

}

void get_smoke() 
{
duration = pulseIn(pin, HIGH);
  if (duration > 1500)
    {
      digitalWrite(outblink, HIGH);
    }
  else
    {
      digitalWrite(outblink, LOW);
    }

  Xbee.print('S');
  Xbee.print(duration);
  Serial.print(duration);

}

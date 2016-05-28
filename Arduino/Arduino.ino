/*
 created 2005
 by DojoDave <http://www.0j0.org>
 modified 30 Aug 2011
 by Tom Igoe

 This example code is in the public domain.

 http://www.arduino.cc/en/Tutorial/Button
 */

#include <NewPing.h>
#include <Servo.h>

//UltrasonicSensor
#define TRIGGER_PIN  12  // Arduino pin tied to trigger pin on the ultrasonic sensor.
#define ECHO_PIN     11  // Arduino pin tied to echo pin on the ultrasonic sensor.
#define MAX_DISTANCE 200 // Maximum distance we want to ping for (in centimeters). Maximum sensor distance is rated at 400-500cm.
NewPing sonar(TRIGGER_PIN, ECHO_PIN, MAX_DISTANCE); // NewPing setup of pins and maximum distance.

//ServoMotor
Servo ver; 
Servo hor;
int dist;

//Button 
const int buttonPin1 = 3;
const int buttonPin2 = 4;
const int buttonPin3 = 5;
const int buttonPin4 = 6;
const int buttonPin5 = 7;
int buttonState1 = 0;
int buttonState2 = 0;
int buttonState3 = 0;
int buttonState4 = 0;
int buttonState5 = 0;

int seq=3;
String a="1";
int flag=0;
int x=0;
int idle=600;

void setup() {
  Serial.begin(9600);
  hor.attach(8);
  ver.attach(9);
  pinMode(10,OUTPUT);
  pinMode(buttonPin1, INPUT);
  pinMode(buttonPin2, INPUT);
  pinMode(buttonPin3, INPUT);
  pinMode(buttonPin4, INPUT);
  pinMode(buttonPin5, INPUT);
}

void loop() {
  dist=sonar.ping_cm();
 
  digitalWrite(10,LOW);
  hor.write(0);
  ver.write(90);  
  Serial.println(a);
  if (flag==0){
    a=1;
    if(dist<100&&dist>0){
    Serial.println("7");
    hor.write(90);
    delay(100);
    hor.write(0);
    flag=1;
    }
  }
  if(flag==1){
    Serial.println("7");        
    x=0;
    do{ 
      //Serial.println("Pilih Laguage");
      readButt();      
      delay(100);
      x=x+1;
        if(x==idle){
          a=8;
          Serial.println(a);
          flag=0;
        }
    }while(a=="1"||a=="2"||a=="6"||a=="7");
    Serial.println(a);
    delay(100);    
    
    //object1
    if (seq==3){     
     // a="1";
     //Serial.println(a);
      object1();
      //Serial.println("object1");
      x=0;
      button26();
      if(a=="2")Serial.println(a);
      do{
        laserBlink();
      }while(a=="2");
      if(a=="6"){
        Serial.println(a);
        seq=4;
        a="1";
      }
    }

    //object2
    if (seq==4){
      //Serial.println("object2");
      object2();
      
      button26();
      if(a=="2")Serial.println(a);
      do{
        laserBlink();
      }while(a=="2");
      if(a=="6"){
        Serial.println(a);
        seq=5;
        a="1";
      }
    }

    //object3
    if (seq==5){
      //Serial.println("object3");
      object3();
      button26();
      if(a=="2")Serial.println(a);
      do{
        laserBlink();
      }while(a=="2");
      if(a=="6"){
        Serial.println(a);
        seq=6;
        a="1";
      }
    }

    //object4
    if (seq==6){
      //Serial.println("object4");
      object4();
      button26();
      if(a=="2")Serial.println(a);
      do{
        laserBlink();
      }while(a=="2");
      if(a=="6"){
        Serial.println(a);
        seq=7;
        a="1";
      }
    }

    //object5
    if (seq==7){
      object5();
      //Serial.println("object6");
      button26();
      if(a=="2")Serial.println(a);
      do{
        laserBlink();
      }while(a=="2");
      if(a=="6"){
        Serial.println(a);  
            // Serial.println("cuy");
        seq=10;
        //a="1";
      }
    }

    //thanksScreen
    /*if (seq==9){
      digitalWrite(10,LOW);
      //Serial.println("thanks");
      hor.write(180);
      ver.write(90);  
      //Serial.println(a);
      button26();
      if(a=="2")Serial.println(a);
      do{
        laserBlink();
      }while(a=="2");
      if(a=="6"){
        Serial.println(a);       
        seq=10;
        a="1";
      //  Serial.println("finish"); 
      }
    }*/
  
    if (seq==10){
      digitalWrite(10,LOW);
      //Serial.println("thanks");
      hor.write(0);
      ver.write(90);  
      x=0;
      Serial.println(a);
      delay(100);
      Serial.println(a);
      delay(100);
      Serial.println(a);
     // do{ 
        readButt();      
        delay(100);
        x=x+1;
        if(x==idle){
          a=8;
          Serial.println(a);
          flag=0;
          seq=3;
        }
   //}while(a=="1");
      //Serial.println(a);  
      //delay(100);
     /* if(a=="2")Serial.println(a);
      do{
        laserBlink();
      }while(a=="2");*/
      //if(a=="6"){
        //Serial.println(a);       
        seq=3;
          a="7";
          flag=1;
          Serial.println(a);
          delay(200);
        
       
      //}
    }
  }
  
  delay(100);
}

void readButt(){
    //a="1";
      // read the state of the pushbutton value:
      buttonState1 = digitalRead(buttonPin1);
      buttonState2 = digitalRead(buttonPin2);
      buttonState3 = digitalRead(buttonPin3);
      buttonState4 = digitalRead(buttonPin4);
      buttonState5 = digitalRead(buttonPin5);
    
      if (buttonState1 == HIGH) {
        a="2";  
      }
      if (buttonState2 == HIGH) {
        a="3";    
      }
      if (buttonState3 == HIGH) {
        a="4";    
      }
      if (buttonState4 == HIGH) {
        a="5";    
      }
      if (buttonState5 == HIGH) {
        a="6";    
      }
  //Serial.println(a);
}

void checkButton(){
  do {
        readButt();
        delay(100);
  }while(a=="1");
}

void button26(){
  x=0;
  do{ 
        readButt();      
        delay(100);       
        x=x+1;
        if(x==idle){
          a=8;
          Serial.println(a);
          flag=0;
          seq=3;
        }
   }while(a=="1"||a=="3"||a=="4"||a=="5");
}

void laserBlink(){
  digitalWrite(10,HIGH);
  readButt();
  delay(100);
  digitalWrite(10,LOW);
  readButt();
  delay(100);
}

void object1(){
    digitalWrite(10,HIGH);
    hor.write(90);
    ver.write(75);
}
void object2(){
    digitalWrite(10,HIGH);
    ver.write(50);
}
void object6(){
  digitalWrite(10,HIGH);
    ver.write(45);
}
void object3(){
    digitalWrite(10,HIGH);
    hor.write(80);
    ver.write(40);
}
void object4(){
    digitalWrite(10,HIGH);
    //hor.write(70);
    ver.write(60);
}
void object5(){
    digitalWrite(10,HIGH);
    //hor.write(70);
    ver.write(85);
}


import processing.serial.*;

PImage more,next,next1, wake, hi, hoam1,hoam2,hoam3;
PImage[] eng = new PImage[14];
PImage[] esp = new PImage[14];
PImage[] chi = new PImage[14];
int seq=0;
int seqx=0;
int time=0;
int time2=0;
boolean choose=true;
boolean tick = false;
char m,n,o;
Serial myPort;  // Create object from Serial class
String val;     // Data received from the serial port
float x;
int count=1;
int flag=0;
int lang;

void setup(){
  time=millis();
 size (1366,768);
 next=loadImage("next.png");
 next1=loadImage("next1.png");
 more=loadImage("more.png");
 hi=loadImage("hi.jpg");
 hoam1=loadImage("hoam1.jpg");
 hoam2=loadImage("hoam2.jpg");
 hoam3=loadImage("hoam3.jpg");
 wake=loadImage("wakemeup.jpg");
 for(int i=0;i<14;i++){
    eng[i]=loadImage("eng"+i+".jpg"); 
  }
  for(int i=4;i<13;i=i+2){
    esp[i]=loadImage("esp"+i+".jpg"); 
  }
  for(int i=4;i<13;i=i+2){
    chi[i]=loadImage("chi"+i+".jpg"); 
  }

 smooth();
 
 //SerialSetup
  String portName = Serial.list()[0]; //change the 0 to a 1 or 2 etc. to match your port
  myPort = new Serial(this, portName, 9600); 
  myPort.bufferUntil('\n');  //

  
}

void draw(){
  background(255);
  
 println(x);
 print("flag: ");
 println(flag);
 //time=millis();
  if (flag==0){
    welcome();
    //time=millis();
    
    if(x==7){
    flag=1;
    seqx=0;
    seq=0;
    time=millis();
   }
  }
  
  if (flag==1){
  if(seq==0){ 
    //print(x);
    //seqx=1;
    //seq02();
    
    if(seqx==0){
      //seq02();
      if(millis() - time >= 00){                 
        choose=false;        
        seqx=1;
        time=millis();
      }
    }
    if(seqx==1){
      //seq03();
      if(millis() - time >= 0){                 
        choose=false;        
        seqx=2;
        time=millis();
      }
    }
   if(seqx==2){
      //seq04();
      if(millis() - time >= 00){                 
        choose=false;        
        seqx=3;
        time=millis();
      }
    }
    if(seqx==3){
      seq01();
      if(millis() - time >= 2500){                 
        //choose=false;        
        seqx=6;        
        choose=false;
        seq=1;
        time=millis();
      }
    }
          


  }
  if(seq==1&&choose==false){
     seq1();
     print(x);
     if(x==3){  
       time=millis();
      seq=2;
      lang=1;
      choose=true;
     }
     if(x==4){  
       time=millis();
      seq=2;
      lang=2;
      choose=true;
     }
     if(x==5){  
       time=millis();
      seq=2;
      lang=3;
      choose=true;
     }
     if(x==8){
      seqx=0;
      x=0;
      choose=false;
      //seq=0;           
      flag=0;
    } 
  }
  if(seq==2&&choose==true){ 
    print(x);
    seq2();
    if(millis() - time >= 3000){           
      n='o';
      
      seq=3;
      time=millis();
    }
  }
  if(seq==3&&choose==true){
     seq3();        
     print(x);     
     if(x==2){
         x=9;
         seq=4;      
         time=millis();
      }
      if(x==6){
         x=9;
         seq=5;        
         time=millis();
      }
      if(x==8){
      seqx=0;
      x=0;
      choose=false;
      //seq=0;           
      flag=0;
    } 

  }
  if(seq==4&&choose==true){
    seq4();
    print(x);    
    if(x==6){
       x=9;
       seq=5;          
       time=millis();
     }
     if(x==8){
      seqx=0;
      x=0;
      choose=false;
      //seq=0;           
      flag=0;
    } 
    
  }
  if(seq==5&&choose==true){
     seq5(); 
     print(x);     
     if(x==2){
       x=9;
       seq=6;        
       time=millis();
      }   
      if(x==6){
        x=9;
        seq=7;       
        time=millis();
      }
      if(x==8){
      seqx=0;
      x=0;
      choose=false;
      //seq=0;           
      flag=0;
    } 

  }
  if(seq==6&&choose==true){
    seq6();
    print(x);
    if(x==6){
       x=9;
       seq=7;         
       time=millis();
     }
     if(x==8){
      seqx=0;
      x=0;
      choose=false;
      //seq=0;           
      flag=0;
    } 
  }

    if(seq==7&&choose==true){
     seq7(); 
     print(x);     
     if(x==2){
       x=9;
       seq=8;        
       time=millis();
      }   
      if(x==6){
        x=9;
        seq=9;       
        time=millis();
      }
      if(x==8){
      seqx=0;
      x=0;
      choose=false;
      //seq=0;           
      flag=0;
    } 

  }
  if(seq==8&&choose==true){
    seq8();
    print(x);
    if(x==6){
       x=9;
       seq=9;         
       time=millis();
     }
     if(x==8){
      seqx=0;
      x=0;
      choose=false;
      //seq=0;           
      flag=0;
    } 
  }

  if(seq==9&&choose==true){
     seq9(); 
     print(x);     
     if(x==2){
       x=9;
       seq=10;
       time=millis();
      }   
      if(x==6){
        x=9;
        seq=11;      
        time=millis();
      }
      if(x==8){
      seqx=0;
      x=0;
      choose=false;
      //seq=0;           
      flag=0;
    } 

  }
  if(seq==10&&choose==true){
    seq10();
    print(x);
    if(x==6){
       x=9;
       seq=11;        
       time=millis();
     }
     if(x==8){
      seqx=0;
      x=0;
      choose=false;
      //seq=0;           
      flag=0;
    } 
  }
  
  if(seq==11&&choose==true){
     seq11(); 
     print(x);     
     if(x==2){
       x=9;
       seq=12;       
       time=millis();
      }   
      if(x==6){
        x=9;
        seq=13;      
        time=millis();
      }
      if(x==8){
      seqx=0;
      x=0;
      choose=false;
      //seq=0;           
      flag=0;
    } 

  }
  if(seq==12&&choose==true){
    seq12();
    print(x);
    if(x==6){
       x=9;
       seq=13;        
       time=millis();
     }
     if(x==8){
      seqx=0;
      x=0;
      choose=false;
      //seq=0;           
      flag=0;
    } 
  }  
  
  
  if(seq==13&&choose==true){
    seq13();
    print(x);
    if(millis() - time >= 2000){                 
        flag=1;
        seq=1;
        choose=false;
        time=millis();
      }
    /*if (x==6){
      flag=1;
      seq=1;
      choose=false;
    }*/
    if(x==8){
      seqx=0;
      x=0;
      choose=false;
      //seq=0;           
      flag=0;
    } 
  }
 }

delay(300);
}

void welcome(){
  image(wake,0,0);
}

void seq01(){
  image(hi,0,0);  
}
void seq02(){
  image(hoam1,0,0);  
}
void seq03(){
  image(hoam2,0,0);  
}
void seq04(){
  image(hoam3,0,0);  
}
void seq1(){
  image(eng[1],0,0);
}
void seq2(){
  image(eng[2],0,0);
  
}

void seq3(){
  image(eng[3],0,0);
  button();
  
}

void seq4(){
  if (lang==1){
   image(eng[4],0,0);
   button1();
  }
  if (lang==2){
   image(esp[4],0,0);
   button1();
  }
  if (lang==3){
   image(chi[4],0,0);
   button1();
  }
  
}

void seq5(){
  image(eng[5],0,0);
  button();
}

void seq6(){
    if (lang==1){
   image(eng[6],0,0);
   button1();
  }
  if (lang==2){
   image(esp[6],0,0);
   button1();
  }
  if (lang==3){
   image(chi[6],0,0);
   button1();
  }
}

void seq7(){
  image(eng[7],0,0);
  button();
}
void seq8(){
    if (lang==1){
   image(eng[8],0,0);
   button1();
  }
  if (lang==2){
   image(esp[8],0,0);
   button1();
  }
  if (lang==3){
   image(chi[8],0,0);
   button1();
  }
}
void seq9(){
  image(eng[9],0,0);
  button();
}
void seq10(){
    if (lang==1){
   image(eng[10],0,0);
   button1();
  }
  if (lang==2){
   image(esp[10],0,0);
   button1();
  }
  if (lang==3){
   image(chi[10],0,0);
   button1();
  }
}
void seq11(){
  image(eng[11],0,0);
  button();
}
void seq12(){
    if (lang==1){
   image(eng[12],0,0);
   button1();
  }
  if (lang==2){
   image(esp[12],0,0);
   button1();
  }
  if (lang==3){
   image(chi[12],0,0);
   button1();
  }
}

void seq13(){
  image(eng[13],0,0);
}

void delaying(int delay1){
  if(millis() - time >= delay1){   
  seq++;
    if (seq==6)seq=1; 
    time = millis();
  }
}



void keyPressed() { 
 x = key;
 x=x-95;
 /*if(choose){
   choose = false;
  }*/
}

void button(){
 if(millis() - time >= 2000){
        image(more,10,430);
        image(next,1050,430);
    } 
}
void button1(){
 if(millis() - time >= 2000){      
        image(next1,40,690);
    } 
}

//Serial Event
void serialEvent(Serial myPort){
  
    // If data is available,
   val = myPort.readStringUntil('\n');         // read it and store it in val
   
   if (val != null) {
  //trim whitespace and formatting characters (like carriage return)
  val = trim(val);
  x=float (val);
  //println(x);
  //println(val); //print it out in the console
  
  }
}

void parsingSerial(){
  
    if (x==2){
      n='a'; 
    }
    if (x==3){
      n='q'; 
    } 
    if (x==4){
      n='w'; 
    } 
    if (x==5){
      n='e'; 
    } 
    if (x==6){
      
      n='d'; 
      count++;
      
    } 
    myPort.clear();
}
void parsingSerial1(){
  n='o';
   if (x==2){
      m='z'; 
    }
  if (x==6){
      
      m='c'; 
      count++;
      
    }
    myPort.clear();
}

void parsingSerial2(){
  n='g';
   if (x==2){
      o='s'; 
    }
  if (x==6){
      
      o='f'; 
      count++;
      
    }
    myPort.clear();
}
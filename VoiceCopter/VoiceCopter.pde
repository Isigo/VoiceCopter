/**
*Author : Théo Baron
*Creation date : 28/03/2014
*Last update : 29/03/2014
*************************************************

VoiceCopter is an application made to control a Hubsan X4 quadcopter with the voice.
Contact : theo.lucaroni@gmail.com

*************************************************
**/
import voce.*;
import processing.serial.*;

CopterModel copter;
String s;
int s_int;

void setup() {
  size(200,200);
  background(0);
  copter = new CopterModel((PApplet)this);
  voce.SpeechInterface.init("voce/library/", true, true, "voce/library/gram", "copter"); //init of voce

}
  
void draw() { 
  stroke(255);
   copter.sendData();
  while (voce.SpeechInterface.getRecognizerQueueSize() > 0){//if voce detects voice
    s = voce.SpeechInterface.popRecognizedString();
    println(s);
    if (s.equals("on")) {
      copter.throttle = 0.65;
    }
    else if (s.equals("off")) {
      copter.throttle = 0;
    }
    else if (s.equals("turn on")) {
      copter.rudder = 0.5;
      copter.throttle = 0.5;
    }
    else if (s.equals("front")) {
      copter.elevator = 0.1;
    }
    else if (s.equals("back")) {
      copter.elevator = -0.1;
    }
    else if (s.equals("right")) {
      copter.aileron = 0.1;
    }
    else if (s.equals("left")) {
      copter.aileron = -0.1;
    }
    else {
      copter.throttle = 0;
      copter.elevator = 0;
      copter.aileron = 0;
      copter.rudder = 0;
    }
    
}

}



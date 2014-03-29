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
    if (s.equals("on") || s.equals("start")) { //start command to start motors
  copter.throttle = 0.05;
}
else if (s.equals("off") || s.equals("stop")) { //start commands to start motors
  copter.throttle = 0;
} else {
  copter.throttle = 0;
}

}

 
 
}



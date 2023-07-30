
import processing.sound.*;
import oscP5.*;
import netP5.*;

float ML_Out = 0; 
float circleX = 0;
float circleY = 0;

boolean testMode = false; // 0: traning 1: testing


float width = 600;
float r = 6;
float thickX = width/2;
float thickY = width/2;
float rot;
float rotSpeed = 0.00005;
boolean rotating = true;
float freq = 0.000005;
float cont = 0;
PVector[] pos; // training positions

OscP5 oscP5;
NetAddress dest;
SinOsc sine;


void setup() {
  size(1000,1000);
  //colorMode(HSB, 360, 255, 255);
  background(0);
  colorMode(HSB);
  
  oscP5 = new OscP5(this, 12000);
  dest = new NetAddress("127.0.0.1", 6448);
  
  noStroke();

  sine = new SinOsc(this);
  sine.play();
  pos = new PVector[0];
  
  textSize(20);
  fill(120);
  
}

void draw() {
  if (testMode){
  background(0);
  translate(width/10*7, height/2);
  rotate(radians(rot));
  noStroke();

  for (float i=0; i<500; i+=0.5) {
    thickX = width/2 - 100 + circleX / 10 + 100*sin(millis()*freq*i);
    thickY = width/2 - 100 + circleY / 10 + 100 * sin(millis()*freq*i);
    fill(i*3.5/5, 255, 255);
    ellipse(thickX * cos(i), thickY * sin(i), r, r);
    if(rotating){ rot += rotSpeed; }
    circleX += 0.01;
    if (circleX > width) circleX = 0;
    circleY += 0.01;
    if (circleY > height) circleY = 0;
    sendOsc(circleX, circleY);
    
    float frequence =map(circleX, height, 0, 80.0, 1000.0);
    float vol = map(width, circleY, 0, 0, 1.0);
    sine.freq(frequence);
    sine.amp(vol);
  }

  resetMatrix();
  translate(width/2 - 100, width/2 - 100);
  resetMatrix();
  }
  
  else {text("Training", 20, 20);
    
    // set training positions
    if (mousePressed) {
      stroke(255);
      strokeWeight(10);
      point(mouseX, mouseY);
      pos = (PVector[])append(pos, new PVector(mouseX, mouseY));
      sendOscTranining(mouseX, mouseY);
    }
  }
}


void keyPressed() {
  if (key == ' ') testMode = !testMode;
}

void sendOscTranining(float x, float y) {
  OscMessage msg = new OscMessage("/wek/inputs");
  msg.add(x); 
  oscP5.send(msg, dest);

  msg = new OscMessage("/wekinator/control/outputs");
  msg.add(y); 
  oscP5.send(msg, dest);
}

void sendOsc(float x, float y) {
  OscMessage msg = new OscMessage("/wek/inputs");
  msg.add(x); 
  oscP5.send(msg, dest);

  msg = new OscMessage("/wekinator/control/outputs");
  msg.add(y); 
  oscP5.send(msg, dest);
}

// automatically called whenever osc message is received
void oscEvent(OscMessage m) {
  /* check if theOscMessage has the address pattern we are looking for. */
  if (m.checkAddrPattern("/wek/outputs")==true) {
    /* check if the typetag is the right one. */
    if (m.checkTypetag("f")) {
      /* extract the values from the osc message */
      circleX = m.get(0).floatValue();  // get the first osc argument
      circleY = m.get(1).floatValue();
      println(circleX, circleY);
    }
  }
}

import oscP5.*;
import netP5.*;
import controlP5.*;

OscP5 oscP5;
NetAddress dest;
ControlP5 cp5;
Accordion accordion;
int player = 0;
int computer = (int) random(1,3);
float m;
int mouth; // 1: papper, 2: scissor, 3: rock
//int result; // (User) 1: win, 2: draw, 3: lose
final int HowLongIsItWaiting1 = 900;
PImage img, img0, img1, img2, img3, img4, img5, img6, result; 


void setup() {
  size(1000, 1000);

  noStroke();
  noFill();
  oscP5 = new OscP5(this, 12000);
  dest = new NetAddress("127.0.0.1", 6448);
  img0 = loadImage("normal.jpg");
  img1 = loadImage("papper.png");  
  img2 = loadImage("scissor.png");
  img3 = loadImage("rock.png");
  img4 = loadImage("win.jpg");  
  img5 = loadImage("draw.jpg");
  img6 = loadImage("lose.jpg");
}

void draw() {
  
  background(255);
  imageMode(CENTER);
  
  if (player == 1){ //player = papper
    if (computer == 1 ) {//papper
      result = img5;
      image(img1, width/2, height/2);
    }
    else if (computer == 2) { //scissor
      result = img6;
      image(img2, width/2, height/2);
    }
    else if (computer == 3){ // rock
      result = img4;
      image(img3, width/2, height/2);
    }
  }
  
  else if (player == 2){ //player = scissor
    if (computer == 1 ) {//papper
      result = img4;
      image(img1, width/2, height/2);
    }
    else if (computer == 2) { //scissor
      result = img5;
      image(img2, width/2, height/2);
    }
    else if (computer == 3){ // rock
      result = img6;
      image(img3, width/2, height/2);
    }
  }
  
  else if (player == 3){ //player = rock
    if (computer == 1 ) {//papper
      result = img6;
      image(img1, width/2, height/2);
    }
    else if (computer == 2) { //scissor
      result = img4;
      image(img2, width/2, height/2);
    }
    else if (computer == 3){ // rock
      image(img3, width/2, height/2);
      result = img5;
    }
  }
  
  if (mousePressed) {
     image(result, width/2, height/2);
  }
  
  if (keyPressed){
    background(255);
    computer =(int)random(1,3);
  }
  
  
}

void oscEvent(OscMessage m) {
  if (m.checkAddrPattern("/wek/outputs")==true) {
    if (m.checkTypetag("f")) {
      mouth = (int)m.get(0).floatValue(); 
      println(mouth);
      if (mouth == 1) {
        player = 1;
      } else if (mouth == 2) {
        player = 2;
      } else if (mouth == 3){
        player = 3;
      }
    }
  }
}

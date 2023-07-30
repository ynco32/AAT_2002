import oscP5.*;
import netP5.*;

OscP5 oscP5;
NetAddress dest;

PVector positionCircle;
PVector velocityCircle;
PVector accelerationCircle;
int radiusCircle;
PVector positionRect; 
PVector velocityRect;

color foregroundColor = color(14,38,60);
color bgColor = color(51,78,121);
float widthRect;
float distance;

int lives = 10;


void setup() {
  oscP5 = new OscP5(this, 12000);
  dest = new NetAddress("127.0.0.1", 6448);
  fullScreen();
  background(100);

  radiusCircle = 30;
  positionCircle = new PVector(width / 2, height - radiusCircle);
  velocityCircle = new PVector(0, 0);
  accelerationCircle = new PVector(0, 1.4);
  
  widthRect = random(20, 60);
  positionRect = new PVector(width, height - widthRect);
  velocityRect = new PVector(random(-8, -10),0);
}

void draw() {
  background(100);
  if (lives == 0) {
    textSize(100);
    text("Game Over", 450, 300);
   }
   else {
     ellipse(positionCircle.x, positionCircle.y, 2 * radiusCircle, 2 * radiusCircle);
     velocityCircle.add(accelerationCircle);
     positionCircle.add(velocityCircle);

     if (positionCircle.y > height - radiusCircle) {
       velocityCircle = new PVector(0, 0);
       positionCircle.y = height - radiusCircle; 
     }

    if (distance < radiusCircle) {
      positionRect = new PVector(width, height - widthRect);
      velocityRect = new PVector(random(-4, -10), 0);
      widthRect = random(10, 60);
    }

    if (positionRect.x < 0) {
      positionRect = new PVector(width, height - widthRect);
      velocityRect = new PVector(random(-4, -10), 0);
      widthRect = random(20, 60);
    }
    rect(positionRect.x, positionRect.y, widthRect, widthRect);
    positionRect.add(velocityRect);
    distance = positionCircle.dist(positionRect);
    textSize(25);
    text(lives, 100, 170);
  
    textSize(30);
    text("Lives", 100, 140);
    if (distance < radiusCircle) {
      widthRect = random(20, 60);
       positionRect = new PVector(width, height - widthRect);
       velocityRect = new PVector(random(-2, -5),0);
       lives = lives - 1;
     }
  }
}
void oscEvent(OscMessage m) {
  m.print();

  if (m.checkAddrPattern("/output_1")==true) {
    if (positionCircle.y == height - radiusCircle) { 
    velocityCircle.add(0, -36);
    }
  }
}

//void mouseClicked() {
//  if (positionCircle.y == height - radiusCircle) { 
//    velocityCircle.add(0, -36);
//  }
//}


import controlP5.*;
ControlP5 cp5;
int sliderValue = 100;
Slider abc;
ArrayList<particle> Points = new ArrayList<particle>();
String word = "YUNJICHOE";
String line ="SOGANG UNIV. ART AND TECHNOLOGY CREATIVE BEYOND IMAGINATION";
PVector start  =new PVector(10, 60);
float tSize =200;
int index = 0;
float restZ = 0;
int F = 0;
float CTime=100; 
int PNum = 1500; 
color c;

void setup() {
  cp5 = new ControlP5(this);
   
  cp5.addSlider("Color")
     .setPosition(10,40)
     .setRange(0,20) 
     ;
     
   cp5.addSlider("Size of Text")
     .setPosition(10,90)
     .setSize(10,100)
     .setRange(100,250)
     .setNumberOfTickMarks(5)
     ;
     
   cp5.addSlider("Number of fire")
     .setPosition(10,60)
     .setRange(800, 2000) 
     ;
  c = color(sliderValue);
  PNum = (int) cp5.getController("Number of fire").getValue();
  tSize =cp5.getController("Size of Text").getValue();
  
  fullScreen();
  frameRate(30);
  background(0);
  textSize(tSize);

  fill(c);
  loadPixels();
  for (int i = 0; i < PNum; i++) {//creating the particles
    Points.add(new particle(random(width),random(height)));
  }
}

void draw(){
  background(0);
  int Len = word.length();
  PVector RealPix;
  if (restZ == 0){
    restZ = CTime;
    for (particle P : Points) {
      P.target = false;
      P.velocity.mult(0.35);
    }
    String[] Arr = line.split(" ");
    word=Arr[F];
    start.x = int(random(10,width-word.length()*tSize/1.45));
    start.y = int(random(10,height-tSize*1.3));
    fill(c);
    text(word, start.x, start.y+tSize);
    loadPixels();
    F++;
    if (F>=Arr.length){F=0;};
  }else if (restZ <= 5){
    for (particle P : Points) {
      P.velocity.mult(0.8);
    }
  }
  restZ-=1;
  
  
  for (int i = 0; i < 13 * PNum / (CTime-30); i++) {
    RealPix=  new PVector(int(random(start.x, start.x+Len*tSize)), int(random(start.y, start.y+tSize)));
    int pixNr =int(RealPix.y * width + RealPix.x);
    color b= pixels[pixNr];
    
    if ((c == b) && (restZ < CTime-20 ) && ( restZ >= 10 )){
      particle Actual = Points.get(index);
      if (Actual.target==false){
        Actual.target=true;
        PVector desired = PVector.sub(RealPix, Actual.location);
        desired.div(restZ);
        Actual.velocity= desired;//kicking the particle in the direction of the point
      }
      
      if (mousePressed){
        index++;
        index=index%PNum;
      }
    }
  }
  
  if (keyPressed) {
    if (key == ' ' ){
  run();
    }
  }
}


void run(){
    for (particle P : Points) {
      stroke(255,255,255, 128/sqrt(P.velocity.mag()+1));
       P.location.add(P.velocity);
      line(P.location.x, P.location.y, P.location.x+P.velocity.x, P.location.y+P.velocity.y);
    }
  }

PImage[] img = new PImage[10];
PImage newImg;
float[] greenValue = new float[10];
float greenFin = 0;
int j = 0;
int a = 1;
int b = 0;
int c = 0;
int d = 1;
int w = 4;
int h = 40;
int selected = 0;

void setup() {
  size(500, 500);
  img[0] = loadImage("fusion.jpg"); 
  img[1] = loadImage("fig.jpg");
  img[2] = loadImage("julau.jpg");
  img[3] = loadImage("glory.jpg");
  img[4] = loadImage("asura.jpg");
  img[5] = loadImage("das.jpg");
  img[6] = loadImage("mel.jpg");
  img[7] = loadImage("pinkprincess.jpg");
  img[8] = loadImage("sam.jpg");
  img[9] = loadImage("syngo.jpg");
   
  newImg = createImage(500, 500, RGB);
  newImg.loadPixels();
  
//  color newColor;
//  //for 'g' function: take a lot of loading time
//  for (int y = 0; y < 500; y++){
//    for (int x = 0; x < 500; x++){
//      int indexSrc = x + y*500;
//      for (int i = 0; i < 10; i++){
//        img[i].loadPixels();
//        loadPixels();
//        color c = img[i].pixels[indexSrc];
//        greenValue[i] = green(c) * 0.01;
//        greenFin += greenFin;
//        if (greenFin > 265) greenFin = 265;
//      }
//        color sel = img[selected].pixels[indexSrc];
//        float r = red(sel) * 0.1;
//        float b = blue(sel)* 0.1;
//      newColor = color (r, greenFin, b);
//      newImg.pixels[indexSrc] = newColor;
//    }
//  }
//  newImg.updatePixels();
//}

void draw() {
  background(0);

  for (int x = 0; x < width; x+=w*2) {
    for (int y = 0; y < height; y+=h*2){
      //copy(원본이미지 xy, 자르는 좌표xy, 붙이는 좌표xy, 가로, 세로)
      copy(img[a], x, y, w, h, x, y, w, h);
      copy(img[b], x, y, w, h, x+w, y, w, h);
      copy(img[c], x, y+h, w, h, x, y+h, w, h);
      copy(img[d], x, y+h, w, h, x+w, y+h, w, h);
    }
  }
  print(a, b, c, d);
  print(" ");
  print(w, h);
  print("\n");
}

void keyPressed(){
  //사진고르기
  if (key == 'a'){
    a++;
    if ( a > 10) { a = 0; }
  }
  else if (key == 'b'){
    b++;
    if ( b > 10) { b = 0; }
  }
  else if (key == 'c'){
    c++;
    if ( c > 10) { c = 0; }
  }
  else if (key == 'd'){
    d++;
    if ( d > 10) { d = 0; }
  }
  
  //간격 조절
  //가로
  else if (keyCode == RIGHT) w++;
  else if (keyCode == LEFT) w--;
  //세로
  else if (keyCode == DOWN) h-=10;
  else if (keyCode == UP) h += 10;
  
  //else if (key == 'g') {
  //  selected = a;
  //  image(newImg, 0,0);
  //}
  
}

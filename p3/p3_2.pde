PImage[] img = new PImage[10];
PImage newImg;
float[] greenValue = new float[10];
float greenFin = 0;

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
  
  for (int i = 0; i < 10; i++){
    img[i].loadPixels();
    loadPixels();
    for (int y = 0; y < img[i].height; y++){
      for (int x = 0; x <img[i].width; x++){
        int indexSrc = x + y*img[i].width;
        color c = img[i].pixels[indexSrc];
        greenValue[i] = green(c);
        greenFin += greenValue[i] * 0.1;
        if (greenFin >255) greenFin = 255;
        color newColor = color(0, greenFin, 0);
        newImg.pixels[i] = newColor;
      }
    }
  }
  
  newImg.updatePixels();
}

void draw() {
  background(0);
  image(newImg, 0, 0);
}

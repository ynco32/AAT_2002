class Word implements Comparable {
  float speed; 
  int r;      
  String ww;
  int count;
  float x, y;
  color c;
  boolean textshow = false;
  int sum = 0;
  int wordTime;
  boolean wordDisplay;
  
  Word(String txt) {
    ww = txt;
    count = 1;
    c = color(random(0, 255), random(0, 255), random(0, 255));
    x = random(width);      
    y = -r*4;        
    speed = random(1, 7); 
    wordTime = millis() + 3000;
    wordDisplay = true;
  }
  
  
  void move() {
    y += speed;
  }
  
  void setSize(int s) {
    r = s;
  }

  void display() {
    if (textshow){
      fill(c);
      textSize(15);
      text(ww, x, y);
    }
    fill(c);
    noStroke();
    //ellipse(x, y, r, r);
    for (int i = 2; i < r; i++ ) {
      ellipse(x, y + i*4, i*2, i*2);
      sum += i*4; 
    }
  }
  
  void wordpop(){
    if ( millis() > wordTime ) {
    wordDisplay = false;
  }
    pushStyle();
    textSize(28);
    fill(255);
    stroke(0);
    rect(20, height - 60, width-40, 40);
    fill(0);
    text(ww.toUpperCase(), 30, height - 30);
    popStyle();
  }
  
  void caught() {
    speed = 0; 
    y = -1000;
  }

  boolean reachedBottom() {
    if (y > height + r*4) { 
      return true;
    } else {
      return false;
    }
  }

  int compareTo(Object o)
  {
    Word other = (Word)o;
    if (other.count > count) {  
      return 1;
    }
    if (other.count == count) {
      return 0;
    } else {
      return -1;
    }
  }
}

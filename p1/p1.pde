/*
project #1 Yunji Choe
Divide one Large rectangle into smaller sqare. One square consists of 5 smaller rectangles. (whether in vertical/horizontal shape)
As they go to the bottom, the color of the square gets darker
*/

void setup() 
{ 
  size(1000, 1000); 
  stroke(255); 
  background(255);
} 

int rs = 0;     

void draw() 
{ 
  int res = 50;  
  
  randomSeed( rs );
  
  for (int x=0; x<width; x+=res) { 
    
    for (int y=0; y<height/4; y+=res) { 
      int rectShape = int(random(2));
      if (rectShape == 0) {
        rectVert(x, y);
      }
      else if (rectShape == 1){
        rectHori(x,y);
    }
  }
  for (int y = height/4; y < height/2; y+=res) { 
    int rectShape = int(random(2));
      if (rectShape == 0) {
        rectVert2(x, y);
      }
      else if (rectShape == 1){
        rectHori2(x,y);
    }
  }
  
  for (int y=height/2; y<height/4*3; y+=res) { 
    int rectShape = int(random(2));
      if (rectShape == 0) {
        rectVert3(x, y);
      }
      else if (rectShape == 1){
        rectHori3(x,y);
    }
  }
  for (int y = height/4*3; y < height; y+=res) { 
    int rectShape = int(random(2));
      if (rectShape == 0) {
        rectVert4(x, y);
      }
      else if (rectShape == 1){
        rectHori4(x,y);
    }
  }
}
}


void mousePressed() {
  rs = millis();

}



void rectVert(int a, int b)
{
  int r = int(random(5)); 
      if (r == 0) { 
        fill(230);
        rect(a, b, 10, 50);
        rect(a+10, b, 10, 50);
        rect(a+20, b, 10, 50);
        rect(a+30, b, 10, 50);
        fill(100);
        rect(a+40, b, 10, 50);
      } else if (r == 1) { 
        fill(230);
        rect(a, b, 10, 50);
        rect(a+10, b, 10, 50);
        rect(a+20, b, 10, 50);
        fill(100);
        rect(a+30, b, 10, 50);
        fill(230);
        rect(a+40, b, 10, 50);
      } else if (r == 2) { 
        fill(230);
        rect(a, b, 10, 50);
        rect(a+10, b, 10, 50);
        fill(100);
        rect(a+20, b, 10, 50);
        fill(230);
        rect(a+30, b, 10, 50);
        rect(a+40, b, 10, 50);
      } else if (r == 3) { 
        fill(230);
        rect(a, b, 10, 50);
        fill(100);
        rect(a+10, b, 10, 50);
        fill(230);
        rect(a+20, b, 10, 50);
        rect(a+30, b, 10, 50);
        rect(a+40, b, 10, 50);
      }else if (r == 4) { 
        fill(100);
        rect(a, b, 10, 50);
        fill(230);
        rect(a+10, b, 10, 50);
        rect(a+20, b, 10, 50);
        rect(a+30, b, 10, 50);
        rect(a+40, b, 10, 50);
      } 
    
}

void rectHori(int a, int b)
{
  int r = int(random(5)); 
      if (r == 0) { 
        fill(230);
        rect(a, b, 50, 10);
        rect(a, b+10, 50, 10);
        rect(a, b+20, 50, 10);
        rect(a, b+30, 50, 10);
        fill(100);
        rect(a, b+40, 50, 10);
      } else if (r == 1) { 
        fill(230);
        rect(a, b, 50, 10);
        rect(a, b+10, 50, 10);
        rect(a, b+20, 50, 10);
        fill(100);
        rect(a, b+30, 50, 10);
        fill(230);
        rect(a, b+40, 50, 10);
      } else if (r == 2) { 
        fill(230);
        rect(a, b, 50, 10);
        rect(a, b+10, 50, 10);
        fill(100);
        rect(a, b+20, 50, 10);
        fill(230);
        rect(a, b+30, 50, 10);
        rect(a, b+40, 50, 10);
      } else if (r == 3) { 
       fill(230);
        rect(a, b, 50, 10);
        fill(100);
        rect(a, b+10, 50, 10);
        fill(230);
        rect(a, b+20, 50, 10);
        rect(a, b+30, 50, 10);
        rect(a, b+40, 50, 10);
      }else if (r == 4) { 
        fill(100);
        rect(a, b, 50, 10);
        fill(230);
        rect(a, b+10, 50, 10);
        rect(a, b+20, 50, 10);
        rect(a, b+30, 50, 10);
        rect(a, b+40, 50, 10);
      } 
}

void rectVert2(int a, int b)
{
  int r = int(random(5)); 
      if (r == 0) { 
        fill(230);
        rect(a, b, 10, 50);
        rect(a+10, b, 10, 50);
        rect(a+20, b, 10, 50);
        fill(100);
        rect(a+30, b, 10, 50);
        rect(a+40, b, 10, 50);
      } else if (r == 1) { 
        fill(230);
        rect(a, b, 10, 50);
        rect(a+10, b, 10, 50);
        fill(100);
        rect(a+20, b, 10, 50);
        fill(100);
        rect(a+30, b, 10, 50);
        fill(230);
        rect(a+40, b, 10, 50);
      } else if (r == 2) { 
        fill(230);
        rect(a, b, 10, 50);
        fill(100);
        rect(a+10, b, 10, 50);
        rect(a+20, b, 10, 50);
        fill(230);
        rect(a+30, b, 10, 50);
        rect(a+40, b, 10, 50);
      } else if (r == 3) { 
        fill(230);
        rect(a, b, 10, 50);
        fill(100);
        rect(a+10, b, 10, 50);
        fill(230);
        rect(a+20, b, 10, 50);
        fill(100);
        rect(a+30, b, 10, 50);
        fill(230);
        rect(a+40, b, 10, 50);
      }else if (r == 4) { 
        fill(100);
        rect(a, b, 10, 50);
        fill(230);
        rect(a+10, b, 10, 50);
        rect(a+20, b, 10, 50);
        fill(100);
        rect(a+30, b, 10, 50);
        fill(230);
        rect(a+40, b, 10, 50);
      } 
    
}

void rectHori2(int a, int b)
{
  int r = int(random(5)); 
      if (r == 0) { 
        fill(230);
        rect(a, b, 50, 10);
        rect(a, b+10, 50, 10);
        rect(a, b+20, 50, 10);
        fill(100);
        rect(a, b+30, 50, 10);
        rect(a, b+40, 50, 10);
      } else if (r == 1) { 
        fill(230);
        rect(a, b, 50, 10);
        fill(100);
        rect(a, b+10, 50, 10);
        fill(230);
        rect(a, b+20, 50, 10);
        fill(100);
        rect(a, b+30, 50, 10);
        fill(230);
        rect(a, b+40, 50, 10);
      } else if (r == 2) { 
        fill(230);
        rect(a, b, 50, 10);
        fill(100);
        rect(a, b+10, 50, 10);
        rect(a, b+20, 50, 10);
        fill(230);
        rect(a, b+30, 50, 10);
        rect(a, b+40, 50, 10);
      } else if (r == 3) { 
       fill(230);
        rect(a, b, 50, 10);
        fill(100);
        rect(a, b+10, 50, 10);
        fill(230);
        rect(a, b+20, 50, 10);
        fill(100);
        rect(a, b+30, 50, 10);
        rect(a, b+40, 50, 10);
      }else if (r == 4) { 
        fill(100);
        rect(a, b, 50, 10);
        fill(230);
        rect(a, b+10, 50, 10);
        rect(a, b+20, 50, 10);
        rect(a, b+30, 50, 10);
        fill(100);
        rect(a, b+40, 50, 10);
      } 
}

void rectVert3(int a, int b)
{
  int r = int(random(5)); 
      if (r == 0) { 
        fill(230);
        rect(a, b, 10, 50);
        rect(a+10, b, 10, 50);
        fill(100);
        rect(a+20, b, 10, 50);
        fill(230);
        rect(a+30, b, 10, 50);
        fill(100);
        rect(a+40, b, 10, 50);
      } else if (r == 1) { 
        fill(100);
        rect(a, b, 10, 50);
        fill(230);
        rect(a+10, b, 10, 50);
        fill(100);
        rect(a+20, b, 10, 50);
        fill(230);
        rect(a+30, b, 10, 50);
        fill(100);
        rect(a+40, b, 10, 50);
      } else if (r == 2) { 
        fill(100);
        rect(a, b, 10, 50);
        rect(a+10, b, 10, 50);
        fill(230);
        rect(a+20, b, 10, 50);
        rect(a+30, b, 10, 50);
        fill(230);
        rect(a+40, b, 10, 50);
      } else if (r == 3) { 
        fill(230);
        rect(a, b, 10, 50);
        fill(100);
        rect(a+10, b, 10, 50);
        fill(230);
        rect(a+20, b, 10, 50);
        fill(100);
        rect(a+30, b, 10, 50);
        rect(a+40, b, 10, 50);
      }else if (r == 4) { 
        fill(100);
        rect(a, b, 10, 50);
        fill(230);
        rect(a+10, b, 10, 50);
        fill(100);
        rect(a+20, b, 10, 50);
        rect(a+30, b, 10, 50);
        fill(230);
        rect(a+40, b, 10, 50);
      } 
    
}

void rectHori3(int a, int b)
{
  int r = int(random(5)); 
      if (r == 0) { 
        fill(230);
        rect(a, b, 50, 10);
        fill(100);
        rect(a, b+10, 50, 10);
        rect(a, b+20, 50, 10);
        fill(230);
        rect(a, b+30, 50, 10);
        fill(100);
        rect(a, b+40, 50, 10);
      } else if (r == 1) { 
        fill(100);
        rect(a, b, 50, 10);
        rect(a, b+10, 50, 10);
        rect(a, b+20, 50, 10);
        fill(230);
        rect(a, b+30, 50, 10);
        rect(a, b+40, 50, 10);
      } else if (r == 2) { 
        fill(230);
        rect(a, b, 50, 10);
        rect(a, b+10, 50, 10);
        fill(100);
        rect(a, b+20, 50, 10);
        fill(230);
        rect(a, b+30, 50, 10);
        rect(a, b+40, 50, 10);
      } else if (r == 3) { 
       fill(100);
        rect(a, b, 50, 10);
        fill(230);
        rect(a, b+10, 50, 10);
        fill(100);
        rect(a, b+20, 50, 10);
        rect(a, b+30, 50, 10);
        fill(230);
        rect(a, b+40, 50, 10);
      }else if (r == 4) { 
        fill(100);
        rect(a, b, 50, 10);
        fill(230);
        rect(a, b+10, 50, 10);
        fill(100);
        rect(a, b+20, 50, 10);
        fill(230);
        rect(a, b+30, 50, 10);
        fill(100);
        rect(a, b+40, 50, 10);
      } 
}
void rectVert4(int a, int b)
{
  int r = int(random(5)); 
      if (r == 0) { 
        fill(100);
        rect(a, b, 10, 50);
        rect(a+10, b, 10, 50);
        rect(a+20, b, 10, 50);
        rect(a+30, b, 10, 50);
        fill(230);
        rect(a+40, b, 10, 50);
      } else if (r == 1) { 
        fill(100);
        rect(a, b, 10, 50);
        rect(a+10, b, 10, 50);
        rect(a+20, b, 10, 50);
        fill(230);
        rect(a+30, b, 10, 50);
        fill(100);
        rect(a+40, b, 10, 50);
      } else if (r == 2) { 
        fill(100);
        rect(a, b, 10, 50);
        rect(a+10, b, 10, 50);
        fill(230);
        rect(a+20, b, 10, 50);
        fill(100);
        rect(a+30, b, 10, 50);
        rect(a+40, b, 10, 50);
      } else if (r == 3) { 
        fill(100);
        rect(a, b, 10, 50);
        fill(230);
        rect(a+10, b, 10, 50);
        fill(100);
        rect(a+20, b, 10, 50);
        rect(a+30, b, 10, 50);
        rect(a+40, b, 10, 50);
      }else if (r == 4) { 
        fill(230);
        rect(a, b, 10, 50);
        fill(100);
        rect(a+10, b, 10, 50);
        rect(a+20, b, 10, 50);
        rect(a+30, b, 10, 50);
        rect(a+40, b, 10, 50);
      } 
    
}

void rectHori4(int a, int b)
{
  int r = int(random(5)); 
      if (r == 0) { 
        fill(100);
        rect(a, b, 50, 10);
        rect(a, b+10, 50, 10);
        rect(a, b+20, 50, 10);
        rect(a, b+30, 50, 10);
        fill(230);
        rect(a, b+40, 50, 10);
      } else if (r == 1) { 
        fill(100);
        rect(a, b, 50, 10);
        rect(a, b+10, 50, 10);
        rect(a, b+20, 50, 10);
        fill(230);
        rect(a, b+30, 50, 10);
        fill(100);
        rect(a, b+40, 50, 10);
      } else if (r == 2) { 
        fill(100);
        rect(a, b, 50, 10);
        rect(a, b+10, 50, 10);
        fill(230);
        rect(a, b+20, 50, 10);
        fill(100);
        rect(a, b+30, 50, 10);
        rect(a, b+40, 50, 10);
      } else if (r == 3) { 
       fill(100);
        rect(a, b, 50, 10);
        fill(230);
        rect(a, b+10, 50, 10);
        fill(100);
        rect(a, b+20, 50, 10);
        rect(a, b+30, 50, 10);
        rect(a, b+40, 50, 10);
      }else if (r == 4) { 
        fill(230);
        rect(a, b, 50, 10);
        fill(100);
        rect(a, b+10, 50, 10);
        rect(a, b+20, 50, 10);
        rect(a, b+30, 50, 10);
        rect(a, b+40, 50, 10);
      } 
}

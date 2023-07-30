class Turtle {

  String todo;
  float len;
  float theta;

  Turtle(String s, float l, float t) {
    todo = s;
    len = l; 
    theta = t;
  } 

  void render() {
    stroke(0, 175);
    for (int i = 0; i < todo.length(); i++) {
      char c = todo.charAt(i);
      if (c == 'F') {
        line(0, 0, len, 0);
        stroke(26,100,23);
        translate(len, 0);
      } else if (c == '+') {
        rotate(theta);
      } else if (c == '-') {
        rotate(-theta);
      } else if (c == '[') {
        pushMatrix();
      } else if (c == ']') {
        popMatrix();
      }
      else if (c == 'L'){
        fill(10,200,45,50);
        noStroke();
        ellipse(0, 0, 10, 30);
        stroke(26,100,23);
      }
      else if (c == 'P'){
        fill(245, 55, 205);
        circle(0, 0, 10);
      }
    }
  }

  void setLen(float l) {
    len = l;
  } 

  void changeLen(float percent) {
    len *= percent;
  }

  void setToDo(String s) {
    todo = s;
  }
}

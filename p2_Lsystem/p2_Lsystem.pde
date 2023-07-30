LSystem lsys;
Turtle turtle;

String S = "F";
float angleOffset = radians(30);

void setup() {
  size(900, 600); 
  stroke(26,100,74);
  
  Rule[] ruleset = new Rule[1];
  ruleset[0] = new Rule('F',"FFF+[++LLFLF]-[--LFLFLF]");
  
  lsys = new LSystem("F",ruleset);
  turtle = new Turtle(lsys.getSentence(), height/4, PI/8);
}

void draw() {
  background(255);                     
  translate(width/2, height);
  rotate( -HALF_PI );
  //float branchLen = map(mouseY, 0, height, 30, 0.1);
  //render( S, branchLen );
  turtle.render();
  noLoop();
}


int counter = 0;

void mousePressed(){
  if (counter < 5){
    pushMatrix();
    lsys.generate();
    turtle.setToDo(lsys.getSentence());
    turtle.changeLen(0.5);
    popMatrix();
    redraw();
    counter++;
  }
}

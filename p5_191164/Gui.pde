RadioButton r1;
char tempalpha;

 void gui() {
  cp5 = new ControlP5(this);

  Group g3 = cp5.addGroup("Controller")
    .setBackgroundColor(color(0, 64))
    .setBackgroundHeight(200)
    ;

  cp5.addSlider("Catcher Size")
    .setPosition(10, 20)
    .setSize(100, 20)
    .setRange(10, 100)
    .setValue(0)
    .moveTo(g3)
    ;

  r1 = cp5.addRadioButton("alphabet")
     .setPosition(10,50)
     .setItemWidth(20)
     .setItemHeight(20)
     .addItem("a", 0)
     .addItem("b", 1)
     .addItem("c", 2)
     .addItem("d", 3)
     .addItem("e", 4)
     .setColorLabel(color(255))
     .activate(2)
     .moveTo(g3)
     ;
 
    
  accordion = cp5.addAccordion("acc")
    .setPosition(0, 0)
    .setWidth(200)
    .addItem(g3)
    ;

  cp5.mapKeyFor(new ControlKey() {
    public void keyEvent() {
      accordion.open(0, 1, 2, 3);
    }
  }
  , 'o');
  cp5.mapKeyFor(new ControlKey() {
    public void keyEvent() {
      accordion.close(0, 1, 2, 3);
    }
  }
  , 'c');
  cp5.mapKeyFor(new ControlKey() {
    public void keyEvent() {
      accordion.setWidth(300);
    }
  }
  , '1');
  cp5.mapKeyFor(new ControlKey() {
    public void keyEvent() {
      accordion.setPosition(0, 0);
      accordion.setItemHeight(190);
    }
  }
  , '2'); 
  cp5.mapKeyFor(new ControlKey() {
    public void keyEvent() {
      accordion.setCollapseMode(ControlP5.SINGLE);
    }
  }
  , '3');
  
  accordion.setCollapseMode(Accordion.MULTI);
 
}

void alphabet(int theA) {
  switch(theA) {
    case(0): tempalpha='a'; break;
    case(1): tempalpha='b'; break;
    case(2): tempalpha='c'; break;
    case(3): tempalpha='d'; break;
    case(4): tempalpha='e'; break;
  }
} 

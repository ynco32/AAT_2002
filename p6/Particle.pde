class particle{
  
  PVector location;
  PVector velocity;
  boolean target = false;
  
  particle(float x, float y) {
    location = new PVector(x, y);
    velocity = new PVector(0.0, 0.0);
  }
  

}

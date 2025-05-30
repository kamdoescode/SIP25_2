class Particle{
  PVector position;
  PVector velocity;
  PVector acceleration;
  float lifespan;
  float decay;
  
  Particle(float x, float y){
    position = new PVector(x,y);
    //x direction positive values rigthward
    //y direction slight randomness
    velocity = new PVector(random(-1, 1), random(-1, 1));
    acceleration = new PVector();
    lifespan = 350;
    decay = 1;
  }
  
  void addForce(PVector f){
    acceleration.add(f);
  }
  
  //if the particle lifespan is over, being decay
  boolean expired() {
    return lifespan < 0;
  }
  
  void update(){
    lifespan -= decay;
    velocity.add(acceleration);
    position.add(velocity);
    
    //resets the accel vector to 0
    acceleration.mult(0);
  }
  
  void display(){
    pushMatrix();
    
    translate(position.x, position.y);
    
    noStroke();
    fill(255);
    
    circle(0,0,4);
    
    popMatrix();
  }
}

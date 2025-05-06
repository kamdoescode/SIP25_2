class Ball{
  PVector position;
  PVector velocity;
  
  float radius, m;
  
  Ball(float x, float y, float r_){
    position = new PVector(x,y);
    velocity = PVector.random2D();
    velocity.mult(3);
    radius = r_;
    m = radius*.1;
}


void update(){
  position.add(velocity);
}

void checkBoundaryCollision(){
  //left + right walls with 10% speed loss
  if(position.x > width - radius){
    position.x = width - radius;
    velocity.x *= -0.9;
  } else if(position.x < radius){
    position.x = radius;
    velocity.x *= -0.9;
  }
  
  //top wall 
  if(position.y < radius){
    position.y = radius;
    velocity.y *= -1;
  }
}

void checkRacketCollision(Racket racket){
  //check vertical alignment 
  if(position.y + radius < racket.y || 
     position.y - radius > racket.y + racket.h) return;
  //check horizontal alignment
  if(position.x + radius >= racket.x && position.x  - radius <= racket.x + racket.w){
    velocity.y *= -1;
    velocity.x += racket.speed * 0.5; //add racket influence
    position.y = racket.y - radius; //prevent sticking
  }
 }
 
 void display(){
   fill(202, 255, 69);
   ellipse(position.x, position.y, radius * 2, radius * 2);
 }
}

//new racket class
class Racket{
  float x, y, w, h, speed;
  
  Racket(float x_, float y_, float w_, float h_) {
    x = x_;
    y = y_;
    w = w_;
    h = h_;
  }
  
  void update(){
    //follow mouse horizontally
    float newX = mouseX - w/2;
    speed = newX - x; //calculate movement speed
    x = constrain(newX, 0, width - w);
  }
  
  void display(){
    fill(255);
    rect(x, y, w, h);
  }
}

class Ball{
  PVector position;
  float velocityY;
  float radius, m;
  float gravity = 0.5; 
  
  
  Ball(float x, float y, float r_){
    position = new PVector(x,y);
    velocityY = 0;
    radius = r_;
    m = radius*.1;
}


void update(){
  velocityY += gravity;
  position.y += velocityY;
}


void checkFloorCollision(){
  if (position.y > height - radius) {
    position.y = height - radius;      // place the ball on the floor
    velocityY *= -0.8;                 // reverse and reduce velocity for bounce
    if (abs(velocityY) < 1) {          //stop bouncing if very slow
      velocityY = 0;
    }
  }
}
void checkRacketCollision(Racket racket){
 // check for collision with racket (vertical and horizontal overlap)
    if (position.y + radius >= racket.y && 
        position.y + radius <= racket.y + racket.h &&
        position.x >= racket.x && 
        position.x <= racket.x + racket.w &&
        velocityY > 0) { // only if falling down
      // hit the ball upward
      velocityY = -15; 
      position.y = racket.y - radius; // reposition to avoid sticking
   }
  }
 
 void display(){
   fill(202, 255, 69);
   noStroke();
   ellipse(position.x, position.y, radius * 2, radius * 2);
 }
}

//new racket class
class Racket{
  float x, y, w, h, speed;
  float angle = 0;         // current angle in radians
  float swingTarget = 0;   // target angle (0 = rest, negative = swing up)
  boolean swinging = false;
  Racket(float x_, float y_, float w_, float h_) {
    x = x_;
    y = y_;
    w = w_;
    h = h_;
  }
  
  void update(){
    // follow mouse horizontally
    float newX = mouseX - w/2;
    speed = newX - x; // calculate movement speed
    x = constrain(newX, 0, width - w);
    
    // follow mouse vertically
   y = mouseY - h/2;

  // animate angle towards target
  float swingSpeed = 0.2;
  angle += (swingTarget - angle) * swingSpeed;

  // if swing is done, reset
  if (swinging && abs(angle - swingTarget) < 0.05) {
    if (swingTarget != 0) {
      // after reaching swing, return to rest
      swingTarget = 0;
    } else {
      swinging = false;
    }
  }
}

void swing() {
  if (!swinging) {
    swingTarget = PI/4; // 45 degrees upwards
    swinging = true;
  }
}
  
  
void display(){
  pushMatrix();
  translate(x + w/2, y + h); // pivot at the bottom center of the racket
  rotate(angle);
  noStroke();
  fill(255);
  rectMode(CENTER);
  rect(0, -h/2, w, h); // draw racket relative to pivot
  popMatrix();
  }
}

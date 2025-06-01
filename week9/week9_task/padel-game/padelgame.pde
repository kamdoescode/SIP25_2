// week 9 task: game - padel ball
// bounce the ball on the racket
// click mouse to hit the racket up
Ball ball;
Racket racket;

void setup(){
  size(600,400);
  ball = new Ball(width/2, height/2, 16);
  racket = new Racket(width/2, height/2, 100, 15);

}


void draw(){
  background(179, 95, 62);
  //update objects
  racket.update();
  ball.update();
  
  
  //collision checks
  ball.checkFloorCollision();
  ball.checkRacketCollision(racket);
  
  // rest if ball goes below
  if(ball.position.y > height + ball.radius){
    ball = new Ball(width/2, height/2, 20);
  }
  // draw objects
  ball.display();
  racket.display();
}

void mousePressed() {
  racket.swing();
}

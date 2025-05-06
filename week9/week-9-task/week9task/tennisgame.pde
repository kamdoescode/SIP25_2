// week 9 task: game - tennis

Ball ball;
Racket racket;

void setup(){
  size(800,600);
  ball = new Ball(width/2, height/2, 20);
  racket = new Racket(width/2 - 75, height - 30, 150, 20);
}


void draw(){
  background(0);
  
  //update objects
  racket.update();
  ball.update();
  
  
  //collision checks
  ball.checkBoundaryCollision();
  ball.checkRacketCollision(racket);
  
  //rest if ball goes below
  if(ball.position.y > height + ball.radius){
    ball = new Ball(width/2, height/2, 20);
  }
  //draw objects
  ball.display();
  racket.display();
}

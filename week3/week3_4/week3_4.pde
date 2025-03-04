void setup(){
  size(400,400);
  background(247, 243, 228);
  ellipseMode(CENTER);
}
void draw(){
  //yellow beam
  pushMatrix();
   fill(250, 229, 147);
   noStroke();
   beginShape();
   vertex(0, 300);
   vertex(0, 400);
   vertex(400, 10);
   vertex(400, 0);
   endShape(CLOSE);
  popMatrix();
  //green beam
  pushMatrix();
   fill(29, 184, 173);
   noStroke();
   beginShape();
   vertex(60, 0);
   vertex(110, 0);
   vertex(400, 250);
   vertex(400, 380);
   endShape(CLOSE);
  popMatrix();
  //black ring
  pushMatrix();
   noFill();
   strokeWeight(20);
   stroke(0);
   ellipse(width/2, height/2, 350, 350);
  popMatrix();
  //inside circles
   
}

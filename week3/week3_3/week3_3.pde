
void setup(){
   size(400,400);
   blendMode(BLEND);
   rectMode(CENTER);
   ellipseMode(CENTER);
   background(0);
   
   noStroke();
   
   blendMode(DIFFERENCE);
   fill(255);
   
   rect(width/2, height/2, 100, 100);
   
   pushMatrix();
     translate((width/2) - 75, (height/2) - 75);
     drawTriangle();
     drawEllipse();
   popMatrix();
   
}

void drawTriangle() {
   triangle(0, 100, 100, 100, 50, 0);         
}

void drawEllipse(){
   ellipse(100, 110, 100, 100);
}

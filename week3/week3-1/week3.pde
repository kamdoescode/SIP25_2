float angleOne = 0;
float angleTwo = 0;
float angleThree = 0;
float angleFour = 0;
float angleFive = 0;
float xpos = 80;
float xstep = 60;

void setup(){
    size(400,400);
    rectMode(CENTER);
}

void draw(){
    background(235, 232, 225);
    
    pushMatrix();
      noStroke();
      fill(240, 108, 91);
      translate(xpos + (xstep *0), height/2);
      rotate(radians(angleOne));
      rect(0, 0, 50, 50);
      angleOne = angleOne + 1;
    popMatrix();
    pushMatrix();
      noStroke();
      fill(242, 187, 233);
      translate(xpos + (xstep *1), height/2);
      rotate(radians(angleTwo));
      rect(0, 0, 50, 50);
      angleTwo = angleTwo + 2;
    popMatrix();
    pushMatrix();
      noStroke();
      fill(200, 235, 181);
      translate(xpos + (xstep *2), height/2);
      rotate(radians(angleThree));
      rect(0, 0, 50, 50);
      angleThree = angleThree + 3;
    popMatrix();
    pushMatrix();
      noStroke();
      fill(157, 205, 224);
      translate(xpos + (xstep *3), height/2);
      rotate(radians(angleFour));
      rect(0, 0, 50, 50);
      angleFour = angleFour + 4;
    popMatrix();
    pushMatrix();
      noStroke();
      fill(245, 221, 149);
      translate(xpos + (xstep *4), height/2);
      rotate(radians(angleFive));
      rect(0, 0, 50, 50);
      angleFive = angleFive + 5;
    popMatrix();
}

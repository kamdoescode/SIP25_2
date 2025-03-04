// multiple rectangles using an array

float[] angles = {0, 0, 0, 0, 0};
float[] speeds = {1, 2, 3, 4, 5};

float xpos = 80;
float xstep = 60;

void setup() {
  size(400, 400);
  rectMode(CENTER);
}


void draw(){
  background(240, 239, 237);
  
  for(int i = 0; i<angles.length; i++){
    pushMatrix();
      noStroke();
      translate(xpos + (xstep * i), height/2);
      rotate(radians(angles[i]));
      rect(0, 0, 50, 50);
      angles[i] = angles[i] + speeds[i];
    popMatrix();
    
    switch(i) {
      case 4: 
        fill(240, 108, 91); //red
        break;
      case 0:
        fill(242, 187, 233); //pink
        break;
      case 1:
        fill(200, 235, 181); //green
        break;
      case 2:
        fill(157, 205, 224); //blue
        break;
      case 3:
        fill(245, 221, 149); //yellow
        break;
        
    }
  }
}

//main file 
// code based off of https://processing.org/examples/flocking.html
Flock flock;
float depth = 800;
boolean mouseAttract = true;

void setup() {
  size(900, 700, P3D);
  flock = new Flock();
  // Add an initial set of boids into the system
  for (int i = 0; i < 200; i++) {
    flock.addBoid(new Boid(random(width), random(height), random(depth)));
  }
}

void draw() {
  background(173,213,240); //blue
  //3d camera: orbit around the center based on mouseX
  float camX = width/2 + cos(radians(frameCount*0.3f)) * 500;
  float camY = height/2 + sin(radians(frameCount*0.2f)) * 200;
  float camZ = depth * 1.1f;
  camera(camX, camY, camZ, width/2, height/2, depth/2, 0, 1, 0);
  
  //lighting
  ambientLight(60, 60, 60);
  directionalLight(200, 200, 255, -0.5f, -1, -0.5f);
  pointLight(255, 255, 255, mouseX, mouseY, depth/2);
  
  PVector mouse3D = new PVector(mouseX, mouseY, depth/2);
  
  flock.run(this, width, height, depth, mouse3D);
  
}

void mouseClicked() {
  mouseAttract = !mouseAttract; // toggles attraction on/off
}

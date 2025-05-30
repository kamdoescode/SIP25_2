//press w to add wind

PVector gravity, addedWind;
PVector wind = getWindVector();
ArrayList<ParticleSystem> systems;
float windStrength = 1.0;
float windSpeed = 0.01f;

//creates natural wind using perlin noise
PVector getWindVector(){
  float noiseVal = noise(frameCount * windSpeed);
  float windX = map(noiseVal, 0, 1, -windStrength, windStrength);
  return new PVector(windX, 0);
}

void setup(){
  size(900,600);
  
  //the force of gravity
  gravity = new PVector(0, 0.005);
  //wind added by key interaction
  addedWind = new PVector(2.5, 0);
  systems = new ArrayList<ParticleSystem>();
}

void draw(){
  background(82, 87, 107);
  //system from above
  systems.add(new ParticleSystem(random(0, 900), random(0, -10), 5));
  //system from left
  systems.add(new ParticleSystem(random(-200, -210), random(0,600), 5));
  
  for (ParticleSystem ps : systems){
    ps.addForce(gravity);
    ps.addForce(wind);
    ps.update();
    ps.display();
  }
}

void keyPressed() {
  if (key == 'w') {
    for (ParticleSystem ps : systems) {
      ps.addForce(addedWind);
    }
  }
}
    

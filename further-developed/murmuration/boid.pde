// The Boid class
// base of code is from https://processing.org/examples/flocking.html
import processing.core.*;

class Boid {

  PVector position;
  PVector velocity;
  PVector acceleration; 
  float maxForce = 0.05f;
  float maxSpeed = 2.5f;
  float perception = 70;
  float size = 4;

  Boid(float x, float y, float z) {
     position = new PVector(x, y, z);
     velocity = PVector.random3D();
     velocity.mult(random(1.5f, maxSpeed));
     acceleration = new PVector();
  }


  void applyForce(PVector force) {
    acceleration.add(force);
  }

  // We accumulate a new acceleration each time based on three rules
  void flock(ArrayList<Boid> boids, PVector mouse3D) {
    PVector sep = separate(boids);   // Separation
    PVector ali = align(boids);      // Alignment
    PVector coh = cohesion(boids);   // Cohesion
    
    // Arbitrarily weight these forces
    sep.mult(2.5f);
    ali.mult(1.0f);
    coh.mult(0.8f);
    
    // Add the force vectors to acceleration
    applyForce(sep);
    applyForce(ali);
    applyForce(coh);
    
    //mouse attraction
    if (mouseAttract && mouse3D != null) {
      PVector seekMouse = seek(mouse3D);
      seekMouse.mult(2.5f); 
      applyForce(seekMouse);
}
  }

  // Method to update position
  void update() {
    // Update velocity
    velocity.add(acceleration);
    
    // Limit speed
    velocity.limit(maxSpeed);
    position.add(velocity);
    
    // Reset accelertion to 0 each cycle
    acceleration.mult(0);
    
  }
  

  // A method that calculates and applies a steering force towards a target
  // STEER = DESIRED MINUS VELOCITY
  PVector seek(PVector target) {
    PVector desired = PVector.sub(target, position);  // A vector pointing from the position to the target
    float d = desired.mag();
    desired.normalize();
    if (d < 100){
      float m = map(d, 0, 100, 0, maxSpeed);
      desired.mult(m);
    } else{
      desired.mult(maxSpeed);
    }

    // Steering = Desired minus Velocity
    PVector steer = PVector.sub(desired, velocity);
    steer.limit(maxForce);  // Limit to maximum steering force
    return steer;
  }

  void render(PApplet app) {
    app.pushMatrix();
    app.translate(position.x, position.y, position.z);
    
    //orient the boid in the direction of the velocity
    PVector axis = velocity.cross(new PVector(0, 1, 0));
    float angle = PVector.angleBetween(velocity, new PVector(0, 1, 0));
    if (axis.mag() > 0.001f){
      app.rotate(angle, axis.x, axis.y, axis.z); 
    }
    
    app.specular(200,200,200); //white light
    app.shininess(30);
    app.fill(82, 64, 51); //base color
    app.emissive(20, 10, 5); //glow
    app.noStroke();
    app.sphere(size);
    app.popMatrix();
  }

  // Wraparound
  void borders(float w, float h, float d) {
    if (position.x < -size) position.x = w + size;
    if (position.y < -size) position.y = h + size;
    if (position.z < 0) position.z = 0; //limiting the z distance
    if (position.x > w + size) position.x = -size;
    if (position.y > h + size) position.y = -size;
    if (position.z > d) position.z = d; //limiting the -z distance
  }

// *************************************
// methods used from https://processing.org/examples/flocking.html
// *************************************

  // Separation
  // Method checks for nearby boids and steers away
  PVector separate (ArrayList<Boid> boids) {
    float desiredseparation = size * 3.0f;
    PVector steer = new PVector();
    int count = 0;
    
    // For every boid in the system, check if it's too close
    for (Boid other : boids) {
      float d = PVector.dist(position, other.position);
      // If the distance is greater than 0 and less than an arbitrary amount (0 when you are yourself)
      if ((d > 0) && (d < desiredseparation)) {
        // Calculate vector pointing away from neighbor
        PVector diff = PVector.sub(position, other.position);
        diff.normalize();
        diff.div(d);        // Weight by distance
        steer.add(diff);
        count++;            // Keep track of how many
      }
    }
    // Average -- divide by how many
    if (count > 0) {
      steer.div((float)count);
    }

    // As long as the vector is greater than 0
    if (steer.mag() > 0) {
      // Implement Reynolds: Steering = Desired - Velocity
      steer.normalize();
      steer.mult(maxSpeed);
      steer.sub(velocity);
      steer.limit(maxForce);
    }
    return steer;
  }

  // Alignment
  // For every nearby boid in the system, calculate the average velocity
  PVector align (ArrayList<Boid> boids) {
    float neighbordist = perception;
    PVector sum = new PVector();
    int count = 0;
    for (Boid other : boids) {
      float d = PVector.dist(position, other.position);
      if ((d > 0) && (d < neighbordist)) {
        sum.add(other.velocity);
        count++;
      }
    }
    if (count > 0) {
      sum.div((float)count);
      // Implement Reynolds: Steering = Desired - Velocity
      sum.normalize();
      sum.mult(maxSpeed);
      PVector steer = PVector.sub(sum, velocity);
      steer.limit(maxForce);
      return steer;
    } 
    else {
      return new PVector();
    }
  }

  // Cohesion
  // For the average position (i.e. center) of all nearby boids, calculate steering vector towards that position
  PVector cohesion (ArrayList<Boid> boids) {
    float neighbordist = perception;
    PVector sum = new PVector();   // Start with empty vector to accumulate all positions
    int count = 0;
    for (Boid other : boids) {
      float d = PVector.dist(position, other.position);
      if ((d > 0) && (d < neighbordist)) {
        sum.add(other.position); // Add position
        count++;
      }
    }
    if (count > 0) {
      sum.div((float)count);
      return seek(sum);  // Steer towards the position
    } 
    else {
      return new PVector();
    }
  }
}

// *************************************
// methods used from https://processing.org/examples/flocking.html
// *************************************

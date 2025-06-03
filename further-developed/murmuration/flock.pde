// code based off of https://processing.org/examples/flocking.html
// The Flock (a list of Boid objects)
import processing.core.*;
import java.util.*;

class Flock {
  ArrayList<Boid> boids; // An ArrayList for all the boids

  Flock() {
    boids = new ArrayList<Boid>(); // Initialize the ArrayList
  }

  void run(PApplet app, float w, float h, float d, PVector mouse3D) {
    for (Boid b : boids) {
      b.flock(boids, mouse3D);
      b.update();
      b.borders(w, h, d);
      b.render(app);
    }
  }

  void addBoid(Boid b) {
    boids.add(b);
  }

}

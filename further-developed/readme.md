# Starling Murmuration/Flocking Simulation

## Operation
- Written in Processing 4.3 
- Download each file in ` Run `flocking.pde` in processing

<p>Following week 10's introduction to Particle Systems, I became interested in the topic and wanted to explore what other systems could be simulated through code.</p>
<p>I realized birds, specifically starlings, could be a particle system.  I've always been fascinated by starling murmurations, so I decided to execute their natural flocking abilities in code. </p>
<p> Starling murmurations can be represented through **Boids Algorithm**, which is based on 3 principles: **seperation, alignment, and cohesion.**  The birds movement follows these strict principles, which are relatively easy to implement in code.  I used Daniel Shiffman's code on Flocking as a basis for the sketch *(https://processing.org/examples/flocking.html)* </p>
<p> Based on my knowledge of coding particle systems and Daniel Shiffman's implementation of Boids Algorithm, I was able to create the starling murmuration.  However, I wanted to take this sketch further by putting it in 3D and adding interaction. </p>
<p> Following tutorials on 3D in Processing (https://processing.org/tutorials/p3d) I added the z parameter to the boids class to exist, move, and interact with 3D space. I chose to make the "birds" spheres for simplicity.  I also added lighting to simulate outdoors. </p>
<p> For interaction I decided to have the system follow the mouse but be able to turn this off/on with a click of the mouse </p>


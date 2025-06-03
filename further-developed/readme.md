# Starling Murmuration/Flocking Simulation

## Operation
- Written in Processing 4.3 
- Download each file in `murmuration` and run `flocking.pde` in Processing
- Drag the mouse around for the particles to follow
- Click the mouse to turn off/on the mouse attraction

## Design Notes
<p>Following week 10's introduction to Particle Systems, I became interested in the topic and wanted to explore what other systems could be simulated through code.</p>
<p>I realized birds, specifically starlings, could be a particle system.  I've always been fascinated by starling murmurations, so I decided to execute their natural flocking abilities in code. </p>
<p> Starling murmurations can be represented through Boids Algorithm, which is based on 3 principles: seperation, alignment, and cohesion.  The birds movement follows these strict principles, which are relatively easy to implement in code.  I used Daniel Shiffman's code on Flocking as a basis for the sketch (https://processing.org/examples/flocking.html) </p>
<p> Based on my knowledge of coding particle systems and Daniel Shiffman's implementation of Boids Algorithm, I was able to create the starling murmuration.  However, I wanted to take this sketch further by putting it in 3D and adding interaction. </p>
<p> Following tutorials on 3D in Processing (https://processing.org/tutorials/p3d) I added the z parameter to the boids class to exist, move, and interact with 3D space. I chose to make the "birds" spheres for simplicity.  I also added lighting to simulate outdoors. </p>
<p> For interaction I decided to have the system follow the mouse but be able to turn this off/on with a click of the mouse </p>

# Challenges
<p>I found the particles would fade back into the -z space too easily so I set a limit in the -z direction.  Now when the particles stray far back enough, they disappear and reappear in a closer position. </p>
<p> I wanted to use the mouse clicked to repel the particles from eachother as they clump up very quickly and you cant undo it.  I wasn't able to exactly impliment this, I tried adjusting the mouse attraction, increasing the seperation force multiplier, and reducing the cohesion multiplier but nothing seperated them as much as I'd like. I settled for turning off the mouse attraction because I thought it was the force of the mouse attraction keeping them together.</p>

# Future Changes
- I'd like to continue working on exploring particle systems and the physics of natural systems
- For this sketch I'd like to create custom 3D primitives in a shape similar to a starling and expierement with the implementation to make it as accurate and organic as possible. I think animating the camera to get a view inside or around the murmuration would be interesting as well
- I'm also interested in exploring Swarm Phase Transitions


# Other References and Resources
- https://natureofcode.com/particles/
- https://birdclub.club/en-eu/pages/starling-murmuration-simulator-for-ornithology-flocking-behavior
- https://www.siam.org/publications/siam-news/articles/simulating-the-dynamics-of-large-flocks-of-birds/
- https://boids.dan.onl/

# Week 10: Particle Systems

## Directory Contents
- Task can be found in `week10_task` 

## Week 10 Task:
- Written in Processing 4.3, no special libraries required. 
- Open `particle_snowstorm` in Processing and run.
- press the 'w' key to add wind

### Design Notes
- Wanted to replicate a blizzard using particle systems
- Used a second particle system off screen so that when the wind blows it brings in snow from off screen to make it look more natural\

### Challenges
- Struggled with limiting the amount of particles falling, so I had to set a limit using an if statement in line 28 of `ParticleSystem.pde` that removes a particle if the array is over a threshold of 15
- Was difficult to accurately represent gravity because snow is so light in mass, so had to play around with the value until I found a realistic looking falling speed
- As snow sways with wind when it falls, I had to add wind with perlin noise that would apply wind in random positive and negative values to each particle
# Week 2: Manipulating and Analysing Pixels 

## Directory Contents
<p>In class excersizes are in /week2_1 and /week2_2</p> 
<p>The task and image for week 2 can be found in /week2_task</p>

## Week 2 Task
- Written in Processing 4.3. No special libraries required.
- Run 'week2_task.pde' in Processing.

### Design Notes
- I decided to stretch the historgram across the width of the image and have height be restricted to the bottom bit rather than ontop of the image as I thought it looked better.
- I had challenges with spreading the seperate r,g,b histograms evenly across the width. I had to add 255 and 511 to i through each iteration in order for the new histogram to start at the right x point.
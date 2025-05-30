# Week 6: Digital Sound and Oscillation

## Directory Contents
- Task can be found in `week6_task`

## Week 6 Task
<p>Written in Processing 4.3 </p>
<p>Processing Sound Library required</p>

# Operation
<p>Run week6_task in Processing</p>
<p>Use the mouse to interact with the sound</p>
<p> press p to pause</p>
<p>press f to toggle filter</p>
<p> press m to mute</p>
<p> press TAB to switch views to FFT</p>

# Design Notes
- All oscillators are routed through a low-pass filter whose cutoff frequency is modulated by the LFO (low-frequency oscillator) and the mouse X position to create a mysterious texture
- The amplitude responds to the mouse Y position to provide real time shaping

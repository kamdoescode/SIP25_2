import processing.sound.*;
SoundFile sample1;
SoundFile sample2;
SoundFile sample3;
SoundFile sample4;
float bpm = 120; // beats per minute

float myFrameRate = 120 / 60; // frame rate = beats per second
int beatsPerPattern = 8;
int currentPattern = (frameCount / beatsPerPattern) % 2;


void setup() {
  size(640, 360);
  background(255);

  // Load a soundfile from the /data folder of the sketch and play it back
  // https://processing.org/reference/libraries/sound/SoundFile.html
  sample1 = new SoundFile(this, "kick_drum.wav");
  // set amplitude
  sample1.amp(1.0);
  // playback rate
  // * 2 for octave higher
  // -1 to pllay backwards
  sample1.rate(1.0);
  
  sample2 = new SoundFile(this, "snap_drum.wav");
  sample2.amp(5.0);
  
  sample3 = new SoundFile(this, "closed_highhat.wav");
  
  sample4 = new SoundFile(this, "clap.wav");
  sample4.amp(5.0);
  sample4.rate(1.0 * 1.2);
  
  frameRate(myFrameRate);
}

void draw() {
  background(random(255), random(255), random(255));
  
  
  // play every beat
  sample1.play();
  
  
   //play every fourth beat
  if (frameCount % 4 == 0) {
    sample2.play();
  }
  
  if (currentPattern == 0) {
    // Pattern A: beats 1 & 2, 80% chance
    if ((frameCount % 4 == 1 || frameCount % 4 == 2) && Math.random() < 0.8) {
        sample3.play();
    }
} else {
    // Pattern B: beats 3 & 4, 50% chance
    if ((frameCount % 4 == 3 || frameCount % 4 == 0) && Math.random() < 0.5) {
        sample4.play();
    }
  }
 
}

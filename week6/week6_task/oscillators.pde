import processing.sound.*;

// oscillators
SawOsc saw;
SinOsc sin;
TriOsc tri;

// filter
LowPass lpFilter;

// global sound object for handling volume
Sound s;

// analysis
Waveform waveform;
int waveformSamples = 512;
FFT fft;
int fftBands = 512;
float[] spectrum = new float[fftBands];

boolean paused = false;
boolean filterEnabled = true;
boolean muted = false;
boolean fftMode = false;

void setup() {
  size(600, 600);

  // set up global sound volume
  s = new Sound(this);
  s.volume(0.2);

  // set up oscillators
  saw = new SawOsc(this);
  sin = new SinOsc(this);
  tri = new TriOsc(this);

  // set up filter and connect oscillators
  lpFilter = new LowPass(this);
  lpFilter.process(saw);
  lpFilter.process(sin);
  lpFilter.process(tri);

  // start oscillators with slightly different frequencies
  saw.freq(220);
  saw.amp(0.2);
  saw.play();

  sin.freq(223); // slight detune
  sin.amp(0.15);
  sin.play();

  tri.freq(217); // slight detune
  tri.amp(0.15);
  tri.play();

  // analysis tools
  waveform = new Waveform(this, waveformSamples);
  waveform.input(saw); // analyze one oscillator for simplicity
  fft = new FFT(this, fftBands);
  fft.input(saw);
}

void draw() {
  if (!paused) {
    updateSound();

    fill(255);

    if (fftMode) {
      fftViz();
    } else {
      waveViz();
    }
  }
}

void updateSound() {
  // evolving filter
  float filterBase = 400;
  float filterRange = 2000;
  float filterLFO = sin(frameCount * 0.01) * 0.5 + 0.5; // LFO between 0 and 1
  float filterFreq = filterBase + filterRange * filterLFO + map(mouseX, 0, width, 0, 2000);
  lpFilter.freq(filterFreq);

  // amplitude modulation with mouseY for interaction
  float amp = map(mouseY, height, 0, 0.05, 0.3);
  saw.amp(amp);
  sin.amp(amp * 0.75);
  tri.amp(amp * 0.75);
}

void keyPressed() {
  switch(key) {
    case 'p':
      paused = !paused;
      break;
    case 'f':
      filterEnabled = !filterEnabled;
      if (filterEnabled) {
        lpFilter.process(saw);
        lpFilter.process(sin);
        lpFilter.process(tri);
      } else {
        lpFilter.stop();
      }
      break;
    case 'm':
      muted = !muted;
      if (muted) {
        saw.stop(); sin.stop(); tri.stop();
      } else {
        saw.play(); sin.play(); tri.play();
      }
      break;
    case TAB:
      fftMode = !fftMode;
      break;
  }
}

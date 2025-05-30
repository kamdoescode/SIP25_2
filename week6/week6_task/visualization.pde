void waveViz() {
  background(50);
  stroke(150, 252, 121); // green
  strokeWeight(2);
  noFill();
  
  //perform analysis
  waveform.analyze();

  beginShape();
  for (int i = 0; i < waveformSamples; i++) {
    // draw current data of the waveform
    // each sample in the data array is between -1 and +1
    vertex(
      map(i, 0, waveformSamples, 0, width), 
      map(waveform.data[i], -1, 1, 0, height)
    );
  }
  endShape();
}

void fftViz() {
  background(50);
  fft.analyze(spectrum);

  for (int i = 0; i < fftBands; i++) {
    // the result of the FFT is normalized
    // draw the line for the frequency band i scaling it up by 5 to get more amplitude
    line(i, height, i, height - spectrum[i] * height * 5);
  }
}

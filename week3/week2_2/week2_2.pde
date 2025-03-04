PImage sample;

void setup() {
  size(517,606);
  sample = loadImage("sample2.jpg");
  
}

void draw() {
  loadPixels();
  
  int[] histogram = new int[256];
  
  for(int i = 0; i < sample.pixels.length; i++){
    int pixelShade = int(red(sample.pixels[i]));
    pixels[i] = color(pixelShade);
    
    histogram[pixelShade]++;
  }
  updatePixels();
  
  for(int i = 0; i < histogram.length; i++){
    stroke(255,0,0);
    float startHeight = map(histogram[i], 0, max(histogram), height, height-(height/3));
    line(i, startHeight, i , height);
  }
}

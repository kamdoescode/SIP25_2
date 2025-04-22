//week 2 task histogram and color swap

PImage sample;

void setup() {
  size(720, 650);
  sample = loadImage("mountains.jpg");
  //check if the image loaded properly and print to console
  if (sample == null) {
    println("Image not found!");
    exit();
  } else {
    println("Image loaded successfully!");
  }
}

void draw() {
  background(255);
  //print the image to the sketch
  image(sample, 0, 0);
  
  
  loadPixels();
  //creates an array for each color's histogram
  int[] redHistogram = new int[256];
  int[] greenHistogram = new int[256];
  int[] blueHistogram = new int[256];
  
  // calculate a gray pixel from the channels
  // and draw it to screen
  for (int i = 0; i < sample.pixels.length; i++) {
    
    
    // shade is an int from 0-255
    int pixelShadeRed = int(red(sample.pixels[i]));
    int pixelShadeGreen = int(green(sample.pixels[i]));
    int pixelShadeBlue = int(blue(sample.pixels[i]));
  
    
    // add to histogram
    redHistogram[pixelShadeRed]++;
    greenHistogram[pixelShadeGreen]++;
    blueHistogram[pixelShadeBlue]++;
  }  

  updatePixels();
  
  // draw histogram
  for (int i = 0; i < redHistogram.length; i++) {
    stroke(255, 0, 0);
    float startHeightRed = map(redHistogram[i], 0, max(redHistogram), height, height-(height/4));
    line(i, startHeightRed, i, height);
  }
  for(int i = 0; i < greenHistogram.length; i++){
    stroke(0, 255, 0);
    float startHeightGreen = map(greenHistogram[i], 0, max(greenHistogram), height, height-(height/4));
    line(i+256, startHeightGreen, i+256, height);
  }
  for(int i = 0; i < blueHistogram.length; i++){
    stroke(0, 0, 255);
    float startHeightBlue = map(blueHistogram[i], 0, max(blueHistogram), height, height-(height/4));
    line(i+511, startHeightBlue, i+511, height);
  }
}

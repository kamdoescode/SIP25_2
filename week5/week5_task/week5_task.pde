// week 5 task live webcam with dithering and filter

import processing.video.*;

Capture cam;

color colorA;
color colorB;


void setup() {
  size(640, 480);
  String[] cameras = Capture.list();
  pixelDensity(1);
  if (cameras.length == 0) {
    println("There are no cameras available for capture.");
    exit();
  } else {
    println("Available cameras:");
    for (int i = 0; i < cameras.length; i++) {
      println(cameras[i]);
    }
  
    cam = new Capture(this, 640,480,cameras[0], 30);
    cam.start();     
  }  
  colorA = color(2,65,166);
  colorB = color(250,182,47);
  

}

void draw() {

  if (cam.available() == true) {
    cam.read();
  }
  
  // this next line is for TESTING
  // once the image appears on screen, delete it, and uncomment the code below
  //image(cam,0,0);
  

  loadPixels();
  cam.loadPixels();
  for(int i = 0; i < cam.pixels.length; i++) {
    // 1. get original color pixel
    color src = cam.pixels[i];
    
    // 2. apply duotone filter
    color dt = duotone(src, colorA, colorB);
    
    // 3. quantize to black/white
    float distA = dist(red(dt), green(dt), blue(dt), red(colorA), green(colorA), blue(colorA));
    float distB = dist(red(dt), green(dt), blue(dt), red(colorB), green(colorB), blue(colorB));
    color quantized = (distA < distB) ? colorA : colorB;
    
    
    // 4. calculate error
    float errorR = red(dt) - red(quantized);
    float errorG = green(dt) - green(quantized);
    float errorB = blue(dt) - blue(quantized);
  
    
    // 5. apply dither 
    atkinsonDither(i, errorR, errorG, errorB);
    
    // 6. set final pixel
    pixels[i] = quantized;
    

  }
  updatePixels();

}
//dithering function from class
void atkinsonDither(int i, float errorR, float errorG, float errorB){
  
  int[] offsets = {
    1, 2, width-1, width, width+1, width*2
  };
  for(int j = 0; j < offsets.length; j++){
    int neighbourIndex = i + offsets[j];
    if(neighbourIndex < cam.pixels.length){
      color c = cam.pixels[neighbourIndex];
      float r = red(c) + (errorR / 8.0);
      float g = green(c) + (errorG / 8.0);
      float b = blue(c) + (errorB / 8.0);
      
      cam.pixels[neighbourIndex] = color(r,g,b); // 1/8 is the ratio for each offset
    }
  }
}

color duotone(color pixel, color colorA, color colorB) {
  float tone = red(pixel);
  
  float lerpAmount = norm(tone,0,255);
  
  return lerpColor(colorA, colorB, lerpAmount);
}

void keyPressed() {
  // pressing S will save the current frame to disk
  if(key == 's') {
    saveFrame("frame-######.jpg");
  }
}

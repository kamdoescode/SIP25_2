PImage picture;

void setup(){
  size(720,480);
  picture = loadImage("mountains.jpg");
  noLoop();
  pixelDensity(1);
}

void draw(){
  image(picture, 0, 0);
  
  loadPixels();
  
  //accessing pixels
  for(int i = 0; i < pixels.length; i++){
    float greyValue = red(pixels[i]);
    float newPixelValue = 0;
    
    if(greyValue > 127){
      newPixelValue = 255;
    }
    
    float error = greyValue - newPixelValue;
    
    pixels[i] = color(newPixelValue);
    atkinsonDither(i, error);
 
  }
  updatePixels();
}


void diffuseError(int i, float error){
    if(i < pixels.length-1){
      float newGreyValue = red(pixels[i+1]);
      pixels[i+1] = color(newGreyValue + error);
    }
}

void fsDither(int i, float error){
    //accessing the bottom and right pixels
   int[] offsets = {
      1, width-1, width, width+1
    };
    
    float[] ditherRatios = {
      7/16.0, 3/16.0, 5/16.0, 1/16.0
    };
    
    for(int j = 0; j < offsets.length; j++){
      int neighbourIndex = i + offsets[j];
      if(neighbourIndex < pixels.length){
        float neighbourGrey = red(pixels[neighbourIndex]);
        pixels[neighbourIndex] = color(neighbourGrey + (error*ditherRatios[j]));
      }
    }
}

void atkinsonDither(int i, float error){
  
  int[] offsets = {
    1, 2, width-1, width, width+1, width*2
  };
  for(int j = 0; j < offsets.length; j++){
    int neighbourIndex = i + offsets[j];
    if(neighbourIndex < pixels.length){
      float neighbourGrey = red(pixels[neighbourIndex]);
      
      pixels[neighbourIndex] = color(neighbourGrey + (error/8.0)); // 1/8 is the ratio for each offset
    }
  }
}

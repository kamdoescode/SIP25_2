void setup(){
  size(400,400);
  pixelDensity(1);
}

void draw(){
   
  loadPixels(); // load pixel array 
  
  // loop through every pixel row and column
  for(int y = 0; y < height; y++){
    for(int x = 0; x < width; x++){
      // normalize Y to a value between 0 and 1
      float normalizedY = map(y, 0, height, 0, 1);
      
      // set red channel based on Y position
      int red = int(255 * normalizedY);
      
      // green channel is always 0
      int green = 0;
      
      //blue channel decreases from top to bottom
      int blue = int(255 * (1-normalizedY));
      
      // create the color from the RGB values
      color c = color(red, green, blue);
      
      //set the pixel color in the array
      pixels[x+y * height] = c;
    }
  }
  updatePixels();
}

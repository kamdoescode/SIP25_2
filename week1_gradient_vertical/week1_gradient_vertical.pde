void setup(){
  size(400,400);
}

void draw(){
   
  loadPixels();
  for(int y = 0; y < height; y++){
    for(int x = 0; x < width; x++){
      float normalizedY = map(y, 0, height, 0, 1);
      int red = int(255 * normalizedY);
      int green = 0;
      int blue = int(255 * (1-normalizedY));
      
      color c = color(red, green, blue);
      
      pixels[x+y * height] = c;
    }
  }
  updatePixels();
}

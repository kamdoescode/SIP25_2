void setup(){
  size(400,400);
}

void draw(){
   
  loadPixels();
  for(int i = 0; i < 360; i++){
      float normalizedI = map(i, 0, 360, 0, 1);
      int red = int(255 * normalizedI);
      int green = 0;
      int blue = int(255 * (1-normalizedI));
      
      color c = color(red, green, blue);
      
      pixels[i * 360] = c;
    }
    updatePixels();
  }

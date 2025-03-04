void setup(){
  size(400,300); 
  //background(255, 0, 0);
  loadPixels(); //load pixel array
  
  for(int i = 0; i < pixels.length; i++){
    pixels[i] = color(0, 255, 0);  
  }
  set(200, 200, color(255,0,0));
  color c = get(0,0);
  updatePixels();
  
}

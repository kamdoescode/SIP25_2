// manipulating and analyzing pixels

PImage img; //declare PImage variab;e

void setup() {
    size(517, 606);
    img = loadImage("sample2.jpg"); //load image from data folder
    img.loadPixels();
    for(int i = 0;i < img.pixels.length;i++){
      color c = img.pixels[i];
      float r = red(c);
      float g = green(c);
      float b = blue(c);
      
      //swap color channels (RGB > BGR)
      img.pixels[i] = color(r,b,g);
    }
    img.updatePixels();
    
    image(img, 0, 0); //display the image at psoition(0,0)
}

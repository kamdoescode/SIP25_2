//week 4 task 2d terrain perlin noise and duotone

float zoff = 0;

void setup() {
  size(400, 400);
  pixelDensity(1);
}

void draw() {
  float scale = 0.04;           // Controls the zoom of the terrain
  color lowColor = color(30, 90, 160);   // dark blue
  color highColor = color(162, 223, 245); // ligt blue
  float threshold = 0.5;        // Height threshold for duotone split

  loadPixels();
  for (int y = 0; y < height; y++) {
    for (int x = 0; x < width; x++) {
      float n = noise(x * scale, y * scale, zoff); // Value between 0 and 1
      color c = (n < threshold) ? lowColor : highColor;
      pixels[x + y * width] = c;
    }
  }
  updatePixels();
  zoff += 0.01;
}

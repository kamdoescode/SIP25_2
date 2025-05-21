
void setup() {
  size(600, 600);

}

void draw() {
  background(255);
  // Define the grid size and square size
  int gridWidth = 8;
  int gridHeight = 8;
  int squareSize = width / gridWidth;
  int circSize = width / gridWidth;

  // Iterate through the rows and columns for squares
  for (int row = 0; row < gridHeight; row++) {
    for (int col = 0; col < gridWidth; col++) {
      // Determine the color based on the row and column indices
      if ((row + col) % 2 == 0) {
        noStroke();
        fill(230, 135, 129); // red
      } else {
        noStroke();
        fill(193, 167, 209); // purple
      }

      // Draw the square
      rect(col * squareSize, row * squareSize, squareSize, squareSize);
    }
  }
  
  //iterate through rows and columns for circles
  for (int row = 0; row < gridHeight; row++) {
    for (int col = 0; col < gridWidth; col++) {
      // Determine the color based on the row and column indices
      if ((row + col) % 2 == 0) {
        noStroke();
        fill(245, 229, 149); // yellow
      } else {
        noStroke();
        fill(113, 168, 235); // blue
      }

      //draw circles
      ellipse(
            col * circSize + circSize/2, 
            row * circSize + circSize/2, 
            circSize * 0.9, 
            circSize * 0.9);
    }
  }  
  
}

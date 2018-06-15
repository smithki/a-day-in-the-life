class Star {

  float x; // x-position
  float y; // y-position
  float r; // star radius
  color c; // star color

  float flickerX; // flicker on x-axis
  float flickerY; // flicker on y-axis

  Star(float _x, float _y, float _r, color _c) {

    // passed-along
    x = _x;
    y = _y;
    r = _r;
    c = _c;
  }

  void display() {
    move();
    flicker();
    fill(c);
    ellipse(x, y, r + flickerX, r + flickerY);
  }

  void flicker() {
    flickerX = random(1, 5);
    flickerY = random(1, 5);
  }

  void move() {
    float moveX = 0; // used to move stars along x-axis
    // increment x-positions based on mouse positions...
    if (mousePressed && !(keyPressed && key == ' ')) {
      moveX += mouseDiff;
    } else if (!pauseIfTrue) { // ...or by default
      moveX += width / interval;
    }
    
    x += moveX;
    
    // if the full array of stars has passed the viewport, reset x-positions to 0...
    float offset = 45;
    if (x >= width + offset) {
      x -= width*2;
      //println("stars[] reset"); // use: precisely match timing of star movement with sunlight animation
    } else if (x <= (-width + offset)) { // ...or to widthOffset
      x += width*2;
    }
  }
}
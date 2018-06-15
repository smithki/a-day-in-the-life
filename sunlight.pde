class Sunlight {

  float x; // x-position
  float y; // y-position
  float z; // z-position
  float r; // radius
  float theta; // trig. theta for moving light source around Earth
  
  Sunlight() {
    y = height/2;
    r = 2500;

    theta = PI/2;
    x = cos(theta)*r;
    z = sin(theta)*r;
  }

  void lightsOn() {
    update();
    spotLight(255, 255, 255, // color
      x, y, z, // x, y, z position
      0, 0, 0, // x, y, z direction
      0, 0); // angle and concentration    
  }

  void update() {
    if (mousePressed && !(keyPressed && key == ' ')) {
      theta += map(mouseDiff, 0, width, 0, PI); // change theta based on mouseX - pmouseX
    } else if (!pauseIfTrue) {
      theta += PI / interval;
    }
    
    // redefine x & z values based on updated theta value
    x = cos(theta)*r;
    z = sin(theta)*r;
  }
}
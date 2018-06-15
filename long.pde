class Long {
  
  float x; // x-position
  float y; // y-position
  
  float longitude; // current simulated longitude
  String d; // direction ("W" or "E")
  
  Long() {
    x = 20;
    y = height - 20;
    
    longitude = 105;
    d = "W";
  }
  
  void display() {
    update();
    fill(color(11, 227, 23, 255));
    text("LONGITUDE: " + int(abs(longitude)) + "° " + d, x, y);
    ghost();
  }

  void update() {
    float counter = 180;
    if (longitude > counter) {
      longitude -= 360;
    } else if (longitude < -counter) {
      longitude += 360;
    }
    
    if (longitude > 0) {
      d = "W";
    } else if (longitude < 0) {
      d = "E";
    }
    
    if (mousePressed && (keyPressed && key == ' ')) {
      longitude += mouseDiff;
    }
  }
  
  float flickerX;
  float flickerY;
  void ghost() { // draws a ghosted version of longitude counter which is slightly offset and flickers
    flickerX = random(1, 2);
    flickerY = random(1, 2);
    fill(color(11, 227, 23, 150));
    text("LONGITUDE: " + int(abs(longitude)) + "° " + d, x + flickerX, y + flickerY);
  }  
}
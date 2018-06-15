class Clock {

  float x; // x-position
  float y; // y-position
  
  int hour; // store current simulated hour
  float minute; // store current simulated minute

  Clock() {
    x = 20;
    y = height - 50;
    
    hour = 12;
    minute = 0;
  }

  void display() {
    update();
    fill(color(11, 227, 23, 255));
    text("OCT 5, 2016     " + nf(hour, 2) + ":" + nf(int(minute), 2), x, y);
    ghost();
  }

  void update() {
    float counter = 720;
    if (mousePressed && !(keyPressed && key == ' ')) {
      minute += map(mouseDiff, 0, width, 0, counter);
    } else if (!pauseIfTrue) {
      minute += counter / interval;
    }
    
    if (minute > 59) {
      hour++;
      minute -= 60;
    } else if (minute < 0) {
      hour--;
      minute += 60;
    }

    if (hour > 23) {
      hour -= 24;
    } else if (hour < 0) {
      hour += 24;
    }
  }
  
  float flickerX;
  float flickerY;
  void ghost() { // draws a ghosted version of the clock which is slightly offset and flickers
    flickerX = random(1, 2);
    flickerY = random(1, 2);
    fill(color(11, 227, 23, 150));
    text("OCT 5, 2016     " + nf(hour, 2) + ":" + nf(int(minute), 2), x + flickerX, y + flickerY);
  }  
}
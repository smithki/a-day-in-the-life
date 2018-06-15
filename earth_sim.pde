// "P2_Global_Story"
// ATLS 3519: Code
// Ian Smith - 10/23/2016


/*
PROJECT 2: "A DAY IN THE LIFE"
 
 For this project, I had a personal goal of pushing myself into unknown territory: 3D simulation. 
 To tell the story of Wednesday, October 5, I zoomed out — way out. Instead of a specific personal
 story, I chose to tell the story of a day worldwide. The simulation I've built is interactive,
 meaning the user can control the point of time and visible longitude of planet Earth on October 5.
 The narrative implication of this 'zooming out' is that Boulder's day is just one of many, a 'blip on
 the radar,' so to speak.
 
 PLEASE NOTE: The sketch will likely run slowly at first as Earth's animated textures are loaded & cached.
 A decent graphics card is recommended for a better experience.
 
 INSTRUCTIONS:
 - {CLICK & DRAG MOUSE} to control time of day
 - Hold [SPACE] + {CLICK & DRAG MOUSE} to control degrees of longitude
 - For an immersive experience, I recommend setting 'size(x, y, P3D)' to the full resolution of your
   display and run the sketch in 'Present' mode (Sketch > Present).
 - Have fun!
 
 OTHER CONTROLS:
 - Pressing [ESC] will exit the sketch, useful if you're running in full-screen 'Present' mode
 - Pressing [ENTER] will toggle-pause all moving parts related to the time of day
 */


// Global data variables
float mouseDiff;
float interval;
PFont font;
boolean pauseIfTrue = false;


// Global object variables
Earth earth; // Earth
Sunlight sunlight; // sunlight
Star[] stars; // star field in B.G.
Star sol; // Sol
Clock clock; // time of day
Long lt; // longitude


// Main Setup
void setup() { 
  //size(1280, 800, P3D); // P3D renderer creates 3D primitives and accesses z-axis
  fullScreen(P3D);
  background(0); // set default background color
  pixelDensity(1); // set resolution for high-DPI displays (COMMENT OUT ON NON-HIGH-DPI DISPLAYS FOR BETTER PERFORMANCE)
  cursor(HAND); // set default cursor image
  noStroke(); // no strokes ever!
  
  interval = 500; // set the relative speed of moving objects; higher number = more frames per division = slower movement
  font = loadFont("clock_font.vlw"); textFont(font); // init digital clock font
  earth = new Earth(100); // init Earth object with 100px radius
  sunlight = new Sunlight(); // init Sunlight object
  sol = new Star(-width / 2, height/2, 40, color(254, 196, 45)); // init Star sol object
  clock = new Clock(); // init Clock object
  lt = new Long(); // init Long object

  // init Star stars[] object
  stars = new Star[125];
  for (int i = 0; i < stars.length; i++) {
    stars[i] = new Star(random(0, width*2), random(height), 2, color(255)); // stars fit within y-axis and stretch to x-axis*2 (for 360 deg. simulation)
  }
}


// Main Draw looop
void draw() {
  background(0); // reset background at beginning of loop

  // window title: "Mouse Position: X, Y | ... fps"
  surface.setTitle("Mouse Position: " + mouseX + ", " + mouseY + " | " + int(frameRate) + " fps");

  // store mouse positions ready for loop
  mouseDiff = mouseX - pmouseX;

  // display stars[] in B.G
  for (int i = 0; i < stars.length; i++) {
    stars[i].display();
  }

  // do all the things (in the right order)!
  sol.display();
  clock.display();
  lt.display();
  sunlight.lightsOn();
  earth.display();

  // change cursor image for better GUI
  if (mousePressed) {
    cursor(MOVE);
  } else {
    cursor(HAND);
  }
}


// Other GUI related key commands
void keyReleased() {
  // Exit function
  if (key == ESC) {
    exit();
  }
  
  if (key == ENTER || key == RETURN) {
    if (pauseIfTrue) {
      pauseIfTrue = false;
    } else if (!pauseIfTrue) {
      pauseIfTrue = true;
    }
  }
}

class Earth {

  float x; // x-position
  float y; // y-position
  float r; // radius
  
  float rotateDef; // default rotateVal value
  float rotateVal; // rotateY position

  PShape globe; // 3D primitive sphere
  PImage earthPlainTexture; // plain Earth texture
  int numFrames = 39;
  int currentFrame = 0;
  PImage[] earthTextures = new PImage[numFrames]; // animated Earth textures

  Earth(float _r) {
    x = width/2;
    y = height/2;
    r = _r;
    rotateDef = 170; // focus on the Americas by default
    rotateVal = rotateDef; // rotateVal equals default rotateDef

    // adapted from 'PShape' tutorial by Daniel Shiffman (source: https://www.processing.org/tutorials/pshape/)
    earthPlainTexture = loadImage("earth.jpg"); // load texture (source: https://textures.forrest.cz/index.php?spgmGal=maps&spgmPic=4#spgmPicture)
    globe = createShape(SPHERE, r); // make sphere shape
    globe.setStroke(false); // outline color = false
    //globe.setTexture(earthPlainTexture); // plain texture for Earth (can be used in place of animated textures if there are performance issues)
    // End of D. Shiffman's code
    
    // init animated Earth textures
    // adapted from 'Sequential' example by James Paterson (source: https://processing.org/examples/sequential.html)
    for (int i = 0; i < numFrames; i++) {
      String imageName = "earth-" + nf(i, 4) + ".jpg";
      earthTextures[i] = loadImage(imageName); 
    } // End of J. Paterson's code
  }


  void display() {
    translate(x, y, 0); // set position

    userRotate(); // while mouse is pressed, user can pause animation and maunaully rotate Earth 
    rotateY(radians(rotateVal)); // represent rotation on the y-axis
    rotateZ(radians(-23.44)); // represent Earth's axial tilt on z-axis
    
    // adapted from 'Sequential' example by James Paterson (source: https://processing.org/examples/sequential.html)
    currentFrame = (currentFrame+1) % numFrames; // cycle through texture frames
    globe.setTexture(earthTextures[currentFrame]); // set current texture frame
    // End of J. Paterson's code
    
    shape(globe, 0, 0); // draw the globe
  }

  void userRotate() {
    if (mousePressed && (keyPressed && key == ' ')) {
      rotateVal += mouseDiff; // redefine rotateVal based on mouseX - pmouseX
    }
  }
}
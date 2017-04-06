// use PImage to save/export the drawing

// import the adventure time array/class system into this interface
// ------------------------------------------------


boolean welcome_b; // show the welcome screen or not?

int red_val;
int green_val;
int blue_val;
int brush_size;

PImage canvas_temp; // a name for the saved screen
PImage[] brushes = new PImage[4]; // an array to store all the brushes
int brushes_index; // which index of the array?


// ------------------------------------------------
void setup() {
  size (800, 600, P2D);
  surface.setTitle("Draw Thing");
  smooth(); // smooth the drawing

  // ----- set up the canvas save functions -----
  background(100);
  saveFrame("canvas_temp.png"); // save the blank background as an image
  canvas_temp = loadImage("canvas_temp.png"); // load the saved image into memory
  image(canvas_temp, 0, 0); // redraw the temp canvas

  // ----- define variables -----
  welcome_b = false; // set this to true to get the welcome screen to show
  red_val = 255;
  green_val = 255;
  blue_val = 255;
  brush_size = 10;
  brushes_index = 0;
  
  // ----- populate the array with images from the folder -----
  brushes[0] = loadImage("images/circle.png");
  brushes[1] = loadImage("images/diamond.png");
  brushes[2] = loadImage("images/hexagon.png");
  brushes[3] = loadImage("images/squip.png");

} // ------------------------------------------------




// ------------------------------------------------
void draw() {
  welcome_screen(); // draw the welcome screen

  background(100);
  if (mousePressed == true) {
    stroke(red_val, green_val, blue_val);
    strokeWeight(brush_size);
    line(pmouseX, pmouseY, mouseX, mouseY);
  } // CLOSE if

} // ------------------------------------------------



// -------------------------------------------
void mousePressed() {
  saveFrame("canvas_temp.png"); // save
} // -------------------------------------------



// -------------------------------------------
void welcome_screen() {
  if (welcome_b == true) { // draw the welcome screen
    background(100);
    stroke(0);
    strokeWeight(3);
    fill(255);
    rect(50, 50, width-100, height-100);

    fill(0);
    textSize(20);
    textAlign(CENTER);
    text("Welcome to Draw Thing", width/2, 100);
    textSize(16);
    text("To change colours, click the palette in the top left.", width/2, 150);
    text("To change brush size, click the palette in the top right.", width/2, 200);
    text("To show or hide this screen, press H", width/2, 250);
  } else {
    colour_palette(); // draw the colour palette
    colour_picker(); // pick the colour
    //    brush_preview(); // draw the brush picker
  }
} // -----------------------------------------



// -------------------------------------------
void keyPressed() {
  saveFrame("canvas_temp.png"); // if any key is pressed save the canvas
  canvas_temp = loadImage("canvas_temp.png"); // load the saved image

  if (key == 'h') {
    welcome_b = !welcome_b;
    background(100);
  } // CLOSE if

  if (key == '=' && brush_size<=100) { // set brush maximum size
    brush_size = brush_size*2;
  }

  if (key == '-' && brush_size>=2) { // set brush minimum size
    brush_size = brush_size/2;
  }
} // -------------------------------------------








// -------------------------------------------
void colour_palette() {
  noStroke();
  fill(255, 0, 0); // red
  rect(0, 0, 20, 20);
  fill(255, 255, 0); // yellow
  rect(20, 0, 20, 20); 
  fill(0, 0, 255); // blue
  rect(40, 0, 20, 20); 
  fill(0, 255, 0); // green
  rect(60, 0, 20, 20); 
  fill(255); // white
  rect(80, 0, 20, 20);
  fill(red_val, green_val, blue_val); // current selected colour
  rect(0, height-20, 20, 20);
} // -------------------------------------------


// -------------------------------------------
void colour_picker() {
  if (mouseX<100 & mouseY<20) { // if mouse is inside colour picker
    if (mouseX<20 & mousePressed == true) { // red
      red_val = 255;
      green_val = 0;
      blue_val = 0;
    } else if (mouseX<40 & mousePressed == true) { // yellow
      red_val = 255;
      green_val = 255;
      blue_val = 0;
    } else if (mouseX<60 & mousePressed == true) { // blue
      red_val = 0;
      green_val = 0;
      blue_val = 255;
    } else if (mouseX<80 & mousePressed == true) { // green
      red_val = 0;
      green_val = 255;
      blue_val = 0;
    } else if (mouseX<100  & mousePressed == true) { // white
      red_val = 255;
      green_val = 255;
      blue_val = 255;
    }
  } // ----- close if
} // -------------------------------------------
// - add a popMatrix and setters to Brush draw function
// - add mouse control over the loop functionalty - rotate/transforms ect.
//
// ------------------------------------------------


boolean welcome_b; // show the welcome screen or not?

int brush_size;
int transform;
int rotate;

PImage canvas_temp; // a name for the saved screen

PImage[] brushes = new PImage[4]; // an array to store all the brushes
int brushes_index; // which brushes index is selected
// Brush - a class of drawing tool
int stroke; // stroke - the current Brush selected
ArrayList<Brush> strokes = new ArrayList<Brush>(); // an arrayList of the strokes made with a brush




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
  brush_size = 10;
  brushes_index = 0;

  populate_brushes(); // populate brushes array with images


  // ----- resize images in the index -----
  for (int i = 0; i < 4; i++) {
    brushes[i].resize(brushes[i].width/3, brushes[i].height/3);
  } // close for
} // ------------------------------------------------




// ------------------------------------------------
void draw() {
  background(100);

  // -- draw the currently populated array -----
  for (int i = 0; i < strokes.size(); i++) {
    Brush stroke = strokes.get(i); // Class current_instance = arrayList(current_index)
    stroke.set_size(brush_size); // sets the size of current (i) index
    stroke.draw();
  } // close for

  welcome_screen(); // draw the welcome screen
} // ------------------------------------------------



// ------------------------------------------------
void mousePressed() {
  strokes.add(new Brush(brushes[brushes_index], mouseX, mouseY)); // (array index,h,w)
} // -------------------------------------------

// ------------------------------------------------
void mouseDragged() {
  strokes.add(new Brush(brushes[brushes_index], mouseX, mouseY)); // (array index,h,w)
} // ------------------------------------------------






// -------------------------------------------
void welcome_screen() {
  if (welcome_b == true) { // draw the welcome screen
    stroke(0);
    strokeWeight(3);
    fill(255);
    rectMode(CENTER);
    rect(width/2, height/2, width-200, height-200);

    fill(0);
    textSize(20);
    textAlign(CENTER);
    text("Welcome to Draw Thing", width/2, 200);
    textSize(16);
    text("To save a picture - press S", width/2, 250);
    text("To change brush size - press -/+", width/2, 300);
    text("To show or hide this screen - press H", width/2, 350);
    noFill();
    strokeWeight(2);
    rect(width/2, height/2, width-210, height-210);
  } else {
    //    brush_preview(); // draw the brush picker
  }
} // -----------------------------------------



// -------------------------------------------
void keyPressed() {
  saveFrame("canvas_temp.png"); // if any key is pressed save the canvas
  canvas_temp = loadImage("canvas_temp.png"); // load the saved image;

  if (key == ENTER) image(canvas_temp, 0, 0); // redraw the temp canvas

  if (key == 'h') welcome_b = !welcome_b;

  if (key == '=' && brush_size<=400) { // set brush maximum size
    brush_size = brush_size*2;
  }

  if (key == '-' && brush_size>=2) { // set brush minimum size
    brush_size = int((float)brush_size*0.5);
  }

  if (key == '1') brushes_index = 0; // changes the array index selection
  if (key == '2') brushes_index = 1;
  if (key == '3') brushes_index = 2;
  if (key == '4') brushes_index = 3;
  if (key == 'c') strokes.clear();

  if (key == 's') saveFrame(); // if any key is pressed save the canvas
} // -------------------------------------------




// ------------------------------------------------
void populate_brushes() { // populate the brushes array with files
  brushes[0] = loadImage("images/circle.png");
  brushes[1] = loadImage("images/diamond.png");
  brushes[2] = loadImage("images/hexagon.png");
  brushes[3] = loadImage("images/squip.png");
} // ------------------------------------------------
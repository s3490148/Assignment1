// - add translate and rotate functions
// - add ENTER and DELETE background saves
// - add mouse control over translate/rotate
// - add colour tints to the png brushes
//
// ------------------------------------------------


boolean welcome_b; // show the welcome screen or not?

int brush_size;
int translateX;
int translateY;
int rotate;
int recur;
int undo;

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

  background(100);
  saveFrame("canvas_temp.png"); // save the blank background as an image
  canvas_temp = loadImage("canvas_temp.png"); // load the saved image into memory
  image(canvas_temp, 0, 0); // redraw the temp canvas

  // ----- define variables -----
  welcome_b = false; // set this to true to get the welcome screen to show
  brush_size = 10;
  translateX = 1;
  translateY = 1;
  rotate = 3;
  recur = 10;
  brushes_index = 0;

  populate_brushes(); // populate brushes array with images
} // ------------------------------------------------



// ------------------------------------------------
void update() {
  if (recur < 1) recur = 1;
  if (recur < 0) translateX = 0;
  if (recur < 0) translateX = 0;
  rotate = mouseX;
}// ------------------------------------------------



// ------------------------------------------------
void draw() {
  update();
  background(200);
  paint(); // update drawing variables and run the array loop
  welcome_screen(); // draw the welcome screen
} // ------------------------------------------------



// ------------------------------------------------
void mousePressed() {
  add_stroke();
} // -------------------------------------------

// ------------------------------------------------
void mouseDragged() {
  add_stroke();
} // ------------------------------------------------

// ------------------------------------------------
void mouseMoved() {
  //if (keyPressed == true) translateX = (int)map(mouseX, 0, width, 0, 100);
  //if (keyPressed == true) translateY = (int)map(mouseY, 0, width, 0, 100);=
}// ------------------------------------------------


// -------------------------------------------
void keyPressed() {

  //// - take a screen shot and use it as the new background
  //if (key == ENTER) {
  //  saveFrame("canvas_temp.png"); // save the blank background as an image
  //  canvas_temp = loadImage("canvas_temp.png"); // load the saved image into memory
  //  image(canvas_temp, 0, 0); // redraw the temp canvas
  //} 

  if (key == 'h') welcome_b = !welcome_b;

  if (key == '=' && brush_size<=400) { // set brush_size maximum
    brush_size = brush_size*2;
    println("brush size: " + brush_size);
  }
  if (key == '-' && brush_size>=2) { // set brush_size minimum
    brush_size = int((float)brush_size*0.5);
    println("brush size: " + brush_size);
  }

  if (key == '[') {
    recur = recur/2;
    println("recur: " + recur);
  }
  if (key == ']' && recur < 100) { // set maximum recur
    recur = recur*2;
    println("recur: " + recur);
  }

  if (key == ',') {
    translateX = translateX/2;
    translateY = translateY/2;
    println("translateX: " + translateX);
    println("translateY: " + translateY);
  }
  if (key == '.' && translateX < 300) { // set maximum translation
    translateX = translateX*2;
    translateY = translateY*2;
    println("translateX: " + translateX);
    println("translateY: " + translateY);
  }

  if (key == '1') brushes_index = 0; // set brushes array index
  if (key == '2') brushes_index = 1;
  if (key == '3') brushes_index = 2;
  if (key == '4') brushes_index = 3;
  if (key == 'c') strokes.clear();


  //if (key == 'z') {
  //  undo = strokes.size();
  //  if (undo > 0) {
  //    undo --;
  //    strokes.remove(undo);
  //  }
  //}


  if (key == 's') saveFrame("drawthing-####.png");
} // -------------------------------------------




// ------------------------------------------------
void populate_brushes() { // populate the brushes array with files
  brushes[0] = loadImage("images/circle.png");
  brushes[1] = loadImage("images/diamond.png");
  brushes[2] = loadImage("images/hexagon.png");
  brushes[3] = loadImage("images/squip.png");

  // ----- resize images in the index -----
  for (int i = 0; i < 4; i++) {
    brushes[i].resize(brushes[i].width/3, brushes[i].height/3);
  } // close for
} // ------------------------------------------------




// ------------------------------------------------
void add_stroke() {
  strokes.add(new Brush(brushes[brushes_index], mouseX, mouseY)); // (array index,h,w)
  // arrayList.add(new Class(array[index], mouseX, mouseY));
  // add a new index to the array list - the list has been created with the <Class> type
  // the index will store the Brush class with the argument (brushes) - an array of png files
  // the brushes array has the argument [index] - which index is currently selected?
  // then the mouse X, and mouse Y coordinates
  // so the current selected of the index stores which png, and which location
} // ------------------------------------------------




// ------------------------------------------------
void paint() { // draw the currently populated array
  for (int i = 0; i < strokes.size(); i++) { // cycle through each index of the strokes arrayList
    Brush stroke = strokes.get(i); // Class instance = arrayList.get(current_index);

    for (int r = 0; r < recur; r++) {
      stroke.set_size(brush_size);
      stroke.set_translateX(translateX*r);
      stroke.set_translateY(translateY*r);
      stroke.set_rotateX((int)map(mouseX, 0, width, 0, 360));
      stroke.set_rotateY((int)map(mouseY, 0, width, 0, 90));
      stroke.set_recur(recur);
      stroke.draw();
    }
  }
}// ------------------------------------------------




// -------------------------------------------
void welcome_screen() {
  if (welcome_b == true) { // draw the welcome screen
    stroke(0);
    strokeWeight(3);
    fill(255);
    rectMode(CENTER);
    rect(width/2, height/2, width-200, height-200);
    strokeWeight(2);
    noFill();
    rect(width/2, height/2, width-210, height-210);
    line(250, 180, width-250, 180);

    fill(0);
    textSize(20);
    textAlign(CENTER);
    text("Welcome to Draw Thing", width/2, 160);
    textSize(16);
    text("To save a picture - press S", width/2, 220);
    text("To change brush size - press -/+", width/2, 270);
    text("To change recursion - press [/]", width/2, 320);
    text("To change translation - press </>", width/2, 370);
    text("To show or hide this screen - press H", width/2, 420);
  }
} // -----------------------------------------













//// this might be a way to select an image folder

//// ------------------------------------------------
//void setup() {
//  selectFolder("Select a folder to process:", "folderSelected");
//}// ------------------------------------------------

//// ------------------------------------------------
//void folderSelected(File selection) {
//  if (selection == null) {
//    println("Window was closed or the user hit cancel.");
//  } else {
//    println("User selected " + selection.getAbsolutePath());
//  }
//}// ------------------------------------------------
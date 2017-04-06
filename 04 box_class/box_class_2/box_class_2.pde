// rewriting the box drawing sketch with image saving
// to use classes to draw the box and save/load the canvas
// ------------------------------------------------


Box box1; // declare Box class + local instance name

color col_drag, col_rel;
PImage canvas_temp; // declare canvas variable for saving
int startX, startY, endX, endY; // coordinates for the drawing


// -------------------------------------------------
void setup() {
  size(600, 600);
  surface.setTitle("Draw Thing");
  canvas_init(); // draw and save the canvas to a file

  box1 = new Box(); // define the instance
  col_drag = color(255, 20, 60); // colour while dragging
  col_rel = color(0, 255, 0);  // colour when released
} // -----------------------------------------------


// -------------------------------------------------
void draw() {
  canvas_temp = loadImage("canvas_temp.png"); // load the saved image
} // -----------------------------------------------


// -------------------------------------------------
void canvas_init() {
  background(200);
  saveFrame("canvas_temp.png"); // save the blank background as an image
  canvas_temp = loadImage("canvas_temp.png"); // load the saved image
} // -----------------------------------------------


// -------------------------------------------------
void mousePressed() { // store the start coordinates
  box1.startX = mouseX; // defines variables in the class
  box1.startY = mouseY;
} // -----------------------------------------------


// -------------------------------------------------
void mouseDragged() { // store the start coordinates
  box1.endX = mouseX-box1.startX; // set the end to the current mouse position
  box1.endY = mouseY-box1.startY; // take the current position from the start position
  box1.drag(); // draw the preview version
} // -----------------------------------------------


// -------------------------------------------------
void mouseReleased() { // store the end coordinates
  box1.endX = mouseX-box1.startX; // set the end to the current mouse position
  box1.endY = mouseY-box1.startY; // take the current position from the start position
  box1.release(); // draw the final version
  saveFrame("canvas_temp.png"); // save the current canvas
} // -----------------------------------------------
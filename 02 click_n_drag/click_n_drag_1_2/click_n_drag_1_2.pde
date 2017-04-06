// v1 - allows the user to click and drag to draw an object
// v1.2 - shows a preview of the shape being drawn while dragging
// -------------------------------------------------


// -------------------------------------------------
int startX, startY, endX, endY; // coordinates for the rectangle
color col_drag, col_rel; // 
PImage canvas_temp; // declare the variable associated with the image
// -------------------------------------------------


// -------------------------------------------------
void setup() {
  size(600, 600);
  surface.setTitle("click and drag v1.2");
  background(200);

  saveFrame("canvas_temp.png"); // save the blank background as an image
  canvas_temp = loadImage("canvas_temp.png"); // load the saved image

  col_drag = color(255, 20, 60); // colour while dragging
  col_rel = color(0, 255, 0);  // colour when released
} // -----------------------------------------------


// -------------------------------------------------
void draw() {

  canvas_temp = loadImage("canvas_temp.png"); // load the saved image
} // -----------------------------------------------


// -------------------------------------------------
void mousePressed() { // store the start coordinates
  startX = mouseX;
  startY = mouseY;
} // -----------------------------------------------


// -------------------------------------------------
void mouseDragged() { // store the start coordinates
  endX = mouseX-startX; // set the end to the current mouse position
  endY = mouseY-startY; // take the current position from the start position
  image(canvas_temp, 0, 0); // redraw the temp canvas
  fill(col_drag, 30);
  rect(startX, startY, endX, endY); // draw the rect from start to end
} // -----------------------------------------------


// -------------------------------------------------
void mouseReleased() { // store the end coordinates
  endX = mouseX-startX; // set the end to the current mouse position
  endY = mouseY-startY; // take the current position from the start position
  fill(col_rel, 100);
  rect(startX, startY, endX, endY); // draw the rect from start to end
  saveFrame("canvas_temp.png"); // save the current canvas
} // -----------------------------------------------
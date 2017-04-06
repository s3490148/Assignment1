// trying to write a sketch that allows the user to click and drag


// -------------------------------------------------
int startX, startY, endX, endY; // coordinates for the rectangle
color col_v;



// -------------------------------------------------
void setup() {
  size(600, 600);
  background(200);
  col_v = color(255, 20, 60);
} // -----------------------------------------------



// -------------------------------------------------
void update() {
  fill(col_v, 50);
} // -----------------------------------------------



// -------------------------------------------------
void draw() {
  update();
} // -----------------------------------------------



// -------------------------------------------------
void mousePressed(){ // store the start coordinates
  startX = mouseX;
  startY = mouseY;
} // -----------------------------------------------



// -------------------------------------------------
void mouseReleased(){ // store the end coordinates
  endX = mouseX-startX; // set the end to the current mouse position
  endY = mouseY-startY; // take the current position from the start position
  
  drawBox();
} // -----------------------------------------------



// -------------------------------------------------
void drawBox(){ // draw the dragged box to screen
  rect(startX, startY, endX, endY); // draw the rect from start to end
} // -----------------------------------------------
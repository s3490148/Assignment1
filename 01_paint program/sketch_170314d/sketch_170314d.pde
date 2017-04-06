// first go at a drawing program



// ===== brush picker =====
boolean line_brush_B; // is the line brush picked
boolean ellipse_brush_B; // is the ellipse brush picked

// ===== colour picker =====
int red_val;
int green_val;
int blue_val;




void setup() {
  size (640, 480);
  background(50);

  colour_select(); // draw the colour pallete

  // set the colour to white
  red_val = 255;
  green_val = 255;
  blue_val = 255;
} // ========== close setup




// ========== draw to screen
void draw() {

  colour_pick(); // pick the colour
  brush_select(); //draw the brush pallete
  brush_pick(); // pick the brush

  draw_brush(); // draw the brush
  
// show the currently selected colour
  fill(red_val,green_val,blue_val);
  
ellipse(10,90,10,10)
} // ========== close draw






// =========== draw the colour pallete
void colour_select() {
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
} // ===== close colour_select



// ========== pick the colour
void colour_pick() {
  if (mouseX<100 & mouseY<20) { // if mouse is inside colour picker
    colour_select(); // draw the colour pallete
    
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
    } else { // white
      red_val = 255;
      green_val = 255;
      blue_val = 255;
    }
  } // ----- close if 
  
} // ========== close colour_pick



// =========== draw the brush picker
void brush_select() {
  rect(width-20, 0, 20, 20);
  stroke(0);
  line(width-20, 0, 300, 40);
  rect(width-40, 0, 20, 20);
} // =========== close brush_select



// =========== pick a brush
void brush_pick() {
} // =========== close brush_pick



// ========== draw the brush
void draw_brush() {
  if (mousePressed == true)
  {
    stroke(red_val, green_val, blue_val);
    line(pmouseX, pmouseY, mouseX, mouseY); // replace this with a brush function
    //ellipse(mouseX, mouseY, 1, 1);
  }
} // ========== close draw_brush
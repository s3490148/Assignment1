// first go at a drawing program

boolean welcome_b;

// ===== brush picker =====
int brush_size;

// ===== colour picker =====
int red_val;
int green_val;
int blue_val;


// ========== setup
void setup() {
  size (600, 400);
  surface.setTitle("Drawing Program");
  smooth(); // smooth the drawing

  // ----- declare variables
  welcome_b = true;
  red_val = 255;
  green_val = 255;
  blue_val = 255;
  brush_size = 10;
} // ========== close setup




// -------------------------------------------
void draw() {
  welcome_screen(); // draw the welcome screen

  if (mousePressed == true)
  {
    stroke(red_val, green_val, blue_val);
    strokeWeight(brush_size);
    line(pmouseX, pmouseY, mouseX, mouseY);
  }
} // close draw
// -------------------------------------------


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
    background(100);
    colour_palette(); // draw the colour palette
    colour_picker(); // pick the colour
    brush_palette(); // draw the brush palette
    brush_picker(); // draw the brush picker
  }
} // -----------------------------------------



// -------------------------------------------
void keyPressed() {
  println(welcome_b);
  if (key == 'h') welcome_b = !welcome_b;
}
// -------------------------------------------


// -------------------------------------------
// ===== draw the colour pallete
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
} // ===== close colour_plette




// ========== pick the brush
void brush_palette() {
  strokeWeight(1);
  fill(150);
  rect(width-80, 0, 80, 20);
  stroke(0);
  line(width-20, 0, width-20, 20);
  line(width-40, 0, width-40, 20);
  line(width-60, 0, width-60, 20);
  fill(0);
  ellipse(width-10, 10, 15, 15);
  ellipse(width-30, 10, 10, 10);
  ellipse(width-50, 10, 5, 5);
  ellipse(width-70, 10, 1, 1);
} // ===== close colour_picker






// ========== pick the colour
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
  } // ----- close if mouse is inside colour pcicker
} // ========== close colour_picker







// ========== pick the brush
void brush_picker() {
  fill(150);
  rect(width-20, height-20, 20, 20);

  if (mouseX>width-80 & mouseY<20) { // if mouse is inside brush picker
    if (mouseX>width-20 & mousePressed == true) { // red
      brush_size = 15;
    } else if (mouseX>width-40 & mousePressed == true) { // yellow
      brush_size = 10;
    } else if (mouseX>width-60 & mousePressed == true) { // blue
      brush_size = 5;
    } else if (mouseX>width-80 & mousePressed == true) { // green
      brush_size = 1;
    }
  } // ----- close if mouse is inside colour pcicker

  fill(0);
  ellipse(width-10, height-10, brush_size, brush_size);
} // ========== close brush_picker
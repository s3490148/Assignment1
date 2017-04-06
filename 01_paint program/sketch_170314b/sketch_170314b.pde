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

  // set the colour to white
  red_val = 255;
  green_val = 255;
  blue_val = 255;
} // close setup





void draw() {

  colour_pallete(); // draw the colour pallete
  colour_picker(); // pick the colour

  stroke(red_val, green_val, blue_val);





  if (mousePressed == true)
  {
  line(pmouseX, pmouseY, mouseX, mouseY); // replace this with a brush function
  ellipse(mouseX, mouseY, 1, 1);
}
} // close draw




// ===== draw the colour pallete

void colour_pallete() {
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
} // ===== close colourPallete



// ===== pick the colour

void colour_picker() {

  
//    if (mouseX>100 & mouseY>20) // if mouse is outside the box do nothing
//  {
//    red_value = 255;
//    green_val = 0;
//    blue_val = 0;
//  }
  
  
  
  if (mouseX>width/2 & mouseY>height/2) // bottom right
  {
    red_val = 255;
    green_val = 0;
    blue_val = 0;
  } else if (mouseX>width/2 & mouseY<height/2) // top right
  {
    red_val = 255;
    green_val = 255;
    blue_val = 0;
  } else if (mouseX<width/2 & mouseY>height/2) // bottom left
  {
    red_val = 0;
    green_val = 255;
    blue_val = 0;
  } else if (mouseX<width/2 & mouseY<height/2) // top left
  {
    red_val = 0;
    green_val = 0;
    blue_val = 255;
  }
  
}
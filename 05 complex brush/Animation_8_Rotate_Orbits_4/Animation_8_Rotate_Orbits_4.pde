//------------------------------------------------- 

int rot_one, rot_two, trans_v;
int max_count; // how many circles will be drawn


//------------------------------------------------- 
void setup() {
  smooth();
  frame.setTitle("Circle Drawing");
  size (800, 800);
  background(200);
} //-----------------------------------------------



//------------------------------------------------- 
void update() {
  rot_one += 19;
  rot_two += 32;
  max_count = mouseY/2;
  translate(width*0.5, height*0.5); // move all drawings to the centre
} //-----------------------------------------------



//------------------------------------------------- 
void draw() {
  update();

  background(100);
  stroke(100);
  strokeWeight(5);
  fill(50, 255, 0);
  ellipse(0, 0, 10, 10);

  colorMode(HSB);


  for (int i = 1; i < max_count; i++) {
    rotate( radians(mouseX/10) );
    trans_v = i;
    translate( trans_v, trans_v );
    strokeWeight(i/8);
    ellipse(0, 0, i%max_count, i%max_count);
  } // ---------- CLOSE for
} //-----------------------------------------------
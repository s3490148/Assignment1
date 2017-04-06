// taking a live animation tool and printing it to the background like a brush
//------------------------------------------------- 

Circles circle1; // declare the Circle class + local name for instance

int trans_v;
int max_count; // how many circles will be drawn
color col_1, col_2;

//------------------------------------------------- 
void setup() {
  size (800, 800);
  surface.setTitle("Circle Drawing");
  
  col_1 = color(200);
  col_2 = color(0);
  background(200);

  circle1 = new Circles(); // instance = new Class();
} //-----------------------------------------------



//------------------------------------------------- 
void update() {
  circle1.set_max = mouseX/2; // how many iterations
  circle1.set_trans = mouseY;
  circle1.set_stroke = mouseY/100;
  
  // translate(width*0.5, height*0.5); // move all drawings to the centre
} //-----------------------------------------------


//------------------------------------------------- 
void draw() {
  update();
  circle1.draw();
} //-----------------------------------------------
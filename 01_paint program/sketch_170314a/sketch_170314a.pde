// first go at a drawing program



// brush picker


void setup() {
  size (640, 480);
  background(50);
} // close setup





void draw() {
  
  stroke(255); 
  
  if (mousePressed == true) {
  //line(pmouseX,pmouseY,mouseX,mouseY); // replace this with a brush function
  ellipse(mouseX,mouseY,1,1);
  }
  
  
  // pmouse - previous mouse?
  
  
  // 
  // 
  
  
  
} // close draw
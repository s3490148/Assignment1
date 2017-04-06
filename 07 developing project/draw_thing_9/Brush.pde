// when creating a new class what kind of things do you need to consider?
// - it needs a class Name { }
// - local variables
// - constructor (incomming variables)
// - setters and getters
// - functions or "methods"
// ------------------------------------------------
class Brush {

  // declare all the local variables
  PImage img; // used to call the image loaded in the Parent
  int x, y; // relate to the current mouse position - where the stroke was drawn
  int img_size;
  int img_translate; // used to set the translation amount in the loop
  int img_rotate; // used to set the rotation amount in the loop
  int img_recur; // how many times will each stroke repeat



  // CONSTRUCTOR
  // ------------------------------------------------  
  Brush(PImage _img, int _x, int _y) { 
    img = _img; // which brush was selected
    x = _x; // mouseX position
    y = _y; // mouseY position
  } // ------------------------------------------------


  // SETTERS
  // ------------------------------------------------
  void set_size(int _size) {
    img_size = _size;
  } // ------------------------------------------------
  void set_translate(int _translate) {
    img_translate = _translate;
  } // ------------------------------------------------
  void set_rotate(int _rotate) {
    img_rotate = _rotate;
  } // ------------------------------------------------
  void set_recur(int _recur) {
    img_recur = _recur;
  } // ------------------------------------------------



  // ------------------------------------------------
  void draw() {
    imageMode(CENTER);
    for (int r = 0; r < img_recur; r++) { // for each stroke drawn * recur
      rotate(r*img_rotate);
      pushMatrix();
      translate(x * img_translate + r, y * img_translate + r);
      rotate(radians(img_rotate*r));
      image(img, 0, 0, img_size, img_size);
      popMatrix();
    }
  } // ------------------------------------------------
} // ------------------------------------------------
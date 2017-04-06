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
  int img_translateX; // used to set the translation amount in the loop
  int img_translateY;
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
  void set_translateX(int _translateX) {
    img_translateX = _translateX;
  } // ------------------------------------------------
  void set_translateY(int _translateY) {
    img_translateY = _translateY;
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
    image(img, x, y, img_size, img_size); // first draw the image in the original spot

    for (int r = 0; r < img_recur; r++) {
      pushMatrix();
      translate(img_translateX + r, img_translateY + r); // set the new 0,0 point to the mouse position
      rotate(radians((float)img_rotate)); // rotate by amount (calculated by the frame count above
      image(img, 0, 0, img_size, img_size); // draws the image at its dimensions and at the translated position
      popMatrix();
    }
  } // ------------------------------------------------
} // ------------------------------------------------
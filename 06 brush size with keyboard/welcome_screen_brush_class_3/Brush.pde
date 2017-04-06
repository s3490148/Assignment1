// when creating a new class what kind of things do you need to consider?
// - it needs a class Name { }
// - local variables
// - constructor (incomming variables)
// - setters and getters
// - functions
// ------------------------------------------------
class Brush {

  // declare all the local variables
  PImage img; // used to call the image loaded in the Parent
  int x, y;
  int img_size;
  int img_translate; // used to set the translation amount in the loop
  int img_rotate; // used to set the rotation amount in the loop




  // ------------------------------------------------  
  Brush(PImage _img, int _x, int _y){ // contructor
    img = _img; // which image has been
    x = _x;
    y = _y;
  } // ------------------------------------------------




// ------------------------------------------------
void set_size(int _size){
  img_size = _size;
} // ------------------------------------------------
void set_translate(int _translate){
  img_translate = _translate;
} // ------------------------------------------------
void set_rotate(int _rotate){
  img_rotate = _rotate;
} // ------------------------------------------------




  // ------------------------------------------------
  void draw(){
    imageMode(CENTER);
    image(img,x,y,img_size,img_size);
  } // ------------------------------------------------
} // ------------------------------------------------
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
  int x, y; // sets the dimensions of the img
  int size;
  int img_translate; // used to set the translation amount in the loop
  int img_rotate; // used to set the rotation amount in the loop


  // ------------------------------------------------  
  Brush(PImage _img, int _x, int _y){
    img = _img;
    x = _x;
    y = _y;
  } // ------------------------------------------------



// ------------------------------------------------
void set_size(int _size){
  size = _size;
} // ------------------------------------------------



  // ------------------------------------------------
  void draw(){
    int w = img.width;
    int h = img.height;
    imageMode(CENTER);
    image(img,x,y,size,size);
  } // ------------------------------------------------
} // ------------------------------------------------
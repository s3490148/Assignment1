//----------------------------------------
class Circles {

  int set_max;
  int set_trans, set_stroke;

  // CONSTRUCTOR -----------------------------
  Circles() {
  } //----------------------------------------



  // SETTERS --------------------------------
  void set_max(int _max) {
    set_max = _max;
  }
  void set_trans(int _trans) {
    set_trans = _trans;
  }
  void set_stroke(int _stroke) {
    set_stroke = _stroke;
  }
  //----------------------------------------


  // DRAW ----------------------------------
  void draw() {

    if (mousePressed = true) {

      stroke(col_1);
      strokeWeight(5);
      fill(50, 255, 0);
      ellipse(mouseX, mouseY, 10, 10);

      colorMode(HSB);
      translate(mouseX, mouseY);
      for (int i = 1; i < set_max; i++) {
        trans_v = i;
        translate(trans_v, trans_v);
        rotate( radians(mouseX/10) );
        strokeWeight(i*3);
        ellipse(0, 0, i%set_max, i%set_max);
      }
    } else {
      background(col_2);
    }
  } //----------------------------------------


  //----------------------------------------
} // =======================================
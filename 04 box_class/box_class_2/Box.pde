// ===================================================
class Box {

  int startX, startY, endX, endY; // coordinates for the box
  color col_drag, col_rel; // colours for the box


  // -------------------------------------------------
  Box() { // CONSTRUCTOR
    col_drag = color(255, 20, 60); // colour while dragging
    col_rel = color(0, 255, 0);  // colour when released
  } // -----------------------------------------------


  // -------------------------------------------------
  void drag() {
    image(canvas_temp, 0, 0); // redraw the temp canvas
    fill(col_drag, 30);
    rect(startX, startY, endX, endY); // draw the rect from start to end
  } // -----------------------------------------------


  // -------------------------------------------------
  void release() {
    fill(col_rel, 100);
    rect(startX, startY, endX, endY); // draw the rect from start to end
  } // -----------------------------------------------
} // =================================================
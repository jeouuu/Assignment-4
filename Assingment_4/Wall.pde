class Wall {

  float x, y;
  float wid, hei;

  Wall(float x_, float y_, float wid_, float hei_) {
    x = x_;
    y = y_;
    wid = wid_;
    hei = hei_;
  }

  void display(PVector mapLoc) {
    //display the walls
    fill(150, 116, 98);
    stroke(64, 20, 9);
    strokeWeight(4);
    rectMode(CORNER);
    //add the map location and the wall location so the walls also move in related to the mouse
    rect(x+mapLoc.x, y+mapLoc.y, wid, hei);
  }


  boolean collision(PVector loc, int r, PVector mapLoc) {
    //check collision between mouse and walls
    //reference from the collision detection website: https://www.jeffreythompson.org/collision-detection/circle-rect.php
 
    //temporary variables for testing
    float testX = loc.x;
    float testY = loc.y;

    //which edge is touched?
    if (loc.x < x+mapLoc.x)         testX = x+mapLoc.x;      // test left edge
    else if (loc.x > x+mapLoc.x+wid) testX = x+mapLoc.x+wid;   // right edge
    if (loc.y < y+mapLoc.y)         testY = y+mapLoc.y;      // top edge
    else if (loc.y > y+mapLoc.y+hei) testY = y+mapLoc.y+hei;   // bottom edge
    
    //get distance from closest edges
    float distX =  loc.x-testX;
    float distY = loc.y-testY;
    float distance = sqrt( (distX*distX) + (distY*distY) );

    // if the distance is less than the radius, collision!
    if (distance <= r) {
      return true;
    }
    return false;
  }
}

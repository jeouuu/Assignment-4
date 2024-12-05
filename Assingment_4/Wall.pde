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
    fill(150, 116, 98);
    stroke(64, 20, 9);
    strokeWeight(4);
    rectMode(CORNER);
    rect(x+mapLoc.x, y+mapLoc.y, wid, hei);
  }


  boolean collision(PVector mLoc, int mR, PVector mapLoc) {
    //check collision between mouse and walls
    //reference from the collision detection website: https://www.jeffreythompson.org/collision-detection/circle-rect.php
 
    //temporary variables for testing
    float testX = mLoc.x;
    float testY = mLoc.y;

    //which edge is touched?
    if (mLoc.x < x+mapLoc.x)         testX = x+mapLoc.x;      // test left edge
    else if (mLoc.x > x+mapLoc.x+wid) testX = x+mapLoc.x+wid;   // right edge
    if (mLoc.y < y+mapLoc.y)         testY = y+mapLoc.y;      // top edge
    else if (mLoc.y > y+mapLoc.y+hei) testY = y+mapLoc.y+hei;   // bottom edge
    
    //get distance from closest edges
    float distX =  mLoc.x-testX;
    float distY = mLoc.y-testY;
    float distance = sqrt( (distX*distX) + (distY*distY) );

    // if the distance is less than the radius, collision!
    if (distance <= mR) {
      return true;
    }
    return false;
  }
}

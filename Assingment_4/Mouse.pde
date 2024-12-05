class Mouse {

  PVector mLoc;
  PVector mVel;
  PVector mAcc;

  int r;
  int currentDirection;

  Mouse(PVector vel, PVector acc) {
    //Player always start from the middle of the screen
    mLoc = new PVector(width/2, height/2);
    mVel = vel;
    mAcc = acc;
    r = 6;
    currentDirection = 1;
  }

  void display(int direction) {
    //check the edges, prevent player move out of the screen
    mLoc.x = constrain(mLoc.x, 0, 400);
    mLoc.y = constrain(mLoc.y, 0+50, 400-10);

    //rotate the mouse base on direction
    pushMatrix();
    translate(mLoc.x, mLoc.y);

    if (direction==1) {
      //goUp, no transformation
    } else if (direction==2) {
      //goDown
      rotate(radians(180));
    } else if (direction==3) {
      //goLeft
      rotate(radians(-90));
    } else if (direction==4) {
      //goRight
      rotate(radians(90));
    }
    
    //draw the mouse
    fill(#F9DD55);
    noStroke();

    //mouse's body
    ellipse(0, 0+11, 2, 10);
    circle(0, 0, r*2);
    triangle(0-6, 0, 0, 0-18, 0+6, 0);

    //ears
    fill(#FFB108);
    circle(0-6, 0-6, 7);
    circle(0+6, 0-6, 7);

    //nose
    fill(#8E4A28);
    circle( 0, 0-18, 3);

    //eyes
    fill(0);
    circle(0-3, 0-8, 3);
    circle(0+3, 0-8, 3);

    popMatrix();
  }

  void move() {
    //move the mouse and change its direction relate on key press
    if (goUp==true) {
      currentDirection = 1;
      mLoc.y-=mVel.y;
    } else if (goDown==true) {
      currentDirection = 2;
      mLoc.y+=mVel.y;
    } else if (goLeft==true) {
      currentDirection = 3;
      mLoc.x-=mVel.x;
    } else if (goRight==true) {
      currentDirection = 4;
      mLoc.x+=mVel.x;
    }
  }
}

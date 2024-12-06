class Mouse {

  PVector mLoc;
  PVector mVel;
  PVector mAcc;

  PVector prevMLoc;

  int r;
  int currentDirection;
  Map map;

  Mouse() {
    //Player always start from the middle of the screen
    mLoc = new PVector(width/2, height/2);
    mVel = new PVector(2, 2);
    mAcc = new PVector(0, 0);
    ;
    r = 6;

    currentDirection = 1;
    map = new Map(new PVector(2, 2));
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

  boolean collisionWithCheese(ArrayList<Cheese> cheese) {
    float dist;
    for (Cheese c : cheese) {
      dist = dist(mLoc.x, mLoc.y, c.chLoc.x, c.chLoc.y);
      if (dist<r+c.r) {
        return true;
      }
    }
    return false;
  }

  void move() {
    //move the mouse and change its direction relate on key press
    //going to incorporate the acceleration usage here
    if (goUp==true) {
      currentDirection = 1;
      mAcc.y = -0.1;
    } else if (goDown==true) {
      currentDirection = 2;
      mAcc.y = 0.1;
    } else {
      //when there's no key pressing acceleration is 0
      mAcc.y = 0;
    }

    if (goLeft==true) {
      currentDirection = 3;
      mAcc.x = -0.1;
    } else if (goRight==true) {
      currentDirection = 4;
      mAcc.x = 0.1;
    } else {
      //when there's no key pressing acceleration is 0
      mAcc.x = 0;
    }
    //add the acceleration to the velocity to move the mouse
    mVel.add(mAcc);
    //if it is going left/right, slow down the verticle velocity. Vice verse
    //simulating the friction force
    if (!goUp &&!goDown) {
      mVel.y*=0.8;
    }
    if (!goLeft &&!goRight) {
      mVel.x*=0.8;
    }
    mLoc.add(mVel);
  }
}

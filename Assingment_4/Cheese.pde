class Cheese {

  PVector chLoc;
  PVector chVel;

  int r;

  Cheese() {
    chLoc = new PVector(random(width), random(height));
    chVel =  new PVector(2, 2);

    r = 4;
  }

  void display() {
    //draw the cheese
    fill(249, 221, 85);
    noStroke();
    quad(chLoc.x-10, chLoc.y+10, chLoc.x-10, chLoc.y, chLoc.x+10, chLoc.y-10, chLoc.x+10, chLoc.y+10);

    fill(255, 244, 192);
    triangle(chLoc.x-10, chLoc.y, chLoc.x+10, chLoc.y-10, chLoc.x+10, chLoc.y);

    fill(246, 174, 29);
    circle(chLoc.x, chLoc.y, r*2);
    circle(chLoc.x-5, chLoc.y+5, 4);
    circle(chLoc.x+5, chLoc.y+5, 4);
  }

  void collision() {
  }

  void move() {
    if (goUp==true) {
      chLoc.y+=chVel.y;
    } else if (goDown==true) {
      chLoc.y-=chVel.y;
    } else if (goLeft==true) {
      chLoc.x+=chVel.x;
    } else if (goRight==true) {
      chLoc.x-=chVel.x;
    }
  }
}

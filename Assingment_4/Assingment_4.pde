//declare the objects//
Mouse mouse;
Map map;
//objects end here//

//Booleans for movement//
boolean goUp;
boolean goDown;
boolean goLeft;
boolean goRight;
//booleans end here//

boolean canMove = true;

void setup() {
  size(400, 400);
  smooth();

  //initialize the object classes
  mouse = new Mouse(new PVector(2, 2), new PVector(0, 0));
  map = new Map(new PVector(2, 2));
}

void draw() {

  //draw the map and move in relate to mouse
  map.display();
  map.move();

  //check collisions between mouse and walls
  for (Wall wall : map.walls) {
    if (wall.collision( mouse.mLoc, mouse.r, map.mapLoc)) {
      //if mouse touch the walls, reset position in the middle of the screen
      mouse.mLoc = new PVector(width/2, height/2);
      println("overlap");
      break;
    }
  }

  //draw the mouse and move it
  mouse.move();
  mouse.display(mouse.currentDirection);
}




//keypress for movements//
void keyPressed() {
  if (key == 'w') {
    goUp = true;
  } else if (key == 's') {
    goDown = true;
  } else if (key == 'd') {
    goRight = true;
  } else if (key == 'a') {
    goLeft = true;
  }
}

void keyReleased() {
  if (key == 'w') {
    goUp = false;
  } else if (key == 's') {
    goDown = false;
  } else if (key == 'd') {
    goRight = false;
  } else if (key == 'a') {
    goLeft = false;
  }
}
//movement end here//

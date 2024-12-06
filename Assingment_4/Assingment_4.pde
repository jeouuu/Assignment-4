//declare the objects// //<>// //<>//
Mouse mouse;
Map map;
ArrayList<Cheese> cheese;
Cheese newCheese;
Timer t;
Reset r;
RestartScreen reScreen;
//objects end here//

//Booleans for movement//
boolean goUp;
boolean goDown;
boolean goLeft;
boolean goRight;
//booleans end here//

int gameState;
int collectCheese;

void setup() {
  size(400, 400);
  smooth();

  gameState = 1;

  //initialize the object classes
  mouse = new Mouse(new PVector(2, 2), new PVector(0, 0));
  map = new Map(new PVector(2, 2));
  cheese = new ArrayList<Cheese>();
  t = new Timer();
  collectCheese = 0;
  reScreen = new RestartScreen();

  r = new Reset();
  r.reset();
}

void draw() {

  //assign game form gameState
  //gameState 1 = play screen
  if (gameState == 1) {

    //draw the map and move in relate to mouse
    map.display();
    map.move();

    //check collisions between mouse and walls
    for (Wall wall : map.walls) {
      if (wall.collision( mouse.mLoc, mouse.r, map.mapLoc)) {
        //if mouse touch the walls, reset position in the middle of the screen
        mouse.mLoc = new PVector(width/2, height/2);
        break;
      }
    }

    //draw the mouse and move it
    mouse.move();
    mouse.display(mouse.currentDirection);


    //new cheese will appear on screen in every 2sec
    //display cheese from list\
    for (int i=cheese.size()-1; i>=0; i--) {
      Cheese c= cheese.get(i);
      c.display();
      c.move();

      //check if mouse collides with cheese
      if (mouse.collisionWithCheese(cheese)) {
        cheese.remove(i);
        println("collect cheese");
        collectCheese++;
        
        //check if 5 cheese have been collected
        if(collectCheese >= 5){
          //if yse jump to gameState 2 == restartScreen
          gameState = 2;
        }
      }
    }

    //add new cheese in list in every 2sec
    if (t.countCheese() && cheese.size() < 5) {
      newCheese = new Cheese();
      //check if overlap with walls
      boolean overlap = false;
      for (Wall w : map.walls) {
        if (w.collision(newCheese.chLoc, newCheese.r, map.mapLoc)) {
          overlap = true;
        }
      }
      //only add new cheese when there's no overlap
      if (overlap == false) {
        cheese.add(newCheese);
      }
    }
  }
  
  if(gameState ==2){
    reScreen.display();
  }
  reScreen.display();
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

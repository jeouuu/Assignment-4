class Map {

  PVector mapLoc;
  PVector mapVel;

  int mapSize;

  Map(PVector vel) {
    //map always set from the middle,
    //and move in the same speed opposite direction as the player(to create the illusion of camera movement).
    mapLoc = new PVector(width/2, height/2);
    mapVel = vel;
    mapSize = 800;
  }

  void display() {
    //constrain the map
    mapLoc.x = constrain(mapLoc.x, 0, 400);
    mapLoc.y = constrain(mapLoc.y, 0, 400);

    //the ground
    noStroke();
    fill(190, 168, 137);
    rectMode(CENTER);
    rect(mapLoc.x, mapLoc.y+20, 800, 760);


    //wood floor texture
    int offset = 0;
    for (int j=0; j<800; j+=20) {
      for (int i=0; i<1600; i+=60) {
        noFill();
        stroke(64, 20, 9, 50);
        strokeWeight(1.5);
        rectMode(CORNER);
        rect(mapLoc.x-400+i+offset, mapLoc.y-360+j, 60, 20);
      }
      offset-=20;
    }

    //walls
    fill(150, 116, 98);
    stroke(64, 20, 9);
    strokeWeight(2);
    rectMode(CORNER);
    rect(mapLoc.x-400, mapLoc.y-400,800,40);
    
    rect(mapLoc.x-100, mapLoc.y-360,40,80);
    
  }

  void move() {
    if (goUp==true) {
      mapLoc.y+=mapVel.y;
    } else if (goDown==true) {
      mapLoc.y-=mapVel.y;
    } else if (goLeft==true) {
      mapLoc.x+=mapVel.x;
    } else if (goRight==true) {
      mapLoc.x-=mapVel.x;
    }
  }
}

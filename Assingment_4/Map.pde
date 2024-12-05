class Map {

  PVector mapLoc;
  PVector mapVel;

  int mapSize;
  ArrayList<Wall> walls;


  Map(PVector vel) {
    //map always set from the middle,
    //and move in the same speed opposite direction as the player(to create the illusion of camera movement).
    mapLoc = new PVector(width/2, height/2);
    mapVel = vel;
    mapSize = 800;

    walls = new ArrayList<Wall>();
    addWalls();
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

    //display the walls here
    for (Wall w : walls) {
      w.display(mapLoc);
    }

    //furnitures
    //carpets
    fill(#9b7739);
    strokeWeight(2);
    rectMode(CORNER);
    rect(mapLoc.x+260, mapLoc.y-320, 100, 100);
    rect(mapLoc.x-100, mapLoc.y, 160, 100);
    rect(mapLoc.x+200, mapLoc.y+260, 160, 100);

    fill(#9c4c4d);
    rect(mapLoc.x-320, mapLoc.y-280, 120, 100);
    rect(mapLoc.x+240, mapLoc.y-20, 120, 120);
    rect(mapLoc.x-120, mapLoc.y+260, 160, 100);

    //tables
    fill(#b67c52);
    rect(mapLoc.x, mapLoc.y-340, 100, 60);
    rect(mapLoc.x+10, mapLoc.y-280, 10, 10);
    rect(mapLoc.x+80, mapLoc.y-280, 10, 10);

    rect(mapLoc.x-360, mapLoc.y-20, 120, 80);
    rect(mapLoc.x-350, mapLoc.y+60, 10, 20);
    rect(mapLoc.x-260, mapLoc.y+60, 10, 20);

    rect(mapLoc.x-320, mapLoc.y-360, 180, 40);
    rect(mapLoc.x-310, mapLoc.y-320, 160, 20);

    rect(mapLoc.x-320, mapLoc.y+230, 40, 30);
    rect(mapLoc.x-310, mapLoc.y+260, 20, 10);

    rect(mapLoc.x+240, mapLoc.y+360, 80, 40);
    rect(mapLoc.x+250, mapLoc.y+350, 60, 10);

    rect(mapLoc.x+140, mapLoc.y, 40, 80);
    rect(mapLoc.x+180, mapLoc.y+10, 10, 60);
  }

  void addWalls() {
    //add walls in wallsArrayList
    walls.add(new Wall(-400, -400, 800, 40));
    walls.add(new Wall(-100, -360, 40, 80));
    walls.add(new Wall(+160, -360, 40, 160));

    walls.add(new Wall(-400, -160, 100, 40));
    walls.add(new Wall(-200, -160, 220, 40));
    walls.add(new Wall(-100, -240, 40, 80));
    walls.add(new Wall(+280, -160, 120, 40));

    walls.add(new Wall(-200, -20, 40, 120));
    walls.add(new Wall(+100, -60, 40, 200));

    walls.add(new Wall(-340, +190, 360, 40));
    walls.add(new Wall(-200, +230, 40, 180));
    walls.add(new Wall(+100, +190, 40, 220));
    walls.add(new Wall(+240, +190, 160, 40));
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

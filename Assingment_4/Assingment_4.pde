//declare the objects
Mouse mouse;
//objects end here

//Booleans for movement
boolean goUp;
boolean goDown;
boolean goLeft;
boolean goRight;
//booleans end here

void setup(){
 size(400,400);
 smooth();
 
 //initialize the object classes
 mouse = new Mouse(new PVector(2, 2), new PVector(0, 0));
 
}

void draw(){
  background(175);
  
  mouse.display(mouse.currentDirection);
  mouse.move();
  
}


//keypress for movements
void keyPressed(){
  if (key == 'w'){
   goUp = true; 
  } else if (key == 's'){
   goDown = true; 
  } else if (key == 'd'){
   goRight = true; 
  } else if (key == 'a'){
   goLeft = true; 
  }
}

void keyReleased(){
    if (key == 'w'){
   goUp = false; 
  } else if (key == 's'){
   goDown = false; 
  } else if (key == 'd'){
   goRight = false; 
  } else if (key == 'a'){
   goLeft = false; 
  }
}
//movement end here

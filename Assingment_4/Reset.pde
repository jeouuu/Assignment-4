class Reset {

  Reset() {
  }

  void reset() {
    //reset everything in the setup

    gameState = 1;

    //initialize the object classes
    mouse = new Mouse();
    map = new Map(new PVector(2, 2));
    cheese = new ArrayList<Cheese>();
    t = new Timer();
    collectCheese = 0;
  }
}

class Reset {

  Reset() {
  }

  void reset() {
    //reset everything in the setup

    gameState = 1;

    //initialize the object classes
    mouse = new Mouse(new PVector(2, 2), new PVector(0, 0));
    map = new Map(new PVector(2, 2));
    cheese = new ArrayList<Cheese>();
    t = new Timer();
  }
}

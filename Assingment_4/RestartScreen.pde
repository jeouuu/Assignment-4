class RestartScreen {

  RestartScreen() {
  }

  void displayWin() {
    //draw the restart screen for win

    fill(252, 235, 154);
    rect(0, 0, width, height);

    //happy face
    fill(246, 174, 29);
    rect(160, 60, 20, 40);
    rect(220, 60, 20, 40);
    stroke(246, 174, 29);
    strokeWeight(10);
    line(160, 120, 200, 160);
    line(200, 160, 240, 120);

    //button
    rect(140, 220, 120, 60);

    //cheese on button
    noStroke();
    fill(249, 221, 85);
    quad(180, 230, 230, 250, 230, 270, 180, 270);

    fill(255, 244, 192);
    triangle(180, 230, 230, 250, 180, 250);

    fill(246, 174, 29);
    circle(190, 245, 10);
    circle(200, 260, 10);
    circle(215, 250, 10);
  }
}

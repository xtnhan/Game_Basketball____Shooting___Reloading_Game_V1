class Player {

  Bullet bb;

  float x;
  float y;
  float s;
  float distance;

  boolean isFired;

  Player (float xx, float yy) {
    x = xx;
    y = yy;
    s = 50;
    //b = new Bullet (400,495);
    b = null;
    isFired = false;
  }

  void draw () {
    //x = mouseX;
    //y = mouseY;
    noFill();
    circle(x, y, s);
    distance = 20;
    line (x, y, x + s/2, y - (b.shootingPowerY*3));
    text("You will score: " + distance, 800, 130);

    if (b != null) {
      fill(0, 0, 0);
      b.draw();
    }
  }


  void update (Bullet b) {
    if (b.isFired == false && dist (x, y, b.x, b.y) <= s/2) {
      bb = b;
      b.isHeld = true;     

      if (b != null) {
        b.x = x;
        b.y = y;
      }
    }


    if (b.isFired == true && b.isCatched == false && dist (x, y, b.x, b.y) <= s/2) {
      bb = b;
      b.isHeld = true; 
      b.isCatched = true;

      if (b != null) {
        b.reset(p);
        b.x = x;
        b.y = y;
      }
    }
  }




  void shoot (Bullet b) {
    b.shoot(p);
    b.isHeld = false;
    b.isCatched = false;
    b = null;
  }

  void lazyGet (Bullet b) {

    bb = b;
    b.isHeld = true; 
    b.isCatched = true;

    if (b != null) {
      b.reset(p);
      b.x = x;
      b.y = y;
    }
  }

  void move () {
    if (key =='a') {
      moveLeft ();
    }
    if (key =='d') {
      moveRight ();
    }
    if (key =='w') {
      moveUp();
    }
    if (key =='s') {
      moveDown();
    }
  }



  void moveLeft () {
    x -= 20;
    distance += 0.1;
  }
  void moveRight () {
    x += 20;
    distance -= 0.1;
  }
  void moveUp() {
    y -= 20;
  }
  void moveDown () {
    y += 20;
  }
}

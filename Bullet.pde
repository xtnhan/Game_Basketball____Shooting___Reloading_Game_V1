class Bullet {


  float x;
  float vx;
  float y;
  float vy;
  float s;
  float score;
  float extrascore;
  boolean isGetscore;



  float shootingPowerX = 10;
  float shootingPowerY = 0; //Shooting angle

  boolean isHeld;
  boolean isFired;
  boolean isStop;
  boolean isCatched;

  Bullet (float xx, float yy) {
    x = xx;
    y = yy;
    s = 10;
    isHeld = false;
    isFired = false;
    isCatched = false;

    //shootingPower;
    score = 50;
    isGetscore = false;
  }

  void draw () {

    //println("isGetscore: " + isGetscore);
    fill(0, 0, 0);
    textSize(30);
    text ("Score: " + round(score), 800, 100);

    circle(x, y, s);
    if (isFired) {
      isStop = false;
      x += vx;
      y += vy;
      vy = vy + gravity;
      //println(vx);
    }


    if (y >= (height - s/2)) {

      vy = - (abs(vy - vy/6));

      if (abs(vy) <= 1) {
        vy =0;
        y = height - s/2;

        if (vy == 0) {
          vx = vx - (vx * 0.005);
          if (abs(vx) <= 0.05) {
            reset(p);
          }
        }
      }
    }

    if (x >= width - s/2 || x <= 0) {
      vx = - vx;
      vx = vx - vx/6;
    }
  }
  void update () {

    background(255, 255, 255);
    textSize(100);
    text ("GAME OVER", width/2, height/2);
  }

  void reset (Player p) {

    isHeld = false;
    isFired = false;
    gravity = 0.1;
    vy = 0;
    vx = 0;
    isGetscore = false;


    p.bb = null;
  }

  void shoot (Player p) {
    if (isHeld) {
      x = x + p.s/2;
      vx = shootingPowerX;
      vy = vy - shootingPowerY;
      isFired = true;
    }
  }


  void inBasket (Basket bk) {
    if (vy >=0 && x >= bk.x   && x <= (bk.x + bk.w) && y <= bk.y && y >= (bk.y - 50)) {
      playerdistance(p);
      score = score + extrascore;
      isGetscore = true;
    } else {
      isGetscore = false;
    }
  }
  void playerdistance (Player p) {
    extrascore = p.distance;
  }
}

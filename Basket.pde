class Basket {
  float x;
  float y;
  float w;
  float h;
  float s;  


  Basket () {//float xx, float yy, float ww,float hh
    x = 1800;
    y = 400;
    w = 100;
    h = 10;
    s = 40;
  }

  void draw () {

    rect (x, y, w, h);
    noFill();
    rect (x, y, w, h -50);
    //noFill();
    //circle (x + s/2, y + h/2, s);
    //circle (x + 1.5*s, y + h/2, s);
    //circle (x + 2.5*s, y + h/2, s);
  }

  void update (Bullet b) {

    if (b.isGetscore) {

    y = int(random (200,800));
    x = int (random (1400,1800));
   
    }
  }
}

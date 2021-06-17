Player p = new Player (100, 860);
Bullet b = new Bullet (200, 850);
Basket basket = new Basket ();

float gravity = 0.1;

void setup () {
  frameRate(100);
  size(1900, 900);
}

void draw () {

  background(255, 255, 255);

  p.draw();
  p.update(b);

  b.draw ();
  b.inBasket(basket);


  basket.draw();
  basket.update (b);




  //println("isHeld: " + b.isHeld + "|| isFired: " + b.isFired + "||isCatched: " + b.isCatched);

  fill(0, 0, 0);
  textSize(20);
  text ("Shooting Power: " + b.shootingPowerX, 100, 100);
  text ("Shooting Height: " + b.shootingPowerY, 100, 150);

  if (b.score <=0) {
    b.update();
  }
}

void mousePressed () {

  //if (mousePressed && b.isHeld) {
  //  p.shoot(b);
  //  b.score = b.score - 5;
  //}
}
void keyPressed () {
  p.move();



  if (key == '=') {
    b.shootingPowerX += 0.5 ;
  }
  if (key == '-') {
    b.shootingPowerX -= 0.5;
  }
  if (key == ']') {
    b.shootingPowerY += 0.5;

    //    if ( b.shootingPowerY >= 10) { 
    //      b.shootingPowerY =10;
    //    }
  }
  if (key == '[') {
    b.shootingPowerY -= 0.5;
    //if ( b.shootingPowerY <= 0) { 
    //  b.shootingPowerY =0;
    //}
  }

  if (key == 'r') {
    p.lazyGet(b);
    b.isCatched = true;
  }


    if (key == ' '  && b.isHeld) {
      p.shoot(b);
    
 
    b.score = b.score - 10;
  }  

}

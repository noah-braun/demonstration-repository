PVector position = new PVector(200, 200);
PVector velocity = new PVector(5, 1);
PVector acceleration = new PVector(0, 0.1);

Mover mover;

void setup()
{
  size(800, 800);
  
  mover = new Mover(40);
}

void draw()
{
  clearScene();
  
  circle(position.x, position.y, 50);
  
  mover.show();
  mover.update();
  mover.checkEdges();
}

void clearScene()
{
  noStroke();
  fill(0, 10);
  rect(0, 0, width, height);
}

void mousePressed()
{
    mover.hit();
}

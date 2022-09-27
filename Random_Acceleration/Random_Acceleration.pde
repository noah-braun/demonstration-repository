Mover mover;
float _ballR = 10;


float _angle = 0;
float _evo = 1; 

void setup()
{
  size(800, 800);
  
  mover = new Mover(50, 50, _ballR);
}

void draw()
{
  colorMode(HSB, 360, 100, 100);
  
  noStroke();
  color bg = color(0, 0, 0, 50);
  fill(bg);
  rect(0, 0, width, height);
  
  //draw mover
  mover.display();
  mover.update();
  mover.infinite();
  
  
}

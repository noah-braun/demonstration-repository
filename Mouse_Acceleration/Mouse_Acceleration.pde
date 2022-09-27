Mover[] mover = new Mover[200];
float _ballR = 10;
int balls = 10;

float _angle = 0;
float _evo = 1; 

void setup()
{
  size(800, 800);
  
  for(int i = 0; i < balls; i ++)
  {
    mover[i] = new Mover(0, 10*i, _ballR);
  }
}

void draw()
{
  colorMode(HSB, 360, 100, 100);
  
  noStroke();
  color bg = color(0, 0, 0, 50);
  fill(bg);
  rect(0, 0, width, height);
  
  //draw mover
  for(int i = 0; i < balls; i ++)
  {
    mover[i].display();
    mover[i].update();
    mover[i].infinite();
  }
  
  
}

int _state = 1;

int balls = 25;
int chasers = 3;
Mover[] mover = new Mover[balls];
int aliveBalls = mover.length;
Mover[] chaser = new Mover[chasers];
HUD hud;
HUD health;

int _lifeForce = 5;

float _ballR = 10;
float _errorMargin = 20;

float _col = 5;
boolean _flash = false;

void setup()
{
  size(800, 800);
  
  for(int i = 0; i < mover.length; i ++)
  {
    mover[i] = new Mover(random(0, width), random(0, height), _ballR);
  }
  
  for(int i = 0; i < chaser.length; i ++)
  {
    chaser[i] = new Mover(random(0, width), random(0, height), _ballR+20);
    chaser[i].chaser = true;
    chaser[i].vLim = 10;
  }
  
  hud = new HUD();
  health = new HUD();
}

void draw()
{
  colorMode(HSB, 360, 100, 100);
  
  if(_flash == true)
  {
    fill(0, 0, 100);
    _flash = false;
  }
  
  //if(_flash == false) ;
  
  noStroke();
  rect(0, 0, width, height);
  
  //draw mover
  for(int i = 0; i < mover.length; i ++)
  {
    mover[i].display();
    mover[i].update();
    mover[i].infinite();
  }
  //draw chasers
  for(int i = 0; i < chaser.length; i ++)
  {
    chaser[i].display();
    chaser[i].update();
    chaser[i].bounce();
    chaser[i].danger();
  }
  
  hud.display();
  health.health();
  
  fill(0, 80, 20, 90);
  println(_flash);
  
}

void mousePressed()
{
  for(int i = 0; i < mover.length; i ++)
  {
    mover[i].bite();
  }
}

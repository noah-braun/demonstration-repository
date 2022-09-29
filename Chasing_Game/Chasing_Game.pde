int _state = 1;

int balls = 25;
int deadBalls = 0;
Mover[] mover = new Mover[balls];

float _ballR = 10;
float _errorMargin = 20;

float _col = 27;

void setup()
{
  size(800, 800);
  
  for(int i = 0; i < mover.length; i ++)
  {
    mover[i] = new Mover(random(0, width), random(0, height), _ballR);
  }
}

void draw()
{
  colorMode(HSB, 360, 100, 100);
  
  noStroke();
  color bg = color(_col, 58, 23);
  fill(bg);
  rect(0, 0, width, height);
  
  //draw mover
  for(int i = 0; i < mover.length; i ++)
  {
    mover[i].display();
    mover[i].update();
    mover[i].infinite();

  }
  
  //show score
  textSize(40);
  fill(_col, 58, 30);
  noStroke();
  rect(mouseX - 80, mouseY - 65, 50, -50, 5);
  
  fill(_col, 25, 85);
  textAlign(CENTER);
  text(deadBalls, mouseX - 55, mouseY - 75);
  
  println(_state);
  
}

void mousePressed()
{
  for(int i = 0; i < mover.length; i ++)
  {
    mover[i].dieIfHit();
  }

  _col = random(0, 360);
}

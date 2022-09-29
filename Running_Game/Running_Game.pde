PFont rust;

int _lives = 3;
int _state = 1;

int balls = 25;
Mover[] mover = new Mover[balls];

float _ballR = 10;
float _errorMargin = 0;

float _col = 27;

//counter
Counter lifeCounter;

//timer
Timer timer;

void setup()
{
  frameRate(60);
  size(800, 800);
  
  for(int i = 0; i < mover.length; i ++)
  {
    mover[i] = new Mover(random(0, width), random(0, height), _ballR);
  }
  
  rust = createFont("RubikDirt-Regular.ttf", 75);
  
  lifeCounter = new Counter();
  timer = new Timer();
}

void draw()
{
  colorMode(HSB, 360, 100, 100);
  
  if(_lives == 3) _col = 122;
  if(_lives == 2) _col = 54;
  if(_lives == 1) _col = 25;
  if(_lives == 0) _col = 0;
  
  noStroke();
  color bg = color(_col, 58, 23, 90);
  fill(bg);
  rect(0, 0, width, height);
  
  //draw mover
  for(int i = 0; i < mover.length; i ++)
  {
    mover[i].display();
    mover[i].update();
    mover[i].infinite();
    mover[i].dieIfHit();

  }
  
  lifeCounter.display();
  
  timer.tick();
  println(timer.tick());
  
  if(_state == 0)
  {
    fill(_col, 76, 95);
    textSize(100);
    textFont(rust);
    textAlign(CENTER, CENTER);
    text("YOU DIED", width/2, height/2);
  }
  
}

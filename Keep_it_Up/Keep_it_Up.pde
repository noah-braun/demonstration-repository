//make ball
Mover mover;
float _errorMargin = 10;

//make bricks
int _brickNum = 5;
int _spacing = 5;
Brick[] brick = new Brick[_brickNum];

//make paddle
Paddle paddle;

//game flow
int _state = 0;
DiffRamp ramp = new DiffRamp();

//graphics
PFont Tipo = new PFont();
color white = color(255, 199, 237);
color black = color(242, 145, 212);
float _rectW = 0;
float _rectH = 0;

//score
int _score = 0;
boolean _scorable = true;

void setup()
{
  fullScreen();
  surface.setTitle("Keep It Up!");
  noCursor();
  size(800, 800);
  
  mover = new Mover(20);
  mover.position.x = width/2;
  mover.position.y = height/2;
  
  for(int i = 0; i < _brickNum; i ++)
  {
    brick[i] = new Brick(i*(width/_brickNum) + (_spacing*i), (height-100), (width/_brickNum) - (_spacing), 10);
  }
  
  paddle = new Paddle(mouseX - (100/2), height - 120, 100, 10);
  
  //game flow
  ramp = new DiffRamp();
  
  //graphics
  Tipo = createFont("Teko-Medium.ttf", 30);
}

void draw()
{
  if(mover.velocity.y < 0)
  {
    _scorable = false;
  }
  else
  {
    _scorable = true;
  }
  
  clearScene();
  
  //beginning message
  if(_state == 0)
  {
    fill(white);
    textFont(Tipo);
    textAlign(CENTER, CENTER);
    text("Click the ball. Don't let it fall through the cracks.", width/2, height/2 - 100);
    
    mover.show();
    
    if(mouseX >= mover.position.x - mover.moverSize/2 && mouseX <= mover.position.x + mover.moverSize/2
    && mouseY >= mover.position.y - mover.moverSize/2 && mouseY <= mover.position.y + mover.moverSize/2)
    {
      fill(black);
    }
    else
    {
      fill(white);
    }
    circle(mouseX, mouseY, 10);
    
    paddle.show();
  }
  
  //make bricks  
  for(int i = 0; i < _brickNum; i ++)
  {
    brick[i].show();
    brick[i].bounce();
  }
  
  //start game
  if(_state == 0
    && mouseX >= mover.position.x - (mover.moverSize/2) - _errorMargin && mouseX <= mover.position.x + (mover.moverSize/2) + _errorMargin
    && mouseY >= mover.position.y - (mover.moverSize/2) - _errorMargin && mouseY <= mover.position.y + (mover.moverSize/2) + _errorMargin
    && mousePressed == true)
    {
      mover.velocity.x = 5;
      mover.velocity.y = -5;
      mover.acceleration.y = 0.2;
      
      _state = 1;
    }
    
  if(_state == 1)
  {
    //show score
    textSize(50);
    fill(white);
    textAlign(CENTER, CENTER);
    text(_score, width/2, 100);
    
    rect(width/2 - _rectW/2, height/2 - _rectH/2, _rectW, _rectH, 10);
    
    
    mover.update();
    mover.checkEdges();
    mover.show();
    
    ramp.ramp();
    
    paddle.update();
    paddle.show();
    paddle.hit();
    
    if(mover.position.y > height + mover.moverSize) _state = 2;
  }
  
  if(_state == 2)
  {
    background(black);
    textSize(50);
    fill(white);
    textAlign(CENTER, CENTER);
    text(_score, width/2, height/2 - 50);
    
    mover.position.x = width/2;
    mover.position.y = height/2;
    mover.show();
    
    if(mouseX >= mover.position.x - mover.moverSize/2 && mouseX <= mover.position.x + mover.moverSize/2
    && mouseY >= mover.position.y - mover.moverSize/2 && mouseY <= mover.position.y + mover.moverSize/2)
    {
      fill(black);
    }
    else
    {
      fill(white);
    }
    circle(mouseX, mouseY, 10);
  }
}

void clearScene()
{
  noStroke();
  fill(black);
  rect(0, 0, width, height);
}

void mousePressed()
{
    mover.hit();
}

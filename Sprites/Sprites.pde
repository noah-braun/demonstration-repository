import de.looksgood.ani.*;

//sprites

PShape rest;
PShape walk1;
PShape walk2;

int count = 0;
float f = 60;

float step = -500;

float _difficulty = 1;
float _ramp = 0.001;
float _groundVel = _difficulty * -7;

LilGuy guy;

int nGround = 3;
Ground[] ground;
Foreground foreground;

int nRock = 4;
Rock[] rock;


Bird bird;

int _lives = 1;
int _state = 0; 
PImage startScreen;
PImage gameOver;
boolean flash = false;
float _groundY = 120;


//HUD

color red = color(221, 94, 94);
HUD health;


//Sequences

AniSequence seq;

float recth = 0;
float texth = 700;
float text2h = 900;

PFont titan;

PApplet me;

void setup()
{
  size(800, 600);
  me = this;
  Ani.init(this);
  startScreen = loadImage("Start Screen.png");
  gameOver = loadImage("Game Over.png");
  
  rest = loadShape("Sprite Rest.svg");
  walk1 = loadShape("Sprite Walk 1.svg");
  walk2 = loadShape("Sprite Walk 2.svg");
  
  guy = new LilGuy();
  guy.vel.x = 0;
  guy.pos.x = -200;
  guy.pos.y = _groundY;
  String[] files = {"Sprite Walk 1.svg", "Sprite Walk 2.svg"};
  guy.addAnim(files, 30);
  String[] filesL = {"Sprite Walk 1L.svg", "Sprite Walk 2L.svg"};
  guy.addAnim(filesL, 10);
  String[] jumpFiles = {"Sprite Jump 1.svg", "Sprite Jump 2.svg"};
  guy.addAnim(jumpFiles, 10);
  String[] duckFiles = {"Sprite Duck 1.svg", "Sprite Duck 2.svg"};
  guy.addAnim(duckFiles, 10);
  
  
  nGround = ceil(width/800.0) + 2;  //ciel (short for ceiling, rounds up a float to a int)
  ground = new Ground[nGround];
  for(int i = 0; i < ground.length; i ++)
  {
    String[] groundFile = {"Ground.svg"};
    ground[i] = new Ground();
    ground[i].pos.x = -width/2.0 + (ground[i].boxx*i);
    ground[i].addAnim(groundFile, 1);
  }
  foreground = new Foreground();
  String[] foregroundFile = {"Foreground.svg"};
  foreground.addAnim(foregroundFile, 0);
 
 
  rock = new Rock[nRock];
  String[] rockFile1 = {"Rock.svg", "Rock 1-2.svg"};
  String[] rockFile2 = {"Rock 2.svg", "Rock 2-2.svg"};
  String[] rockFile4 = {"Rock 4.svg", "Rock 4-2.svg"};
  String[] rockFile5 = {"Rock 5.svg", "Rock 5-2.svg"};

  for(int i = 0; i < nRock; i ++)
  {
    rock[i] = new Rock();
    rock[i].addAnim(rockFile1, 20);
    rock[i].addAnim(rockFile2, 10);
    rock[i].addAnim(rockFile4, 20);
    rock[i].addAnim(rockFile5, 10);
    rock[i].pos.x = -(width/2) - 50;
    rock[i].pos.y = 70;
  }
  
  bird = new Bird();
  String[] birdFile = {"Rock 3.svg", "Rock 3-2.svg"};
  bird.addAnim(birdFile, 10);
  bird.vel.x = _difficulty*(_groundVel - 2);
  
  health = new HUD();
  
  titan = createFont("TitanOne-Regular.ttf", 50);
  
  Ani.init(this);
  
  seq = new AniSequence(me);
  seq.beginSequence();
  
  //step 1
  seq.add(Ani.to(this, 2, "recth", -600, Ani.QUAD_OUT));
  
  //step 2
  seq.beginStep();
    seq.add(Ani.to(this, 2, "texth", 300, Ani.QUAD_OUT));
    seq.add(Ani.to(this, 2, "text2h", 350, Ani.QUAD_OUT));
  seq.endStep();
  
  seq.endSequence();
} 

void draw()
{
  
  if(_state == 0)
  {
    startScreen();
    if(keyPressed == true && key == 'w') _state = 1;
  }
  if(_state == 1)
  {
    diffRamp();
    gamePlay();
    if(_lives == 0)
    {
      _state = 2;
      seq.start();
    }
  }
  if(_state == 2)
  {
    gameOver();
    if(keyPressed == true && key == ' ') 
    {
      reset();
      _state = 1;
    }
  }
}

void startScreen()
{
  background(90);
  image(startScreen, width/2 - startScreen.width/2, height/2 - startScreen.height/2);
}

void gamePlay()
{
  translate(width/2, height/2);
  background(40); 
  
  for(int i = 0; i < ground.length; i ++)
  {
    ground[i].check();
    ground[i].update();
    ground[i].show();
  }  
  
  guy.update();
  guy.check();
  guy.ground();
  guy.show();
  
  
  bird.check();
  bird.update();
  bird.show();
  bird.collide();
  
  for(int i = 0; i < nRock; i ++)
  {
    rock[i].check();
    rock[i].update();
    rock[i].show();
    rock[i].collide();
  }
  
  foreground.check();
  foreground.update();
  foreground.show();
  
  health.health();
}

void keyPressed()
{  
  if(key == 'w')
  {
    guy.jump();
  }
  if(key == 's')
  {
    guy.duck();
  }
  else
  {
    guy.isDuck = false;
  }
}

void diffRamp()
{
  _difficulty = _difficulty + 0.01;
}

void gameOver()
{
  gamePlay();
  
  pushMatrix();
    translate(-width/2, -height/2);
    
    noStroke();
    fill(226, 71, 71);
    rect(0, height, width, recth);
    
    textFont(titan);
    textAlign(CENTER);
    fill(68, 24, 24);
    textSize(50);
    text("GAME OVER", width/2, texth);
    textSize(25);
    text("Press Spacebar to Start Again", width/2, text2h);
  popMatrix();
}

void reset()
{
  guy.vel.x = 0;
  guy.pos.x = -200;
  guy.pos.y = 100;
 
  for(int i = 0; i < ground.length; i ++)
  {
    ground[i].pos.x = -width/2.0 + (ground[i].boxx*i);
  }
  
  for(int i = 0; i < nRock; i ++)
  {
    rock[i].pos.x = -(width/2) - 50;
    rock[i].pos.y = 70;
  }

  bird.pos.x = width/2 + 500;
  bird.vel.x = _groundVel - 2;

  _lives = 3;
}

void flash()
{
  fill(red);
  noStroke();
  rect(-width/2, -height/2, width, height);
}

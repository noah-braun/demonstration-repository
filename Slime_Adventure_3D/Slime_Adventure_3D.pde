import de.looksgood.ani.*;

//sprites

PShape rest;
PShape walk1;
PShape walk2;

int count = 0;
float f = 60;

float step = -500;

float _difficulty = 1;
float _ramp = 0.0001;  //0.00003
float _groundVel = _difficulty * -7;

LilGuy guy;

int nGround = 3;
Ground[] ground;
Foreground foreground;

int nRock = 4;
Rock[] rock;


Bird bird;

int _lives = 3;
int _state = 0; 
PImage startScreen;
PImage gameOver;
boolean flash = false;
float _groundY = 120;


//HUD

color red = color(221, 94, 94);
HUD health;

Timer timer;
color timerCol = color(216, 202, 180);
color timerCol1 = color(216, 202, 180);
color timerCol2 = color(68, 24, 24);

//Sequences

AniSequence seq;

float recth = 0;
float texth = 700;
float text2h = 900;

AniSequence startSeq;

LilGuy jumpDemo;
LilGuy duckDemo;

float startSeqY1 = 500;
float startSeqY2 = 500;
float startSeqY3 = 500;
float showSpace = 0;
float startSeqTitle = -500;
float startSeqName = 700;
float c = 0;

PFont titan;

PApplet me;


void setup()
{
  size(800, 600);
  surface.setTitle("Slime Adventure 3D");
  PImage icon;
  icon = loadImage("Slime Icon 256px.png");
  surface.setIcon(icon);
  
  
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
  timer = new Timer();
  
  
  titan = createFont("TitanOne-Regular.ttf", 50);
  
  //Game Over Sequence
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
  
  //Start Sequence
  jumpDemo = new LilGuy();
  jumpDemo.addAnim(jumpFiles, 10);
  duckDemo = new LilGuy();
  duckDemo.addAnim(duckFiles, 10);

  
  startSeq = new AniSequence(this);
  startSeq.beginSequence();
  
  //step 1
  startSeq.beginStep();
    startSeq.add(Ani.to(this, 0.7, "startSeqY1", 0, Ani.QUAD_OUT));
    startSeq.add(Ani.to(this, 0.7, "startSeqTitle", 0, Ani.QUAD_OUT));
  startSeq.endStep();
  
  //step 2
  startSeq.beginStep();
    startSeq.add(Ani.to(this, 0.7, "startSeqY2", 0, Ani.QUAD_OUT));
    startSeq.add(Ani.to(this, 0.7, "startSeqName", 0, Ani.QUAD_OUT));
  startSeq.endStep();
  
  //step 3
  startSeq.add(Ani.to(this, 1, "startSeqY3", 0, Ani.QUAD_OUT));
  
  //step 4
  startSeq.add(Ani.to(this, 1, "showSpace", 1));
  
  startSeq.endSequence();
  startSeq.start();
} 

void draw()
{
  
  if(_state == 0)
  {
    startScreen();
    if(keyPressed == true && key == ' ') _state = 1;
  }
  if(_state == 1)
  {
    timer.update();
    diffRamp();
    if(_lives == 0)
    {
      _state = 2;
      seq.start();
    }
  }
  if(_state == 1 || _state == 2)
  {
    gamePlay();
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
  
  background(106, 197, 84);
  
  textAlign(CENTER, CENTER);
  textFont(titan, 50);
  fill(30, 53, 23);
  text("Slime Adventure 3D", width/2 + startSeqTitle, height/6);
  
  textFont(titan, 20);
  fill(48, 102, 31);
  text("Coded in Processing by Noah Braun in 2022", width/2 + startSeqName, height/6 + 50);
  
  textAlign(LEFT, CENTER);
  fill(30, 53, 23);
  text("Press UP to jump", width/6, height/2.3 + startSeqY1);
  jumpDemo.show();
  jumpDemo.pos.x = width/6 + 80;
  jumpDemo.pos.y = height/2.3 + 80 + startSeqY1;
  
  textAlign(RIGHT, CENTER);
  text("Press DOWN to duck", width-(width/6), height/2.3 + startSeqY2);
  duckDemo.show();
  duckDemo.pos.x = width/2 + 150;
  duckDemo.pos.y = height/2.3 + 100 + startSeqY2;
  
  textAlign(CENTER, CENTER);
  text("Press                          to begin", width/2, height/1.5 + 100 + startSeqY3);
  
  if(showSpace == 1)
  {
    c = c + 0.03;
    if(c > 2) c = 0;
    if(c <= 1) fill(48, 102, 31);
    if(c > 1) fill(173, 242, 153);
    println(c);
    textSize(30);
    text("SPACE", width/2 - 12, height/1.5 + 98);
  }
}

void gamePlay()
{
  float wood = height/2 + 100;
  fill(216, 202, 180); 
  rect(0, 0, width, wood);
  fill(25, 16, 7); 
  rect(0, wood, width, wood);
  
  translate(width/2, height/2);
  
  
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
  
  timer.show();
}

void keyPressed()
{  
  if(keyCode == UP)
  {
    guy.jump();
  }
  if(keyCode == DOWN)
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
  _difficulty = _difficulty + _ramp;
  println(_difficulty);
}

void gameOver()
{
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
    text("Press SPACE to Start Again", width/2, text2h);
  popMatrix();
  timerCol = timerCol2;
  timer.show();
}

void reset()
{
  guy.pos.x = -200;
  guy.pos.y = _groundY;
 
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

  timerCol = timerCol1;
  timer.sec = 0;
  
  _difficulty = 1;
  _lives = 3;
}

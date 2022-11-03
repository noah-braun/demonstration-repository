import processing.sound.*;
SoundFile beep;

import de.looksgood.ani.*;

//sprites

PShape rest;
PShape walk1;
PShape walk2;

int count = 0;
int fps = 40;

float step = -500;

float _groundVel = -7;

LilGuy guy;

int nGround = 3;
Ground[] ground;

int nRock = 4;
Rock[] rock;


Bird bird;

int _lives = 3;
int _state = 0; 
PImage startScreen;
PImage gameOver;

color red = color(221, 94, 94);
HUD health;

void setup()
{
  size(800, 600);
  Ani.init(this);
  startScreen = loadImage("Start Screen.png");
  gameOver = loadImage("Game Over.png");
  
  rest = loadShape("Sprite Rest.svg");
  walk1 = loadShape("Sprite Walk 1.svg");
  walk2 = loadShape("Sprite Walk 2.svg");
  
  guy = new LilGuy();
  guy.vel.x = 0;
  guy.pos.x = -200;
  guy.pos.y = 100;
  String[] files = {"Sprite Walk 1.svg", "Sprite Walk 2.svg"};
  guy.addAnim(files, 20);
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
 
 
  rock = new Rock[nRock];
  String[] rockFile1 = {"Rock.svg"};
  String[] rockFile2 = {"Rock 2.svg"};
  String[] rockFile3 = {"Rock 3.svg"};
  String[] rockFile4 = {"Rock 4.svg"};

  for(int i = 0; i < nRock; i ++)
  {
    rock[i] = new Rock();
    rock[i].addAnim(rockFile1, 0);
    rock[i].addAnim(rockFile2, 0);
    rock[i].addAnim(rockFile3, 0);
    rock[i].addAnim(rockFile4, 0);
    rock[i].pos.x = -(width/2) - 50;
    rock[i].pos.y = 70;
  }
  
  bird = new Bird();
  String[] birdFile = {"Bird 1.svg", "Bird 2.svg"};
  bird.addAnim(birdFile, 10);
  bird.vel.x = _groundVel - 2;
  
  health = new HUD();
  
} 

void draw()
{
  if(_state == 0)
  {
    startScreen();
    if(key == 'w') _state = 1;
  }
  if(_state == 1)
  {
    gamePlay();
    if(_lives == 0) _state = 2;
  }
  if(_state == 2)
  {
    gameOver();
    if(key == 'w') 
    {
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

void gameOver()
{
  background(90);
  image(gameOver, width/2 - gameOver.width/2, height/2 - gameOver.height/2);
}

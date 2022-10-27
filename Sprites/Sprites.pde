import de.looksgood.ani.*;
int a = 0;

//sprites

PShape rest;
PShape walk1;
PShape walk2;

int count = 0;
int fps = 40;

float step = -500;

float _groundVel = -5;

LilGuy guy;
Ground[] ground = new Ground[3];
Rock rock;
Tree tree;
Bird bird;

void setup()
{
  size(800, 600);
  Ani.init(this);
//  fullScreen();
  
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
  
  
  for(int i = 0; i < 3; i ++)
  {
    String[] groundFile = {"Ground.svg"};
    ground[i] = new Ground();
    ground[i].pos.x = -width/2.0 + (ground[i].boxx*i);
    ground[i].addAnim(groundFile, 1);
  }
  
  rock = new Rock();
  String[] rockFile = {"Rock.svg"};
  rock.addAnim(rockFile, 10);
  rock.vel.x = _groundVel;
  
  tree = new Tree();
  String[] treeFile = {"Rock.svg"};
  tree.addAnim(treeFile, 10);
  tree.vel.x = _groundVel;
  
  bird = new Bird();
  String[] birdFile = {"Bird 1.svg", "Bird 2.svg"};
  bird.addAnim(birdFile, 10);
  bird.pos.x = 400;
  bird.vel.x = _groundVel;
} 

void draw()
{
  
  translate(width/2, height/2);
  background(40); 
  
  for(int i = 0; i < 3; i ++)
  {
    ground[i].check();
    ground[i].update();
    ground[i].show();
  }  
  
  guy.update();
  guy.check();
  guy.ground();
  guy.changeAnim();
  guy.show();
  
  rock.check();
  rock.update();
  rock.show();
  
  bird.check();
  bird.update();
  bird.show();
}

void keyPressed()
{
  if(key == 'w' && guy.pos.y == 16)
  {
    guy.jump();
    Ani.to(this, 1 , "a", 360);
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

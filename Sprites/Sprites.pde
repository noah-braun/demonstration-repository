//sprites

PShape rest;
PShape walk1;
PShape walk2;

int count = 0;
int fps = 40;

float step = -500;

LilGuy guy;

void setup()
{
  size(800, 600);
//  fullScreen();
  
  rest = loadShape("Sprite Rest.svg");
  walk1 = loadShape("Sprite Walk 1.svg");
  walk2 = loadShape("Sprite Walk 2.svg");
  
  guy = new LilGuy();
  guy.vel.x = 2;
  String[] files = {"Sprite Walk 1.svg", "Sprite Walk 2.svg"};
  guy.addAnim(files, 10);
  String[] filesL = {"Sprite Walk 1L.svg", "Sprite Walk 2L.svg"};
  guy.addAnim(filesL, 10);
  String[] jumpFiles = {"Sprite Jump 1.svg", "Sprite Jump 2.svg", "Sprite Jump 3.svg", "Sprite Jump 4.svg", "Sprite Jump 3.svg", "Sprite Jump 2.svg", "Sprite Jump 1.svg"};
  guy.addAnim(jumpFiles, 10);
} 

void draw()
{
  translate(width/2, height/2);
  background(255);
  fill(0);
  rect(-width/2, guy.boxx/2, width, height);
  
  for(int i = 0; i < 3; i ++)
  {
    pushMatrix();
      fill(0);
      circle(i*300, guy.boxx/2, 50);
    popMatrix();
  }
  
  guy.update();
  guy.check();
  guy.ground();
  guy.changeAnim();
  guy.show();
}

void keyPressed()
{
  guy.jump();
}

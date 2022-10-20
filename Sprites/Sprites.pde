//sprites

PShape rest;
PShape walk1;
PShape walk2;

int count = 0;
int fps = 40;

float step = -500;

Sprite s;

void setup()
{
  size(800, 600);
  
  rest = loadShape("Sprite Rest.svg");
  walk1 = loadShape("Sprite Walk 1.svg");
  walk2 = loadShape("Sprite Walk 2.svg");
  
  s = new Sprite();
  s.vel.x = 2;
  String[] files = {"Sprite Walk 1.svg", "Sprite Walk 2.svg"};
  s.animate(files, 10);
}

void draw()
{
  translate(width/2, height/2);
  
  background(255);
  s.update();
  s.check();
  s.show();
  
  /*
  if(mousePressed == false)
  {
    count = count + 1;
    if(count > fps) count = 0;
  
    step = step + 2;
    if(step > width + 700) step = -500;
  }
  
  pushMatrix();
    background(220);
    scale(0.5);
    translate(0, 400);
    if(count < fps/2) shape(walk1, step, 0);
    else shape(walk2, step, 0);
  popMatrix();
  
  //floor
  fill(0);
  rect(0, 440, width, height);
  */
}

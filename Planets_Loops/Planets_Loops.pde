float _angle = 0;
float _colAngle = 0;


float[] size = new float[20];
float[] distance = new float[20];
float[] velocity = new float [20];
color[] col = new color[20];

int maxPlanets = floor(random(5, 10));
void setup()
{
  size(800, 600);
  
  for(int i = 0; i < 20; i = i+1)
  {
    colorMode(HSB, 360, 100, 100);
    size[i] = random(10, 50);
    distance[i] = random(125, 400);
    velocity[i] = random(-2, 2);
    col[i] = color(random(360), 100, 100);
  }
  
}

void draw()
{
  //HSB Color Mode
  colorMode(HSB);
  
  //give planets trails
  clearScene();
  
  //draw sun
  noStroke();
  fill(100);
  translate(width/2, height/2);
  circle(0, 0, 200);
  
  //create 5 random planets
  for(int i = 0; i <= maxPlanets; i = i+1)
  {
    aPlanet(size[i], distance[i], velocity[i], col[i]);
  }

  _angle = _angle + 1;
}

void clearScene()
{
  noStroke();
  fill(color(0, 0, 0, 10));
  rect(0, 0, width, height);
}

void aPlanet(float size, float distance, float velocity, color col)
{
  pushMatrix();
    fill(col);
    rotate(radians(_angle)*velocity);
    translate(distance, 0);
    circle(0, 0, size);
  popMatrix();
}

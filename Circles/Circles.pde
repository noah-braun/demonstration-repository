int screenX = 1000;
int screenY = 1000;

int angle = 0;

void setup()
{
  size(1000, 1000);
}

void draw()
{
  println(angle);
  colorMode(HSB, 360, 100, 100);
  
  angle = angle + 1;
  color bg = color(0, 10);
  float hue = random(angle, angle+30);
  float saturation = 100;
  float brightness = 100;
  color circleColor = color(hue, saturation, brightness);
  
  if(angle > 360){
    angle = 0;
  }
  
  fill(bg);
  rect(-1, -1, screenX+2, screenY+2);

  fill(circleColor);
  noStroke();
  circle(mouseX + random(-100, 100), mouseY + random(-100, 100), screenX/10);
}

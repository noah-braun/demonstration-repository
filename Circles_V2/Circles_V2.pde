int _screenX = 1000;
int _screenY = 1000;

float _angle = 0;

//Define a function that draws randomly spaced circles around your mouse with cycling colors
void drawCircle(float angle)
{
  float hue = random(angle, angle+30);
  float saturation = 100;
  float brightness = 100;
  color circleColor = color(hue, saturation, brightness);
  fill(circleColor);
  noStroke();
  circle(mouseX + random(-5,5), mouseY + random(-5, 5), 5);
}


//Animate the angle to evolve and reset at 360
float setAngle(float angle, float step)
{
  angle = angle + step;
  if(angle > 360){
    angle = 0;
  }
  return(angle);
}


//Clear Screen if mouse is in top left corner
void clearScreen()
{
  if(mouseX < 50 && mouseY < 50)
  {
  fill(0);
  rect(-1, -1, _screenX + 2, _screenY + 2);
  }
}

//Window size
void setup()
{
  //Setting window size
  size(1000, 1000);
}


//Draw
void draw()
{

  /*/Background
  color bg = color(0, 10);
  fill(bg);
  rect(-1, -1, _screenX+2, _screenY+2);
  */
  
  if(mousePressed == true){
  
  //Color Mode
  colorMode(HSB, 360, 100, 100);

  //Reset hue to zero degrees if above 360
  _angle = setAngle(_angle, 2);
 
  //Draws randomly spaced circles around your mouse with cycling colors
  drawCircle(_angle);
  
  }
  
  //Clear screen if mouse is in top left corner
  clearScreen();
  
}

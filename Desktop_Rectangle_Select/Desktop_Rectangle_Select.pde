float _origX = 200;  //variables to set the origin
float _origY = 200;

boolean set = true;  //variable to allow origin to be set only once

void setup()
{
  size(800, 800);
  fullScreen();
}

void draw()
{
  if(mousePressed == true)
  {  
    if(set == true)  //statement to set the origin only once per click
    {
      _origX = mouseX;
      _origY = mouseY;
      
      set = false;
    }
    
    translate(_origX, _origY);  //set translation
    
    background(0);  //set background color
    
    stroke(255);  //format line style
    strokeWeight(4);
    
    line(0, 0, mouseX - _origX, 0);  //draws a rectangle using the origin and mouse values
    line(0, 0, 0, mouseY - _origY);
    line(mouseX - _origX, 0, mouseX - _origX, mouseY - _origY);
    line(0, mouseY - _origY, mouseX - _origX, mouseY - _origY);
  }
  
  if (mousePressed == false)  //fades previously drawn rectangle out
  {
    noStroke();
    fill(0, 20);
    rect(0, 0, width, height);
    
    set = true;  //allows another origin to be stored at next click  
  }
  
}

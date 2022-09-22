class Button
{
  float buttonX = 0;
  float buttonY = 0;
  float buttonSize = 50;
  
  int buttonNum = 0;
  color buttonColor = color (255, 100, 100);
  
  Button(float bx, float by, float bs, color bc, int bn)
  {
    this.buttonX = bx;
    this.buttonY = by;
    this.buttonSize = bs;
    
    this.buttonNum = bn;
    this.buttonColor = bc;
  }
  
  void make()
  {
    noStroke();
    fill(buttonColor);
    rect(this.buttonX, this.buttonY, this.buttonSize, this.buttonSize/2, 5);
  }
  
  void changeCol()
  {
    if(mouseX >= buttonX && mouseX <= buttonX + buttonSize && mouseY >= buttonY && mouseY <= buttonY + buttonSize/2 && mousePressed == true)
    {
      _drawColor = buttonNum;
    }
  }
  
  
}

class Tile
{
  float tileX = 0;
  float tileY = 0;
  float tileW = 100;
  float tileH = 100;
  
  int myColor = -1;
  color myFill = color(255, 255, 255);
  
  boolean fill = false;
  boolean clickable = true;
  
  Tile(float x, float y, float w, float h)
  {
    this.tileX = x;
    this.tileY = y;
    this.tileW = w;
    this.tileH = h;
  }
  
  void drawTile()
  {
    if(this.myColor == -1) this.myFill = color(255, 255, 255);
    
    for(int i = 0; i < _totalButtons; i++)
    {
      if(this.myColor == i) this.myFill = penCol[i];
    }
    
    
    fill(this.myFill);
    noStroke();
    rect(this.tileX, this.tileY, this.tileW, this.tileH);
  }
  
  void makeHitbox()
  {
    if(mouseX >= this.tileX && mouseX <= this.tileX + this.tileW && mouseY >= this.tileY && mouseY <= this.tileY + this.tileH && clickable == true && mousePressed == true)
    {
      fill = !fill;
      clickable = false;
      
      this.myColor = _drawColor;
    }
    if(mousePressed == false)
    {
      clickable = true;
    }
    
  }
  
  
}

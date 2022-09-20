class Tile
{
  float tileX = 0;
  float tileY = 0;
  float tileW = 100;
  float tileH = 100;
  
  boolean isBlack = false;
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
    if(isBlack == false)  //white fill if isBlack is false
    {
      fill(255);
    }
    
    if(isBlack == true)  //black fill if isBlack is true
    {
      fill(0);
    }
    
    rect(this.tileX, this.tileY, this.tileW, this.tileH);
  }
  
  void makeHitbox()
  {
    if(mouseX >= this.tileX && mouseX <= this.tileX + this.tileW && mouseY >= this.tileY && mouseY <= this.tileY + this.tileH && clickable == true && mousePressed == true)
    {
      isBlack = !isBlack;
      clickable = false;
    }
    if(mousePressed == false)
    {
      clickable = true;
    }
    
  }
  
  
}

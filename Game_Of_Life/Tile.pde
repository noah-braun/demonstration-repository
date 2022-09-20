class Tile
{
  int tileX = 0;
  int tileY = 0;
  float tileW = 100;
  float tileH = 100;
  
  boolean isBlack = false;
  boolean nextBlack = false;
  
  Tile(float x, float y, float w, float h)
  {
    this.tileX = x;
    this.tileY = y;
    this.tileW = w;
    this.tileH = h;
  }
  
  void drawTile()
  {
    if(isBlack == true)  //black fill if isBlack is true
    {
      fill(0);
    }
    else  //white fill if isBlack isn't true
    {
      fill(255);
    }
    
    rect(this.tileX, this.tileY, this.tileW, this.tileH);
  }
  
  void makeHitbox()
  {
    if(mouseX >= this.tileX && mouseX <= this.tileX + this.tileW && mouseY >= this.tileY && mouseY <= this.tileY + this.tileH)
    {
      isBlack = !isBlack;
    } 
  }
  
  void liveOrDie()
  {
    int livingNeighbors = 0;
    
    tileA[this.tileX][this.tileY].isBlack;
    
    
    fill(255, 100, 100);
    text(livingNeighbors, this.tileX + this.tileW/2, this.tileY + this.tileH/2);
    
  }
  
}

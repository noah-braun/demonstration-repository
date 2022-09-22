class Clear
{
  float clearX = 0;
  float clearY = 0;
  float clearSize = 50;
  
  boolean clickable = true;
  
  Clear(float cx, float cy, float cs)
  {
    this.clearX = cx;
    this.clearY = cy;
    this.clearSize = cs;
  }
  
  void show()
  {
    fill(225);
    noStroke();
    rect(this.clearX - this.clearSize, this.clearY - this.clearSize, this.clearSize*3, this.clearSize*3, 5);
    
    
    noFill();
    stroke(0);
    strokeWeight(3);
    
    line(this.clearX, this.clearY, this.clearX + this.clearSize, this.clearY + this.clearSize);
    line(this.clearX, this.clearY + this.clearSize, this.clearX + this.clearSize, this.clearY);
  }
  
  void work()
  {
    if(mouseX >= this.clearX - this.clearSize 
    && mouseX <= this.clearX + (this.clearSize*2) 
    && mouseY >= this.clearY - this.clearSize 
    && mouseY <= this.clearY + (this.clearSize*2) 
    && mousePressed == true)
    {
      for(int y = 0; y < _tileStop; y = y+1)
      {
        for(int x = 0; x < _tileStop; x = x+1)
        {
          tileA[x][y].myColor = -1;
        }
      }
    }
  }
}

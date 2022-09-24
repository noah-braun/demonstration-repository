class Mover
{
  int moverSize = 50;
  
  
  Mover(int s)
  {
    this.moverSize = s;
  }
  
  void show()
  {
    noStroke();
    fill(255);
    
    circle(position.x, position.y, this.moverSize);
  }
  
  void update()
  {
    velocity.add(acceleration);
    position.add(velocity);
  }
  
  void checkEdges()
  {
    if(position.x >= width - (this.moverSize/2) || position.x <= 0 + (this.moverSize/2))
    {
      velocity.x = -velocity.x;
    }
    if(position.y >= height - (this.moverSize/2) || position.y < 0 + (this.moverSize/2))
    {
      velocity.y = -velocity.y;
    }
  }
  
  void hit()
  {
    if(mouseX >= position.x - (this.moverSize/2) && mouseX <= position.x + (this.moverSize/2)
    && mouseY >= position.y - (this.moverSize/2) && mouseY <= position.y + (this.moverSize/2))
    {
      velocity.y = -6;
    }
  }
}

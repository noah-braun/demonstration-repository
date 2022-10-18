class Mover
{
  float moverSize = 50;
  
  PVector position = new PVector(0, 0);
  PVector velocity = new PVector(0, 0);  //(5,1)
  PVector acceleration = new PVector(0, 0);  //(0, 0.1)
  
  Mover(float s)
  {
    this.moverSize = s;
  }
  
  void show()
  {
    noStroke();
    if(mover.position.x >= width/2 - _rectW/2 && mover.position.x <= width/2 + _rectW/2
    && mover.position.y >= width/2 - _rectH/2 && mover.position.y <= width/2 + _rectH/2
    && _state == 1)
    {
      fill(black);
    }
    else
    {
      fill(white);
    }
    
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
  }
  
  void hit()
  {
    if(mouseX >= position.x - (this.moverSize/2) - _errorMargin && mouseX <= position.x + (this.moverSize/2) + _errorMargin
    && mouseY >= position.y - (this.moverSize/2) - _errorMargin && mouseY <= position.y + (this.moverSize/2) + _errorMargin)
    {
      velocity.y = -6;
      velocity.x = position.x - paddle.pos.x;
    }
  }
}

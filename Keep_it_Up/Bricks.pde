class Brick
{
  float x;
  float y;
  float w;
  float h;
  
  boolean on = true;
  
  Brick(float x, float y, float w, float h)
  {
    this.x = x;
    this.y = y;
    this.w = w;
    this.h = h;
  }
  
  void show()
  {
    if(this.on == true) fill(white);
    if(this.on == false) noFill();
    noStroke();
    
    rect(this.x, this.y, this.w, this.h, 10);
  }
  
  void bounce()
  {
    if(mover.position.y > (this.y - mover.moverSize/2) && mover.position.y < (this.y + this.h + _errorMargin)
    && mover.position.x > this.x && mover.position.x < this.x + (width/_brickNum) - _spacing
    && this.on == true)
    {
      mover.velocity.y = -15;
      if(mover.position.x < paddle.pos.x - paddle.w || mover.position.x > paddle.pos.x + paddle.w) this.on = false;
    }
  }
}

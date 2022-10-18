class Paddle
{
  PVector pos = new PVector(0, 0);
  PVector mouse = new PVector(0, 0);
  PVector oldMouse = new PVector(0, 0);
  PVector dir = new PVector(0, 0);
  
  float angle;
  
  float w;
  float h;
  
  Paddle(float x, float y, float w, float h)
  {
    this.pos.x = x;
    this.pos.y = y;
    this.w = w;
    this.h = h;
  }
  
  void update()
  {
    mouse.x = mouseX;
    mouse.y = mouseY;
    PVector dir = PVector.sub(mouse, oldMouse);
    if(dir.mag() > 100)
    {
      oldMouse = mouse;
    }
    this.angle = atan2(dir.y, dir.x);
    
    pos.x = mouseX - (paddle.w/2);
    pos.y = height - 120;
  }
  
  void show()
  {
    
    pushMatrix();
      fill(white);
      noStroke();
      
      translate(mouseX, 0);
      //rotate(this.angle);
      //rotate(radians(90));
      rect(0 - this.w/2, pos.y, this.w, this.h, 10);
    popMatrix();
  }
  
  void hit()
  {
    // controlled velocity
    /*if(mover.position.y > (this.pos.y - mover.moverSize/2) && mover.position.y < this.pos.y + this.h + _errorMargin
    && mover.position.x > this.pos.x && mover.position.x < this.pos.x + this.w)
    {
      mover.velocity.y = random(-15, -5);
      mover.velocity.x = ((mover.position.x - mouse.x)/(this.w/2))*10;
      println(mover.velocity.y);
    } */
    
    // random velocity
    if(mover.position.y > (this.pos.y - mover.moverSize/2) && mover.position.y < this.pos.y + this.h + _errorMargin
    && mover.position.x > this.pos.x && mover.position.x < this.pos.x + this.w
    && _scorable)
    {
      mover.velocity.y = random(-25, -17);
      mover.velocity.x = random(-10, 10);
      _score = _score + 1;
    }
  }
  
}

class Mover
{
  PVector position = new PVector(0, 0);
  PVector velocity = new PVector(0, 0);
  PVector acceleration1 = new PVector(random(-0.01, 0.01), random(-0.01, 0.01));
  PVector acceleration2 = new PVector(0, 0);
  
  boolean killer = true;
  
  float vLim = random(1, 10);
  float aLim = random(0.1, 0.3);
  
  float ballR = 25;
  
  Mover(float x, float y, float r)
  {
    this.position.x = x;
    this.position.y = y;
    this.ballR = r;
  }
  
  void update()  //where the money is
  {
    PVector mouse = new PVector(mouseX, mouseY);
    PVector dir = PVector.sub(mouse, position);
    float dist = dir.mag();
    
    dir.normalize();
    dir.mult(aLim);
    acceleration1 = dir;  //chasing mouse
    acceleration2 = PVector.random2D();  //random crawling
    
    if(dist <= 200)
    {
      acceleration1.lerp(acceleration2, (dist/200));  //i dont understand this line yet
      velocity.add(acceleration1);
    }
    else
    {
      velocity.add(acceleration2);
    }
    
    velocity.limit(vLim);
    position.add(velocity);
  }
  
  void display()
  {
    if(_state == 1)
    {
      noStroke();
      if(this.velocity.mag() <= 7) fill(_col, 76, 95);
      if(this.velocity.mag() > 7) fill(_col, 25, 95);
      circle(position.x, position.y, this.ballR*2);
    }
  }
  
  void infinite()
  {
    if(position.x > width + ballR)
    {
      position.x = 0 - ballR;
    }
    
    if(position.x < 0 - ballR)
    {
      position.x = width + ballR;
    }
    
    if(position.y > height + ballR)
    {
      position.y = 0 - ballR;
    }
    
    if(position.y < 0 - ballR)
    {
      position.y = height + ballR;
    }
  }
  
  void dieIfHit()
  {
    if(mouseX >= this.position.x - ballR - _errorMargin && mouseX <= this.position.x + ballR + _errorMargin
    && mouseY >= this.position.y - ballR - _errorMargin && mouseY <= this.position.y + ballR + _errorMargin
    && this.killer == true)
    {
      _lives = _lives - 1;
      this.killer = false;
    }
    
    if(_lives == 0) _state = 0;
  }
  
}

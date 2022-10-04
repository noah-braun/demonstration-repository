class Mover
{
  PVector position = new PVector(0, 0);
  PVector velocity = new PVector(0, 0);
  PVector acceleration1 = new PVector(random(-0.01, 0.01), random(-0.01, 0.01));
  PVector acceleration2 = new PVector(0, 0);
  
  boolean alive = true;
  boolean chaser = false;
  boolean hungry = true;
  
  float vLim = random(1, 7);
  float aLim = random(0.1, 0.3);
  
  float ballR = 25;
  
  float dist = 0;  //distance from mouse
  
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
    this.dist = dir.mag();
    
    dir.normalize();
    
    if(chaser == false)
    {
      dir.mult(-aLim);
    }
    else
    {
      dir.mult(aLim);
    }
    acceleration1 = dir;  //chasing mouse
    acceleration2 = PVector.random2D();  //random crawling
    
    if(dist <= 400)
    {
      acceleration1.lerp(acceleration2, (dist/400));  //i dont understand this line yet
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
    if(alive)
    {
      if(chaser == false)
      {
        fill(_col, 76, 100-(dist/5));
      }
      else
      {
        fill(0, 0, 100-(dist/5));
      }
      noStroke();
      
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
  
  void bounce()
  {
    if(position.x > width - ballR || position.x < 0 + ballR)
    {
      velocity.x = -velocity.x;
    }
    
    if(position.y > height - ballR || position.y < 0 + ballR)
    {
      velocity.y = -velocity.y;
    }
  }
  
  void bite()
  {
    if(dist < ballR + _errorMargin && alive == true)
    {
      alive = false;
      aliveBalls --;
      _lifeForce = _lifeForce + 2;
    }
  }
  
  void danger()
  {
    if(dist < this.ballR && _lifeForce > 0 && hungry == true)
    {
      _state = 0;
      _flash = true;
      _lifeForce = _lifeForce - 40;
      hungry = false;
    }
    if(dist > this.ballR + 50)
    {
      hungry = true;
    }
  }
  
}

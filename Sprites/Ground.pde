class Ground extends Sprite
{
  Ground()
  {
    super();
    
      this.anchor.x = 0.0;
      this.anchor.y = 0.0;
      this.boxx = 800.0;
      this.boxy = 600.0;
      this.pos.x = -width/2.0;
      this.pos.y = -height/2.0;
      this.vel.x = _groundVel;
      
  }
  
  void check()
  {
    float actualX = screenX(this.pos.x, this.pos.y);
    if(actualX < -this.boxx)
    {
      this.pos.x = (-width/2.00) + 2.00*this.boxx;
      println(this.pos.x);
      
    }
  }
}

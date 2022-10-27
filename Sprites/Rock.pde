class Rock extends Sprite
{
  Rock()
  {
    super();
    
    this.pos.x = 0;
    this.pos.y = 95;
    this.boxx = 51;
    this.boxy = 22;
  }
  
  void check()
  {
    float actualX = screenX(this.pos.x, this.pos.y);
    if(actualX < -400) rock.pos.x = width/2 + random(100, 2000);
  }
}

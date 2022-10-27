class Tree extends Sprite
{
  Tree()
  {
    super();
    this.boxx = 136;
    this.boxy = 600;
    
    this.pos.y = -height/2;
  }
  
  void check()
  {
    float actualX = screenX(this.pos.x, this.pos.y);
    if(actualX < -400) rock.pos.x = width/2 + random(100, 1000);
  }
}

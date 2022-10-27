class LilGuy extends Sprite
{
  boolean isJump = false;
  boolean isDuck = false;
  
  LilGuy()
  {
    super();  //inherits EVERYTHING from sprite 
  }
  
  void show()
  {
    pushMatrix();
      translate(pos.x, pos.y);
      rotate(radians(a));
      translate(-anchor.x, -anchor.y);
      
      if(this.currentAnim > -1) this.sAnim[currentAnim].show();
    popMatrix();
  }
  
  void jump()
  {
    this.isJump = true;
    
    if(this.pos.y == 16)
    {
      this.vel.y = -10;
      this.acc.y = 0.3;
    }
  }
  
  void duck()
  {
    this.isDuck = true;
  }
  
  void ground()
  {
    if(this.pos.y > 16)  
    {
      this.pos.y = 16;
      this.vel.y = 0;
      this.acc.y = 0; 
      this.isJump = false;
      a = 0;
    }
  }
  
  void changeAnim()
  {
    guy.currentAnim = 0;
    if(this.isJump)
    {
      guy.currentAnim = 2;
    }
    
    if(this.isDuck)
    {
      guy.currentAnim = 3;
    }
    
    //guy.currentAnim=0;
  }
  
}

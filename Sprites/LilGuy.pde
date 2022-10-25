class LilGuy extends Sprite
{
  boolean isJump = false;
  
  LilGuy()
  {
    super();  //inherits EVERYTHING from sprite 
  }
  
  void jump()
  {
    this.isJump = true;
    
    if(this.pos.y == 0)
    {
      this.vel.y = -10;
      this.acc.y = 0.3;
    }
  }
  
  void ground()
  {
    if(this.pos.y > 0)  
    {
      this.pos.y = 0;
      this.vel.y = 0  ;
      this.acc.y = 0; 
      this.isJump = false;
    }
  }
  
  void changeAnim()
  {
    if(guy.vel.x > 0 && guy.isJump == false) guy.currentAnim = 0;
    if(guy.vel.x < 0 && guy.isJump == false) guy.currentAnim = 1;
    if(guy.isJump)
    {
      guy.currentAnim = 2;
      
    }
    println(guy.currentAnim);
    //guy.currentAnim=0;
  }
  
}

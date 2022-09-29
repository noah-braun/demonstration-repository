class Timer
{
  float xPos = 200;
  float yPos = 200;
  float sec = 0;
  
  int tick()
  {
    this.sec = this.sec + 0.01666666;
    if(this.sec < 0.5) return(round(this.sec));
    if(this.sec >= 0.5) return(round(this.sec - 0.5));
    
  }
  void display()
  {
    fill(0, 100, 100);
    
    
  }
}

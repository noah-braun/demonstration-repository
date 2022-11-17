class Timer
{
  int tick;
  float sec;
  
  void update()
  {
    this.sec = this.sec + 0.014;
    this.tick = round(this.sec);
  }
  
  void show()
  {
    textFont(titan);
    textSize(25);
    textAlign(RIGHT, BOTTOM);
    fill(timerCol);
    text(this.tick, width/2 - 20, height/2 - 10);
  }
}

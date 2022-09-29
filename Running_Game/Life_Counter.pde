class Counter
{
  float xPos = 50;
  float yPos = 50;
  float spacing = 50;
  
  void display()
  {
    for(int i = 0; i < _lives; i ++)
    {
      fill(0, 0, 100);
      circle(xPos + (i*spacing), yPos, 50);
    }
  }
  
  
}

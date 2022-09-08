/*
class Row
{
  float squareX = 0;  //properties
  float squareY = 0;
  color col = (color(0));
  boolean black = true;
  
  Row(float yStart, boolean yesBlack)
  {
    this.squareY = yStart;
    this.black = yesBlack;
  }
  
  void show()
  {
    translate(this.squareX, this.squareY);
    for(int i = 0; i < 4; i = i+1)
    {
      fill(0);
      if(this.black == true)
      {
        this.squareX = 0;
        rect(this.squareX, this.squareY, 100, 100);
        translate(200, 0);
      }
      
      if(this.black == false)
      {
        this.squareX = 100;
        rect(this.squareX, this.squareY, 100, 100);
        translate(200, 0);
      }
    }
  }
  
  
}
*/

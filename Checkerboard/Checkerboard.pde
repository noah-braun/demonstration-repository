/* Create a chessboard. Create a white background. 
Add black squares in an 8X8 grid. Checkerboard grid. 

Row[] a = new Row[8];

void setup()
{
  size(800, 800);
  for(int i = 0; i < 8; i = i+1)
  {
    a[i] = new Row(100*i, _isBlack);
    _isBlack = !_isBlack;
    
  }
}

void draw()
{
  noStroke(); //background
  fill(255);
  rect(0, 0, width, height);


  for(int i = 0; i < 8; i = i+1)
  {
    a[i].show();
  }  
  
}

*/

boolean black = true;
int nTiles = 4;

color colBlack = color(100, 40, 0);
color colWhite = color(255, 240, 200);

void setup() 
{
  surface.setTitle(nTiles + " x " + nTiles + " Checkerboard");
  surface.setResizable(true);
  size(800, 800);
}

void draw()
{
  stroke(colBlack);
  for(int n = 0; n < nTiles*2; n = n+1)  //loop that draws rows
  {
    for(int i = 0; i < nTiles*2; i = i+1)  //loop that draws squares
    {
      
      if(black == true)  //sets fill to black
      {
        fill(colBlack); 
      }
      
      if(black == false)  //sets fill to white
      {
        fill(colWhite);
      }
      rect((width/nTiles)*i, 0, width/nTiles, height/nTiles);  //draw a rectangle 
      
      black = !black;  //flips boolean to create opposite fill next
    }
    translate(-(width/nTiles), height/nTiles);  //pushes origin down to begin next row
  }
  
}

Tile[][] tileA = new Tile[1000][1000];  //a multi-dimensional array; creates a matrix

float _tileWidth = 40;
float _tileStop = width;

int state = 0;

void setup()
{
  size(800, 800);
  
  for(int y = 0; y < _tileStop; y = y+1)  //this fills the matrix; we're setting the coordinates of all the squares to be drawn at once
  {
    for(int x = 0; x < _tileStop; x = x+1)  //we need two dimensions because the matrix uses two coordinates to locate data
    {
      tileA[x][y] = new Tile(0, 0, _tileWidth, _tileWidth);
      
      tileA[x][y].tileX = x*_tileWidth;
      tileA[x][y].tileY = y*_tileWidth;
      tileA[x][y].tileW = _tileWidth;
      tileA[x][y].tileH = _tileWidth;
    }
  }
}

void draw()
{
  background(200);
  
  for(int y = 0; y < _tileStop; y = y + 1)
  {
    for(int x = 0; x < _tileStop; x = x + 1)
    {
      tileA[x][y].drawTile();
    }
  }
  
  if(state == 1)
  {
    for(int y = 0; y < _tileStop; y = y + 1)
    {
      for(int x = 0; x < _tileStop; x = x + 1)
      {
        tileA[x][y].liveOrDie();
      }
    }
   }
}

void mousePressed()
{
  if(state == 0)
  {
    for(int y = 0; y < _tileStop; y = y + 1)
    {
      for(int x = 0; x < _tileStop; x = x + 1)
      {
        tileA[x][y].makeHitbox();
      }
    }
  }
}

void keyPressed()
{
  if(state == 0)
  {
    state = 1;
  }
  else
  {
    state = 0;
  }
}

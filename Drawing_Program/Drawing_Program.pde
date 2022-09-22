Tile[][] tileA = new Tile[1000][1000];  //a multi-dimensional array; creates a matrix

float _tileWidth = 10;
float _tileStop = width;


Button[] b = new Button[10];

float _buttonsX = 50;
float _buttonsY = 50;
float _buttonSize = 50;

int _totalButtons = 9;
float _buttonSpacing = 60;

Clear x;

color[] penCol = new color[10];
color _drawColor = 5;


void setup()
{
  surface.setResizable(true);
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
  
  //setup colors
  penCol[0] = color(237, 76, 103);  //red
  penCol[1] = color(247, 159, 31);  //orange
  penCol[2] = color(255, 195, 18);  //yellow
  penCol[3] = color(163, 203, 56);  //green
  penCol[4] = color(6, 82, 221);  //blue
  penCol[5] = color(217, 128, 250);  //purple
  penCol[6] = color(0, 0, 0);  //black
  penCol[7] = color(150, 150, 150); //gray
  penCol[8] = color(255, 255, 255);  //white
  
  //fill buttons with colors and info!
  for(int i = 0; i < _totalButtons; i++)
  {
    b[i] = new Button(_buttonSpacing*i + _buttonsX, _buttonsY, _buttonSize, penCol[i], i);
  }
  
  

}

void draw()
{
  //Fill clear button "x"
  x = new Clear(width-40, 35, 10);
  
  background(200);
  
  for(int y = 0; y < _tileStop; y = y + 1)
  {
    for(int x = 0; x < _tileStop; x = x + 1)
    {
      tileA[x][y].drawTile();
      tileA[x][y].makeHitbox();
    }
  }
  
  fill(225);
  rect(_buttonsX-25, _buttonsY-25, (_buttonSpacing * _totalButtons) + 40, _buttonSpacing/2 + 50, 10);
  for(int i = 0; i < _totalButtons; i++)  //draw buttons!!
  {
    b[i].make();
    b[i].changeCol();
  }
  
  //excecute clear button
  x.show();
  x.work();
}

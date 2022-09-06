int nPlanets = 300;
Planet[] p = new Planet[nPlanets];

void setup ()
{
  fullScreen();
  size(800, 600, P3D);
  
  for(int i = 0; i < nPlanets; i = i+1)
  {
    p[i] = new Planet(0, 0, 0);
    p[i].randomize();
    p[i].createMoons();
  }
  
}

void draw()
{
  clearScene();  //give planets trails
  
  translate(width/2, height/2);
  //excecute class
  for(int i = 0; i < nPlanets; i = i+1){
    p[i].show();
  }
  
}

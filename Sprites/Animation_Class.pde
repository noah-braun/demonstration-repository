class Anim
{
  int nFrames = 0;
  PShape[] frames;
  int counter = 0;
  int frameCounter = 0;
  int speed = 1;
  
  float w = 100;
  float h = 100;
  
  Anim(String[] fileNames)
  {
    this.nFrames = fileNames.length;
    this.frames = new PShape[this.nFrames];
    
    for(int i = 0; i < nFrames; i ++)
    {
      frames[i] = loadShape(fileNames[i]);
    }
  }
  
  void show()
  {
    this.counter = this.counter + 1;
    if(this.counter > speed)
    {
      this.counter = 0;
      this.frameCounter = this.frameCounter + 1;
      if(this.frameCounter >= this.nFrames) this.frameCounter = 0;
    }
    
    shape(this.frames[frameCounter], 0, 0, this.w, this.h);
    
    
  }
  
}

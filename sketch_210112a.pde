float t = 0;

void setup() {
  size(800,800);
  noFill();
}

void draw() {
  
  background(255);
  
  stroke(200);
  strokeWeight(0.5);
  
  for(float h = 0; h<= height; h += height/40) {
    line(0,h,width,h);
  }
  
  for(float w = 0; w<= width; w += width/40) {
    line(w,0,w,height);
  }
  
  float cx = width/2;
  float cy = height/2;
  
  float nmax = 70 * map(sin(t),-1,1,0,1);
  
  noFill();
  
  stroke(255);
  strokeWeight(7);
  
  for(int b=0; b<9; b++) {
    
    if(b%2 == 0) {
      stroke(200,50,50);
    }
    else {
      stroke(50,50,200);
    }
    
    float r = 250 + 10 * b;
    beginShape();
    for(float a=0; a<=TWO_PI; a+=0.01) {
      
      float nscale = nmax * sin(a/2);
      
      float x = cx + sin(a)*r;
      float y = cy + cos(a)*r;
      
      float xnoise = map(noise(x/200, y/200,t + b/50),0,1,-nscale,nscale);
      float ynoise = map(noise(x/200, y/200,t + 100 + b/50),0,1,-nscale,nscale);
      
      x = x + xnoise;
      y = y + ynoise;
      
      vertex(x,y);
    }
    endShape();
  }
  t += 0.01;
  filter(BLUR,0.2);
  //noLoop();
  
  saveFrame("line-######.png");
}

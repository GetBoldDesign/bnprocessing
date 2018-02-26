class Dots {
  
  PVector location;
  PVector velocity;
  color c;
  float radius=600;
  
  Dots(PVector _PV)
  {
    location = _PV;
    int j = (int)random(0, 5);
    if (j==0) c = color(#27043E);
    if (j==1) c = color(#FFB803);
    if (j==2) c = color(#FF3705);
    if (j==3) c = color(#B4FFFE);
    if (j==4) c = color(#460455);

    float xt =  random(-0.01+fft.getFreq(freq3)*0.05*senMic/ap,0.01);
    float yt = random(-0.01+fft.getFreq(freq3)*0.05*senMic/ap,0.01);

    velocity = new PVector(xt, yt);
  }
  
  void display()
  {
    fill(c);
    noStroke();
    ellipse(location.x, location.y, 1, 1);
  }
  
  void update()
  {
     radius=600+in.mix.get(50)*50*senMic;
    if (dist(location.x, location.y, 0, 0)>radius) { 
     
      velocity.mult(-1);
      location.add(velocity);
    }
    else {
      location.add(velocity);
    }
  }
}
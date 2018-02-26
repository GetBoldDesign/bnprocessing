import ddf.minim.*;
import ddf.minim.analysis.*;
import geomerative.*;
import processing.opengl.*;
import g4p_controls.*;

PFont font;
/*
Facteur sensibilité micro 
à modifier en fonction du contexte de captation sonore
multiplier par < 0 = moins sensible
multiplier par > 0 = plus sensible sensible
*/
float senMic=0.8;//
//////////////////////////
Minim minim;
AudioInput in;
FFT fft;
img Img;
BeatDetect beat;
Settings config;

ArrayList poop;
float distance =50;
boolean flag=true;
float eRadius;
float rot;
float freq1=440;
float freq2=40;
float freq3=240;
float ap=20;
float spectrumScale = 10;
float Count;

void printdebug(String infoToGet) {  
  println(infoToGet+ " > "+System.getProperty(infoToGet));
}


void setup()
{
  JSONArray data = null;
  config = new Settings();
  config.setConfigFileName("/home/guillaume/Documents/Musique/BayilmaNoc/bn.json");
  config.load();
  data = config.getData();
  
  
  createGUI();
  
  
  
  size(displayWidth, displayHeight,P3D);
  smooth();
  minim = new Minim(this);
  minim.debugOn();
  in = minim.getLineIn(Minim.MONO,2048);
  fft = new FFT(in.bufferSize(), in.sampleRate());
  Img= new img();
  beat = new BeatDetect();
  imageMode(CENTER);
  ellipseMode(RADIUS);
  eRadius = 20;
  
  poop = new ArrayList();
  for (int i=0;i<200;i++) {
    PVector PD = new PVector(random(-450, 450), random(-450, 450));
    Dots D = new Dots(PD);
    poop.add(D);
  }
  
}


void draw()
{
  Count-=0.01;
  translate(20, 50); 
  //background(233,190,59);
  background(56,3,57);
 
  fft.forward(in.mix);    
  rot=rot+0.01+(fft.getFreq(freq1)*0.03*senMic/ap);
  // draw the waveforms
  /*fill(255);
  stroke(255);
    for(int i = 0; i < in.bufferSize() - 1; i++)
    {
      line(i, 50 + in.mix.get(i)*50, i+1, 50 + in.mix.get(i+1)*50);
    }
       for(int i = 0; i < fft.specSize() - 1; i++)
    {
     line(i, 250, i, 250 - fft.getBand(i)*spectrumScale);
    }*/

 //BEAT    
  /*beat.detect(in.mix);
  float a = map(eRadius, 20, 80, 60, 255);
  fill(60, 255, 0, a);
  if ( beat.isOnset() ) eRadius = 80;
  ellipse(width/2, height/2, eRadius, eRadius);
  eRadius *= 0.95;
  if ( eRadius < 20 ) eRadius = 20;
  */
    pushMatrix();
    pushStyle(); 
    Img.show();
    popStyle();
    popMatrix();
  
  translate(width/2,height/2,100);  
     
  //----------------
 
  
distance = 50+fft.getFreq(freq3)*5*senMic;
float distance2 = 90+fft.getFreq(freq1)*1*senMic;

  for (int i=0;i<poop.size();i++) {  
    Dots dots1 = (Dots) poop.get(i);
    dots1.display();
    dots1.update();
    for (int j=i+1;j<poop.size();j++) {
      Dots dots2 = (Dots) poop.get(j);
      dots2.update();
      if (dist(dots1.location.x, dots1.location.y, dots2.location.x, dots2.location.y)<distance) {
        for (int k=j+1;k<poop.size();k++) {
          Dots dots3 = (Dots) poop.get(k);
          dots3.update();
            fill(dots3.c, 50);
            noStroke();
          if (dist(dots3.location.x, dots3.location.y, dots2.location.x, dots2.location.y)<distance) {
            beginShape();
            vertex(dots3.location.x, dots3.location.y);
            vertex(dots2.location.x, dots2.location.y);
            vertex(dots1.location.x, dots1.location.y);
            endShape();
          }
        }
        if (dist(dots1.location.x, dots1.location.y, dots2.location.x, dots2.location.y)<distance2) {
        for (int k=j+1;k<poop.size();k++) {
          Dots dots3 = (Dots) poop.get(k);
          dots3.update();
            stroke(dots3.c, 3+distance2*0.1);
            noFill();
          if (dist(dots3.location.x, dots3.location.y, dots2.location.x, dots2.location.y)<distance2) {
            beginShape();
            vertex(dots3.location.x, dots3.location.y);
            vertex(dots2.location.x, dots2.location.y);
            vertex(dots1.location.x, dots1.location.y);
            endShape();
            }
          }
        }
      }
    }
  }

  //----------------
  
  pushMatrix();
  pushStyle();
  tint(252, 195, 5, 200); 
  rect(width/2,height/2,width,height); 
  popStyle();
  popMatrix();
}
  
  
void stop()
{
  // always close Minim audio classes when you are finished with them
  in.close();
  // always stop Minim before exiting
  minim.stop();
  // this closes the sketch
  super.stop();
}
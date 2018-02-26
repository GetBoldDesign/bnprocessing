class img 
{
  
  PImage img;  
  PImage img2;  
  PImage img3;  
  PImage img4;  
  PImage img5;  
  PImage img6;  
  
  img(){
   
    img = loadImage("titre-bayilma-noc.png");
    img2 = loadImage("antarctique.png");
    img3 = loadImage("bateau.png");
    img4 = loadImage("carte-metrique.png");
  
  }
  void show(){
  pushMatrix();
  translate(width/2,height/2);
   /////////////////img4 carte
     pushMatrix();
     pushStyle();
     rotate(-rot*0.001);
    tint(255, 255,255,4+fft.getFreq(240)*10*senMic); 
    scale(3);
       //translate(1-fft.getFreq(freq1)*70*senMic/ap,0);
       image(img4,0, 0);
     popStyle();
     popMatrix();
     
    //////////img2 antarctique
    pushMatrix();
    pushStyle();
    translate(0,-40);
    rotate(rot);
      scale(0.5+fft.getFreq(freq3)*0.01*senMic/ap); 
      image(img2, 0, 0);
      popStyle();
    popMatrix(); 
   
        /////////////////img3 bateau
     pushMatrix(); 
     pushStyle();
     tint(229, 204, 234,100+fft.getFreq(freq2)*5*senMic/ap); 
          translate(0,-60);
     rotateZ(radians(-90));

        scale(0.8+in.mix.get(50)*2*senMic);
       image(img3, 0, 0);
       popStyle();
     popMatrix();
       /////////////////img titre
  pushMatrix(); 
  pushStyle();
    translate(0,-height/2+60);
    scale(0.7+fft.getFreq(freq2)*0.1*senMic/ap);
    tint(255,255); 
    image(img, 0, 0);
    popStyle();
  popMatrix();
  
  popMatrix();
  }  
}
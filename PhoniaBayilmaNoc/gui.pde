/* =========================================================
 * ====                   WARNING                        ===
 * =========================================================
 * The code in this tab has been generated from the GUI form
 * designer and care should be taken when editing this file.
 * Only add/edit code inside the event handlers i.e. only
 * use lines between the matching comment tags. e.g.

 void myBtnEvents(GButton button) { //_CODE_:button1:12356:
     // It is safe to enter your event code here  
 } //_CODE_:button1:12356:
 
 * Do not rename this tab!
 * =========================================================
 */

synchronized public void win_draw2(PApplet appc, GWinData data) { //_CODE_:window1:663623:
  appc.background(230);
} //_CODE_:window1:663623:

public void vdistance_change1(GTextField source, GEvent event) { //_CODE_:vdistance:322319:
  println("textfield1 - GTextField >> GEvent." + event + " @ " + millis());
} //_CODE_:vdistance:322319:

public void vfreq1_change1(GTextField source, GEvent event) { //_CODE_:vfreq1:788813:
  println("vfreq1 - GTextField >> GEvent." + event + " @ " + millis());
} //_CODE_:vfreq1:788813:

public void vfreq2_change1(GTextField source, GEvent event) { //_CODE_:vfreq2:471642:
  println("vfreq2 - GTextField >> GEvent." + event + " @ " + millis());
} //_CODE_:vfreq2:471642:

public void bsave_click1(GButton source, GEvent event) { //_CODE_:bsave:678943:
  println("bsave - GButton >> GEvent." + event + " @ " + millis());
} //_CODE_:bsave:678943:

public void bcancel_click1(GButton source, GEvent event) { //_CODE_:bcancel:812163:
  println("bcancel - GButton >> GEvent." + event + " @ " + millis());
} //_CODE_:bcancel:812163:

public void textfield1_change1(GTextField source, GEvent event) { //_CODE_:textfield1:346762:
  println("textfield1 - GTextField >> GEvent." + event + " @ " + millis());
} //_CODE_:textfield1:346762:



// Create all the GUI controls. 
// autogenerated do not edit
public void createGUI(){
  G4P.messagesEnabled(false);
  G4P.setGlobalColorScheme(GCScheme.BLUE_SCHEME);
  G4P.setCursor(ARROW);
  surface.setTitle("Sketch Window");
  window1 = GWindow.getWindow(this, "Window title", 0, 0, 600, 500, JAVA2D);
  window1.noLoop();
  window1.addDrawHandler(this, "win_draw2");
  vdistance = new GTextField(window1, 119, 19, 160, 30, G4P.SCROLLBARS_NONE);
  vdistance.setOpaque(true);
  vdistance.addEventHandler(this, "vdistance_change1");
  lbl_distance = new GLabel(window1, 24, 20, 80, 20);
  lbl_distance.setTextAlign(GAlign.CENTER, GAlign.MIDDLE);
  lbl_distance.setText("Distance");
  lbl_distance.setOpaque(false);
  lbl_freq1 = new GLabel(window1, 24, 66, 80, 20);
  lbl_freq1.setTextAlign(GAlign.CENTER, GAlign.MIDDLE);
  lbl_freq1.setText("Freq1");
  lbl_freq1.setOpaque(false);
  label2 = new GLabel(window1, 23, 120, 80, 20);
  label2.setTextAlign(GAlign.CENTER, GAlign.MIDDLE);
  label2.setText("Freq2");
  label2.setOpaque(false);
  vfreq1 = new GTextField(window1, 118, 66, 160, 30, G4P.SCROLLBARS_NONE);
  vfreq1.setOpaque(true);
  vfreq1.addEventHandler(this, "vfreq1_change1");
  vfreq2 = new GTextField(window1, 118, 121, 160, 30, G4P.SCROLLBARS_NONE);
  vfreq2.setOpaque(true);
  vfreq2.addEventHandler(this, "vfreq2_change1");
  bsave = new GButton(window1, 340, 299, 80, 30);
  bsave.setText("Save");
  bsave.addEventHandler(this, "bsave_click1");
  bcancel = new GButton(window1, 26, 302, 80, 30);
  bcancel.setText("Init");
  bcancel.addEventHandler(this, "bcancel_click1");
  label1 = new GLabel(window1, 25, 171, 80, 20);
  label1.setTextAlign(GAlign.CENTER, GAlign.MIDDLE);
  label1.setText("My label");
  label1.setOpaque(false);
  textfield1 = new GTextField(window1, 118, 170, 160, 30, G4P.SCROLLBARS_NONE);
  textfield1.setOpaque(true);
  textfield1.addEventHandler(this, "textfield1_change1");
  window1.loop();
}

// Variable declarations 
// autogenerated do not edit
GWindow window1;
GTextField vdistance; 
GLabel lbl_distance; 
GLabel lbl_freq1; 
GLabel label2; 
GTextField vfreq1; 
GTextField vfreq2; 
GButton bsave; 
GButton bcancel; 
GLabel label1; 
GTextField textfield1; 

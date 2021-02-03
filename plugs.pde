public void inLFR(float freq, float amp) {

  freqL = freq;
  ampL = amp;
}

public void IN_FA(float freq, float amp) {
  freqIN = freq;
  ampIN = amp; 

}

public void tempo (float tempo){ //tempo desde live
  tempoL=60/tempo;
  

}

public void speed (float speed){ //vel desde spiral
  sped=speed;
  

}

public void swing (float swingV){
  swing=swingV;
  
}

public void andaP (float anda ){
  andaPal=anda;
  println("anda"+andaPal);
  
}
public void traste (int trastenew ){
  fretON=trastenew;
  
}

public void avraSEQ (float avraM_temp, float note_temp){
  avraM = avraM_temp;
  avraS = true;
  note = note_temp;
}
/* incoming osc message are forwarded to the oscEvent method. */
//void oscEvent(OscMessage theOscMessage) {
  /* with theOscMessage.isPlugged() you check if the osc message has already been
   * forwarded to a plugged method. if theOscMessage.isPlugged()==true, it has already 
   * been forwared to another method in your sketch. theOscMessage.isPlugged() can 
   * be used for double posting but is not required.
  */  
 // if(theOscMessage.isPlugged()==false) {
  /* print the address pattern and the typetag of the received OscMessage */
  //println("### received an osc message.");
  //println("### addrpattern\t"+theOscMessage.addrPattern());
  //println("### typetag\t"+theOscMessage.typetag());
 // }
//}

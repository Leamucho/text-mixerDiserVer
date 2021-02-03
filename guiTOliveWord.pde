  
void guiTLiveWord (){  
  //fretON = 65; //quitar con guitarra activa, prender linea de abajo
  //if (fretON != lastfretON){ // do not repeat word
    
  OscMessage myMessage = new OscMessage("/fretword");
  fretword = int(map (fretON, 0,127,0,tokens.length-1));//0-127midi numbers in palitoelefante's 
                                    //frets, mapped to number of words on the array
  byte [] fretChosen = tokens[fretword].getBytes();
  if (fretword != lastFretword){
    println ("fretword "+fretword);
    myMessage.add(fretChosen);
    myMessage.add(fretword); 
    //fill(78);
    //rect (0,0,width,height);
    
    oscP5.send(myMessage, viZwords);//send the message
    myMessage.clear();
  }
}

void mousePressed(){
  saveFrame("######-####diser.png");

}

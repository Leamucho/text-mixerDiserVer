
import java.lang.String;
import java.nio.charset.Charset;
import oscP5.*;
import netP5.*;




void setup() {
  size(1920,1080,P3D);
  //frameRate(30);
  /* OSC STUFF start oscP5, listening for incoming messages at port 10004 */
  oscP5 = new OscP5(this,10005);
 
  viZwords = new NetAddress("192.168.137.1",10007);//towards viZwords another Processing 192.168.173.1
  background (0);
  
  oscP5.plug(this,"inLFR","/inL/");
  oscP5.plug(this,"IN_FA","/IN/");

  oscP5.plug(this,"tempo","/tempoL");
  oscP5.plug(this,"speed","/speed");
  oscP5.plug(this,"PAC2","/2_PotArribaCurvo");
  oscP5.plug(this,"swing","/palitoCtrl/rotaD/cYaN");
  oscP5.plug(this,"traste","/trastes");
  oscP5.plug(this,"andaP","/andaPal");
  oscP5.plug(this,"avraSEQ","/avraSEQ");
  
  //attic = loadFont("Attic-48.vlw");
  attic = createFont("../0fuentes/Attic.ttf", 50, true );
  ///for starting, 
  
  ahora = P00;
  lines = loadStrings(ahora); //
  ///first time of loading and cutting the txt
  allText = join(lines, " ");
  tokens = splitTokens(allText, " !\"");
  
  // Create the font
  //textFont(createFont("Attic.ttf", 48, true ));
  
  
  contadorE = int(random(5,17));
  // for the first time moved
  x= random(width-100);
  y= 48 * random(height/48);
  textFont(attic);
}
void keyPressed (){
  ////////////////////////
  ///parar/////
  ///////////////////////
  if ( ((key == 'p')) /*|| (boolean o 0/1 desde OSC)*/ ){
    parar = !parar;
  
  
  }
  avraS = true;
  avraM = 0.1;
}



void draw() {
  
  ///////////////////////
  ///PRESENTACION ////
  /////////////////////////
  if (LIVE == false) {
    background(255);
    //begin of words
    ///cambiar la letra renderizada para la presentaci'on...
    stroke(255);
    strokeWeight(10);
    textFont(attic);
    textSize(30);
    stroke(0);
    strokeWeight(10);
    
    fill(180,132,64,200);
    text (lines[0], 500,180, 50); //pensar estudante
    fill(40,200);
    text (lines[0], 500,180, 100); //pensar estudante
    textSize(80);
    fill(100,100,64,200);
    text (lines[0], 400,180, 50); //pensar estudiante
    
    fill (0);
    textSize(46);
    text (lines[1], 50,300); //ampliar
    text (lines[2], 100,360); // roer
    text (lines[3], 150,420); //criticar
    
    text (lines[4], 300,520); // estudiar
    fill(40);
    textSize(50);
    text (lines[5], 300,550); //estudiante
    //text (lines[7], 0,520);
    
    fill (0);
    text (lines[7], 120,820); //leamuchoft
    fill(#100B4D);
    text (lines[8], -8000+preCoun,950); //chorro
    
    preCoun += (noise (Coun))*10;
  }
  Coun+=0.02; //<>//
  //////////////////////////////
  ///GUITAR TO WORD-RESPONSE////
  //////////////////////////////
  guiTLiveWord ();
  
  //////////////////////////////////
  ///////RANDOM TEXT CHOOSING/////////
  //////////////////////////////////
  if (((ampIN > -40)&&(freqIN > 562))||(ampL > -30)|| (pot2 > 0.97 ) || ((key != 'p')&&(keyPressed == true )) ){ 
    // to be changed when OSC working!!
    // yo -23 con frecuencias de mas de 2000  people -9  o el viejo pot2 alto 
    randTexChoo(); //<>//
  }
  
  ////////////////////////
  //pasarlo al plug///
  ///////////////////////
  if ((andaPal == 1) || (parar == true)){ //oprimir un traste especifico en palito
    
    keepON = !keepON; //switch keepon
  }
  
  if (keepON) {onetime = 1;}
  else {onetime = 0;}
  
  //println ("andapal" +andaPal + "parar" + parar + "onetime"+ onetime);
  ///////////////////
  ////TXT READER/////
  ///////////////////
  if (onetime>0) {
    if (newTex){
      if (( millis() > esperaN+3000) && (millis() < esperaN+3100)){
        //solo esperar , no dibujar nada si hay texto nuevo
        newTex = false; //para salir una vez cuente
        contaNtex ++;
      }
    }else if (contador < tokens.length ){
    //if ((keepON)&& (contador < tokens.length )){    
        
        colorMode (HSB,360,100,100,255);
        //println (keys.length + "p is");
        // Look at each word with rhythm
        counter ++;
        swing = 1.0138974513426753; //to be muted when OSC working!!!
        to +=  swing;
        //println ("to "+ to + "tempo" + tempoL);
        if  ((int(to) % (tempoL*3) == int(tempoL*0.2))) {
          fill (192,82,86,map (ampIN,-96,-20,100,255)); //dibujar estudiante con alpha de amp1
          text ("estUdiANte", random(width-80-textWidth("estUdiANte")), random(height-38));
        }
        if (( avraM > 0 ) && (avraS)) {  
          avraS = false;
          //if ((int(to) % tempoL == int(tempoL*0.35))||(int(to) % tempoL == int(tempoL*0.55))||(int(to) % tempoL == int(tempoL*0.85))
          //    ||(int(to) % tempoL == int(tempoL*0.02))){ 
            
          //contador = constrain (contador, 0, tokens.length-1);    
          
          int fsize = int(map (x,0,width,60,30));
          //int i_e = int(i);
          textSize(fsize+int(map(ampIN,-96,-20,0,10))); //grande seg'un amp people
          
          if (contaNtex == 1) {
            textHue= random(238,285);//morado si newtext
            contaNtex= 0;
          } else if (ampIN > -58 ) {
            textHue = map (freqIN, 200, 1200,0,360); //verde-azul si alta amp2
          } else { // mezcla de resto
            xoff += 0.01*fretON;
            textHue = map (freqIN, 200, 1200,0,70)+ map (freqL, 200, 1200,0,70)+(noise(xoff)*sin(xoff*100)*fretON*0.6);
          }
          fill( textHue,75,100);
          ///look for 32
          String[] m1 = match(tokens[contador], "(.*?)(32)(.++)");
          String[] m2 = match(tokens[contador], "(.*?)(3232)(.++)");
          /////////////////////////
          /// se acabo el height///
          if (y > height) {
            
            //keepON = false;
            onetime = 0;//
            y= int(random(38,56));
            esperaNegra = millis();
            
            
          }
          if ((m1 != null)&& (m2 == null)){ //usar las divisiones de m1 //<>//
                         // si hay coincidencia con un solo 32
            text (m1[1],x,y);  //la palabra del final   
            x = 0;
            y += 38;
            fsize = int(map (x,0,width,60,30));
            textSize(fsize+int(map(ampIN,-96,-20,0,10)));
            text (m1[3],x,y); //la palabra del principio //<>//
            x += textWidth(m1[3] + " ");          
            
          } else if (m2 != null) { // si hay coincidencia con 2 32 //<>//
            
            text (m2[1],x,y);     
            x = 0;
            y += 38*2;
            fsize = int(map (x,0,width,60,30));
            textSize(fsize+int(map(ampL,-96,-20,0,10)));
            text (m2[3],x,y);
            x += textWidth(m2[3] + " "); //<>// //<>//
          
          //} else if (){ //<>//
          } else {
            if (contador == contadorE){
              fill (192+(int(random(-1,1)*map (ampL,-96,-25,10,30))),82,86,map (ampL,-96,-25,100,255)); //dibujar estudiante con alpha de amp1
              textSize(fsize);
              text ("estUdANte",x, y);
              x += textWidth("estUdANte" + " ");
              fill( map (freqIN, 200, 1200,0,70),75,100);
              text(tokens[contador], x, y);
              x += textWidth(tokens[contador] + " ");
              contadorE = contador+int(random(5,17));
            } else {
              text(tokens[contador], x, y);
              x += textWidth(tokens[contador] + " ");
              // si no siga con tokens [contador] normal
            }
          }
          
        
          // If x gets to the end, move on y
          if (x > width-80){ // no solo por cercan'ia al borde
                    //toca tambi'en por final de l'inea
            x = 0;
            y += int(random(46,56));
            // If y gets to the end, we're done
              //<>//
          } 
          contador ++; //<>//
          println(contador);
        }
    } else { //si acabó todo el array contador
             // espere y chute aleatorio
      //esperaNegra = millis()- 4000;
      onetime=0; // para que haga el aleatorio controlado //<>//
      //keepON = para despues creo que se peude poner a funcionar con una booleana 
      //x= random(width-100);
      //y= int(random(38,56)) * random(1,height/38); //entre uno y height/38 porque con cero da uno y no se vería la letra
      //lanzar el aleatorio
      randTexChoo(); //<>//
      //otravez para que no dibuje, espere
      newTex = true; //hay nuevo texto
      esperaN = millis (); //guardar el tiempo para esperar a sacar el neuvo texto
    }
  }
  /////////////////////
  ///espera newtext///
  ////////////////////
  
  
  /////////////////////
  ///PANTALLA NEGRA///
  ////////////////////
  if ((millis() > esperaNegra+ 3000)
  &&(millis() < esperaNegra+ 3100) 
  && //(! ahora.equals( "presentation.txt"))) {//algo que no loa ctive de una
    (ahora != P00)
    ){
    //black screen to start over but not when on presentation 
    //nor past 3 seconds of beggining
    //only when 3 seconds have passed after going out of height 
    // 3000-3100 interval to not have it repeating always
    onetime = 1;
    //keepON = true;
    
    colorMode(RGB, 255,255,255,255);
    background (random(70),50); //<>//
  }
  
  
  lastfretON = fretON;
  lastFretword = fretword;
  //saveFrame("pensar3-############.jpg");
  //println("con:" + contador + "  tokL:" + tokens.length + "  ahora:"+ ahora + "  one:" + onetime);
  //println("precoun:" + preCoun + "  coun:" + Coun + "  millis:"+ millis() + "  contaNtex:" + esperaNegra+ "  one:" + onetime);
}

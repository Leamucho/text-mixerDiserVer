
void randTexChoo(){//otro color cuando cambia de texto 
  //background(0);
  onetime++;
  keepON = true;
   
  //if ((onetime == 1) || ((onetime > 4)&&(onetime < 8) )){ // es porque el presionar es muy r'apido y alcanza a cambiar mucho, 
  //if (keepON) {                                                //entre 4 y 8 se ejecuta la aleatoriedad
    //ahora = M00;
    aleat_ahora = int(random (76));
    switch (aleat_ahora){
      case 0: ahora = M00; break;
      case 1: ahora = M01; break;
      case 2: ahora = M02; break;
      case 3: ahora = M03; break;
      case 4: ahora = M04; break;
      case 5: ahora = M11; break;
      case 6: ahora = M17; break;
      case 7: ahora = M18; break;
      case 8: ahora = M12; break;
      case 9: ahora = M15; break;
      case 10: ahora = M16; break;
      case 11: ahora = M13; break;
      case 12: ahora = M19; break;
      case 13: ahora = M20; break;
      case 14: ahora = M21; break;
      case 15: ahora = M22; break;
      case 16: ahora = M23; break;
      case 17: ahora = M24; break;
      case 18: ahora = M25; break;
      case 19: ahora = M26; break;
      case 20: ahora = M27; break;
      case 21: ahora = M1a11; break;
      case 22: ahora = M1a3; break;
      case 23: ahora = M1a4; break;
      case 24: ahora = M22a; break;
      case 25: ahora = M251; break;
      case 26: ahora = M261; break;
      case 27: ahora = M210a; break;
      case 28: ahora = M214a; break;
      case 29: ahora = M2a1; break;
      case 30: ahora = M1a2; break;
      case 31: ahora = M2a2; break;
      case 32: ahora = M2a3; break;
      case 33: ahora = M31; break;
      case 34: ahora = M32; break;
      case 35: ahora = M33; break;
      case 36: ahora = M34; break;
      case 37: ahora = M35; break;
      case 38: ahora = M36; break;
      case 39: ahora = M37; break;
      case 40: ahora = M38; break;
      case 41: ahora = M39; break;
      case 42: ahora = M310; break;
      case 43: ahora = M3a1; break;
      case 44: ahora = M3a2; break;
      case 45: ahora = M3a3; break;
      case 46: ahora = M3a4; break;
      case 47: ahora = M3a5; break;
      case 48: ahora = M3a6; break;
      case 49: ahora = M3a7; break;
      case 50: ahora = M3a8; break;
      case 51: ahora = M41; break;
      case 52: ahora = M42; break;
      case 53: ahora = M43; break;
      case 54: ahora = M44; break;
      case 55: ahora = M45; break;
      case 56: ahora = M6a3; break;
      case 57: ahora = M6a4; break;
      case 58: ahora = M6a5; break;
      case 59: ahora = M6a6; break;
      case 60: ahora = M6a7; break;
      case 61: ahora = M6a8; break;
      case 62: ahora = M6a9; break;
      case 63: ahora = M6a10; break;
      case 64: ahora = M6a11; break;
      case 65: ahora = M6a12; break;
      case 66: ahora = M6a13; break;
      case 67: ahora = DORIAN; break;
      case 68: ahora = ALmAR; break;
      case 69: ahora = suz; break;
      case 70: ahora = M50; break;
      case 71: ahora = M51; break;
      case 72: ahora = M52; break;
      case 73: ahora = M53; break;
      case 74: ahora = M54; break;
      case 75: ahora = M55; break;
    }
    //if the text had not finished, draw where it was...  
    //if ((tokens.length > 0)&&(contador < tokens.length)){
    //if (contador > tokens.length){
      
      
    //}
    //ahora = M41; //prueba final
    ///for each random txt
     lines = loadStrings(ahora); //Load ahora text into array 
     allText = join(lines, str(0x20));///asi esta botando los \n como 32 que es buen avance
    tokens = splitTokens(allText, " ");
    contador = int(random(0, tokens.length-18));
    contadorE = contador+int(random(5,17));
    //ahora = M04;
    onetime=1; //<>// //<>// //<>//
    LIVE = true;
    
  //}

}

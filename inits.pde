//from OSC variables
float freqL = 517, ampL = -68; //L leandro
float freqIN = 517, ampIN = -68; //IN mic interno
float freqOUT = 517, ampOUT = -68; //OUT mic externo



float pot2;
float tempoL = 120, sped = 2;
int fretON = 64;
int lastfretON, fretword, lastFretword;
byte [] lastFretChosen;
float andaPal;
float avraM, note;
boolean avraS;

//tiempo de espera
long esperaNegra;

OscP5 oscP5;

NetAddress viZwords;
String P00 = ("../0textos/P00_2.txt"); // presentacion
String M00 = ("../0textos/intruso.txt"); //P
String M01 = ("../0textos/cabana.txt");//P
String M02 = ("../0textos/wimWendersFronteira.txt");//P
String M03 = ("../0textos/frontiere .txt");
String M04 = ("../0textos/M04.txt");//
String M11 = ("../0textos/M11.txt");//merleau ponty
String M12 = ("../0textos/M12.txt");
String M13 = ("../0textos/M13.txt");
String M14 = ("../0textos/M14.txt");
String M15 = ("../0textos/M15.txt");//Hayles
String M16 = ("../0textos/M16.txt");//
String M17 = ("../0textos/M17.txt");//
String M18 = ("../0textos/M18.txt");//
String M19 = ("../0textos/M19.txt");//
String M20 = ("../0textos/M20.txt");//
String M21 = ("../0textos/M21.txt");//
String M22 = ("../0textos/M22.txt");//
String M23 = ("../0textos/M23.txt");//
String M24 = ("../0textos/M24.txt");//
String M25 = ("../0textos/M25.txt");//
String M26 = ("../0textos/M26.txt");//
String M27 = ("../0textos/M27.txt");//
String M50 = ("../0textos/lamujertemeLuisF.txt");
String M51 = ("../0textos/huxley-unMundoFeliz.txt");
String M52 = ("../0textos/Brave New World - Aldous Huxley.txt");
String M53 = ("../0textos/Antonio-Damasio-Estranha.txt");
String M54 = ("../0textos/Huxley-admiravel.txt");
String M55 = ("../0textos/huxley-unMundoFelizSoma.txt");//
String M1a2 = ("../0textos/M1a2.txt");//
String M1a11 = ("../0textos/[M1a,1].txt");//Mil mesetas
String M1a3 = ("../0textos/[M1a,3].txt");// constru cuerpos pabon
String M1a4 = ("../0textos/M19.txt");//mombaca
String M22a = ("../0textos/[M2,2].txt");//EL AULA SIN MUROS
String M251 = ("../0textos/[M2,5].txt");//autoridad
String M261 = ("../0textos/[M2,6].txt");//todo lo solido
String M210a = ("../0textos/[M2,10a].txt");//rAYU
String M214a = ("../0textos/[M2,14a].txt");
String M2a1 = ("../0textos/[M2a,1].txt");
String M2a2 = ("../0textos/[M2a,2].txt");
String M2a3 = ("../0textos/[M2a,3].txt");
String M31 = ("../0textos/[M3,1].txt");
String M32 = ("../0textos/[M3,2].txt");
String M33 = ("../0textos/[M3,3].txt");
String M34 = ("../0textos/[M3,4].txt");
String M35 = ("../0textos/[M3,5].txt");
String M36 = ("../0textos/[M3,6].txt");
String M37 = ("../0textos/[M3,7].txt");
String M38 = ("../0textos/[M3,8].txt");
String M39 = ("../0textos/[M3,9].txt");
String M310 = ("../0textos/[M3,10].txt");//
String M3a1 = ("../0textos/[M3a,1].txt");
String M3a2 = ("../0textos/[M3a,2].txt");
String M3a3 = ("../0textos/tec_couchot.txt");
String M3a4 = ("../0textos/[M3a,4].txt");
String M3a5 = ("../0textos/[M3a,5].txt");
String M3a6 = ("../0textos/[M3a,6].txt");
String M3a7 = ("../0textos/[M3a,7].txt");
String M3a8 = ("../0textos/[M3a,8].txt");//
String M41 = ("../0textos/[M4,1].txt");
String M42 = ("../0textos/[M4,2].txt");
String M43 = ("../0textos/[M4,3].txt");
String M44 = ("../0textos/[M4,4].txt");
String M45 = ("../0textos/[M4,5].txt");//
String M6a3 = ("../0textos/M6a3.txt");//
String M6a4 = ("../0textos/M6a4.txt");
String M6a5 = ("../0textos/M6a5.txt");//
String M6a6 = ("../0textos/M6a6.txt");
String M6a7 = ("../0textos/M6a7.txt");//
String M6a8 = ("../0textos/M6a8.txt");
String M6a9 = ("../0textos/M6a9.txt");//
String M6a10 = ("../0textos/M6a10.txt");
String M6a11 = ("../0textos/M6a11.txt");
String M6a12 = ("../0textos/M6a12.txt");
String M6a13 = ("../0textos/M6a13.txt");
String DORIAN = ("../0textos/DORIAN.txt");
String ALmAR = ("../0textos/ALMAR.txt");
String suz = ("../0textos/Suz_computacional.txt");

float Coun;
float preCoun;
String[] lines;
String allText ;
int aleat_ahora;
String ahora ; //donde queda el texto que se va a graficar
int onetime;
boolean keepON, parar;
boolean newTex = false;//se lleg'o a un texto nuevo?
long esperaN; //tiempo de espera entre texto acabado y nuevo
boolean LIVE = false;
///////FOR THE WORDS RHYTHM//////

float to= 1.0;
float swing = 0.56;
int counter;
int contador, contadorE;
float x = 0;
float y = 48;
float textHue;
float xoff;
int contaNtex;
float bonusCnewText; // indicaci'on de nuevo texto
// The raw array of words in 
String[] tokens;


int rate;
PFont attic;
String s;

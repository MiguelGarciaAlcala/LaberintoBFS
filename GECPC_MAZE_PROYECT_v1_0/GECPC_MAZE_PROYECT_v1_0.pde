/**
 * @author Miguel-Sama
 * @version 1.0
*/

Laberinto laberinto;
boolean inicio;

void setup(){
  size(1350, 680, P3D);
  noStroke();
  rectMode(CENTER);
  
  this.inicio = false;
  laberinto = new Laberinto();
  laberinto.verSolucion();
}

void draw(){
  background(255);
  
  fill(0, 0, 255);
  textSize(30);
  text("PROYECTO GECPC v2.0", 20, 40);
  
  fill(0, 0, 0);
  textSize(15);
  text("Solucion óptima en: " + ((laberinto.EFinal != null) ? laberinto.EFinal.dist_Total+" " : "-- ")+ "pasos.", 20, 60);
  
  this.botonInicio();
  if(inicio) laberinto.dibujar();
}

void botonInicio(){
  fill(0,30,255);
  rect(60,95,80,40);
  
  fill(255);
  text("INICIO",40,100);
  
  if(mousePressed){
    if(mouseX>=20 && mouseX<=110)
      if(mouseY>=90 && mouseY<=130){
        fill(255,0,0);
        rect(60, 95, 80, 40);
        
        fill(255);
        text("INICIO",40,100);
        
        this.inicio = true;
      }
  }
}
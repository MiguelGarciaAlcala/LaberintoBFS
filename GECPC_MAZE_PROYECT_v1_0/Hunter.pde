class Hunter extends ControlGrafico
{
  PShape hunter = createShape(SPHERE, alto/2);
  PImage textura = loadImage("b1.jpg");
  
  private ArrayList <int[]> camino;
  private int estado = 0;
  private float x_coord;
  private float z_coord;
  private int dx, dz; 

  public Hunter(Estado EInicial, ArrayList <int[]> camino) {
    this.dx = EInicial.coord_Y;
    this.dz = EInicial.coord_X;
    hunter.setTexture(textura);
    this.camino = camino;
  }

  public void dibujar() { 
    pushMatrix();
      this.controlCamara();
      fill(255, 0, 0);
      
      this.x_coord = x_inicial + dx*alto;
      this.z_coord = z_inicial - dz*alto;

      translate(x_coord, y_inicial, z_coord);
      shape(hunter);
      control();
      delay(50);
    popMatrix();
  }

  private void control() 
  {
      if(estado < camino.size()){
        if ( camino.get(estado)[1] > this.dx )
          this.dx++;
        else if ( camino.get(estado)[1] < this.dx )
          this.dx--;
        
        if ( camino.get(estado)[0] > this.dz )
          this.dz++;
        else if ( camino.get(estado)[0] < this.dz )
          this.dz--;
        estado++;
      }
  }
}
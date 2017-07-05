class Estado
{
    
  /* 
    - Atributos de Estado.
      * dist_Total: distancia del personaje (Hunter) respecto a su posición inicial.
      * coord_x: coordenada en el eje X.
      * coord_y: coordenada en el eje Y.
  */
  private int dist_Total;
  private int coord_X;
  private int coord_Y;
  
  /* 
    - Constructor de Estado.
      Inicializa los atributos de acuerdo a los parámetros que defina el usuario.
  */  
  public Estado(int coord_X, int coord_Y, int dist_Total){
    this.dist_Total = dist_Total;
    this.coord_X = coord_X;
    this.coord_Y = coord_Y;
  }
}
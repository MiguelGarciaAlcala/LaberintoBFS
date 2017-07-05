abstract class ControlGrafico
{ 
  /*
    - Matriz de caracteres: 
      Nos da la información necesaria para construir el laberinto.
        * Caracter 'o': le indica al programa que hay un muro y este lo dibujará en la posición correspondiente.
        * Caracter 'H': representa el personaje que debe salir del laberinto; su nombre es Hunter.
        * Caracter 'S': representa el objetivo o salida a la cual debe llegar Hunter.
  */
  public char[][] laberinto 
  = {{'H','.','o','o','o','.','o','o','o','o','.','.','.','o','o','o','o','o','.','.','.','o','o','o','o','o','o','o','o','o','o','o','o','o','o','o','o'},
     {'o','.','o','.','.','.','.','.','.','.','.','o','.','.','.','.','.','.','.','o','.','.','.','.','.','.','.','.','o','.','.','.','.','.','.','.','o'},
     {'o','.','o','.','o','.','o','o','o','o','o','o','o','o','o','o','o','o','o','o','o','o','o','o','o','o','o','.','o','.','o','o','o','o','o','.','o'},
     {'o','.','o','.','o','.','o','.','.','.','.','.','.','.','.','.','.','.','.','.','.','.','.','.','.','.','.','.','o','.','o','.','o','.','o','.','o'},
     {'o','.','o','.','o','.','o','.','o','o','o','o','o','o','o','o','o','o','o','o','o','o','o','o','o','o','o','.','o','.','o','.','.','.','o','.','o'},
     {'o','.','o','.','o','.','o','.','o','.','.','.','.','.','.','.','.','.','.','.','.','.','.','.','.','.','o','o','o','.','.','.','.','o','o','.','o'},
     {'o','.','o','.','o','.','o','.','o','.','o','o','o','o','o','o','o','o','o','o','o','o','o','.','o','o','o','.','o','o','o','.','o','o','.','.','o'},
     {'o','.','o','.','o','.','o','.','o','.','o','.','o','.','.','.','o','.','.','.','o','.','.','.','o','.','o','.','.','.','o','.','.','o','o','.','.'},
     {'o','.','o','.','o','.','o','.','o','.','o','S','.','.','o','.','.','.','o','.','.','.','o','.','o','.','o','.','o','.','o','.','.','o','o','o','.'},
     {'o','.','o','.','o','.','o','.','o','.','o','o','o','o','o','o','o','o','o','o','o','o','o','o','o','.','o','.','o','.','o','.','o','o','.','o','.'},
     {'o','.','o','.','o','.','o','.','o','.','.','.','.','.','.','.','.','.','.','.','.','.','.','.','.','.','o','.','o','.','o','.','o','.','.','o','.'},
     {'.','.','o','.','o','.','o','.','o','o','o','o','o','o','o','o','o','o','o','o','o','o','o','o','o','.','o','.','o','.','o','.','.','.','o','o','.'},
     {'.','o','o','o','.','.','o','.','.','.','.','.','.','.','.','.','.','.','.','.','.','.','.','.','.','.','o','.','o','.','o','o','o','.','o','.','.'},
     {'.','.','.','o','o','.','o','o','o','o','o','o','o','o','o','o','o','o','o','o','o','o','o','o','o','o','o','.','o','.','o','.','.','.','o','.','o'},
     {'o','.','.','.','o','.','o','.','.','.','o','.','.','.','o','.','.','.','o','.','.','.','o','.','.','.','o','.','o','.','o','o','.','o','o','.','o'},
     {'o','.','o','o','o','.','.','.','o','.','.','.','o','.','.','.','o','.','.','.','o','.','.','.','o','.','.','.','o','.','o','.','.','.','o','.','o'},
     {'o','.','.','.','o','o','o','o','o','o','o','o','o','o','o','o','o','o','o','o','o','o','o','o','o','o','o','o','o','.','o','o','.','o','o','.','o'},
     {'o','.','o','o','o','.','.','o','.','.','.','o','.','.','.','o','.','.','.','o','.','.','.','o','.','.','.','o','.','.','.','o','.','o','.','.','o'},
     {'o','.','o','.','o','.','.','.','.','o','.','.','.','o','.','.','.','o','.','.','.','o','.','.','.','o','.','.','.','o','o','.','.','o','.','o','o'},
     {'o','.','o','.','o','.','o','.','o','o','o','o','o','o','o','o','o','o','o','o','o','o','o','o','o','o','o','o','o','o','o','.','o','.','.','.','o'},
     {'.','.','o','.','o','o','o','.','.','.','.','.','.','.','.','.','.','.','.','.','.','.','.','.','.','.','.','.','.','.','.','.','o','o','o','.','o'},
     {'.','o','o','.','o','.','o','o','o','o','o','o','o','o','o','o','o','o','o','o','o','o','o','o','o','o','o','o','o','o','o','o','.','.','.','.','o'},
     {'.','o','.','.','.','.','.','.','.','.','o','.','.','.','.','.','o','.','.','.','.','.','.','.','.','o','.','.','.','.','.','.','.','o','o','.','o'},
     {'.','.','.','o','o','o','o','o','o','.','.','.','o','o','o','.','.','.','o','o','o','o','o','o','.','.','.','o','o','o','o','o','o','o','o','o','o'},
    };
  
  
  
  /* 
    - Dimensiones del escenario.
    Las siguientes variables van a definir la apariencia de nuestro escenario.
      * largo: esta variable almacena el número de filas que posee la matriz "laberinto".
      * ancho: esta variable almacena el número de columnas que posee la matriz "laberinto".
      * alto: contiene el tamaño de las paredes del laberinto.
  */
  
  public int largo = laberinto.length;
  public int ancho = laberinto[0].length;
  public int alto = width/15;
  
  
  
  /* 
    - Variables de control inicial.
      * x_inicial: posición inicial del escenario respecto al eje X de coordenadas.
      * y_inicial: posición inicial del escenario respecto al eje Y de coordenadas.
      * z_inicial: posición inicial del escenario respecto al eje Z de coordenadas.
      * cam[][]: es una matriz de tipo flotante. Su contenido define la configuación inicial de la cámara.
  */
  
  public float x_inicial = width/2 - alto*ancho/2;
  public float y_inicial = height/2 + 300;
  public float z_inicial = -700;

  public float[][] cam = {{width/2, height/2 - 1800, z_inicial}, {x_inicial + ancho*alto/2, y_inicial, z_inicial - largo*alto/2}};  
  
  /* 
    - Métodos de control gráfico.
      * dibujar(): este método crea los objetos necesarios para proyectar la matriz "laberinto" en formato gráfico.
      * controlCamara(): cambia la posición de la cámara, en función de las teclas que presione el usuario.
  */
  
  public abstract void dibujar();
  
  public void controlCamara(){
    camera(cam[0][0], cam[0][1], cam[0][2], cam[1][0], cam[1][1], cam[1][2], 0, 1, 0);
    if(keyPressed){
      if(keyCode == UP)
        cam[0][1] -= 30;
      else if(keyCode == DOWN)
        cam[0][1] += 30;
      if(keyCode == LEFT)
        cam[0][2] -= 30;
      else if(keyCode == RIGHT)
        cam[0][2] += 30;
    }
  }
}
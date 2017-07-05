import java.util.LinkedList;
import java.util.Stack;
import java.util.Queue;

class Laberinto extends ControlGrafico
{
    private final ArrayList <int[]> arrayCamino;
    private final boolean[][] matrizVisitados;
    private final Queue <Estado> colaEstados;
    private final Stack <int[]> pilaCamino;
    private final Estado EPrevios[][];
    
    private Estado EInicial;
    public Estado EFinal;
    private Hunter hunter;

    public Laberinto()
    {
        this.matrizVisitados = new boolean[largo][ancho];
        this.EPrevios = new Estado[largo][ancho];
        this.colaEstados = new LinkedList();
        this.arrayCamino = new ArrayList();
        this.pilaCamino = new Stack();
    }

    private boolean buscarInicio(){
        for(int i=0; i < largo; i++)
            for(int j=0; j<ancho; j++)
                if(laberinto[i][j] == 'H'){
                    this.EInicial = new Estado(i,j,0);
                    return true;
                }
        return false;
    }

    private boolean haySolucion(){
        if(this.buscarInicio()){
            println("=== LABERINTO ===");
            imprimirLaberinto();
            
            println("* La posición inicial es: ("+(EInicial.coord_X+1)+", "+(EInicial.coord_Y+1)+")\n");
            colaEstados.offer(EInicial);

            int dx[] = {0, 0, 1, -1 };
            int dy[] = {1, -1, 0, 0 };

            while(!colaEstados.isEmpty())
            {
                Estado actual = colaEstados.poll();
                if( this.laberinto[actual.coord_X][actual.coord_Y]== 'S' ){
                    this.EFinal = new Estado( actual.coord_X, actual.coord_Y, actual.dist_Total );
                    return true;
                } 
                
                matrizVisitados[actual.coord_X][actual.coord_Y] = true;
                for( int i = 0; i < 4; i++ ){
                    int nx = dx[i] + actual.coord_X;
                    int ny = dy[i] + actual.coord_Y;
                    
                    if( nx >= 0 && nx < largo && ny >= 0 && ny < ancho && laberinto[nx][ny] != 'o' && !matrizVisitados[nx][ny] ){
                        Estado medio = new Estado(nx, ny, actual.dist_Total+1);
                        this.EPrevios[nx][ny] = actual;
                        colaEstados.offer(medio);
                    }
                }
            }
        } else println("-- No hay posición inicial ---\n");
        
        return false;
    }
    
    public void verSolucion(){
        if(this.haySolucion()){
            int xFin = EFinal.coord_X;
            int yFin = EFinal.coord_Y;
            char [][] temp = this.laberinto;
            
            this.EPrevios[EInicial.coord_X][EInicial.coord_Y] = new Estado(0,0,-1);
            
            for(int i=xFin, j=yFin; EPrevios[i][j].dist_Total != -1 ; i=EPrevios[xFin][yFin].coord_X, j=EPrevios[xFin][yFin].coord_Y)
            {
                pilaCamino.push(new int[]{i,j});
                temp[i][j] = '*'; 
                xFin = i; 
                yFin = j;
            } 
            
            while(!pilaCamino.isEmpty()) arrayCamino.add(pilaCamino.pop());
            temp[EFinal.coord_X][EFinal.coord_Y] = 'S';            
            
            println("=== SOLUCIÓN ===");
            println("*Ruta óptima en: "+ EFinal.dist_Total +" pasos.");
            println("*Objetivo: ("+ (EFinal.coord_X+1) +", "+ (EFinal.coord_Y+1) +")\n");
            
            this.imprimirMatriz(temp);
            this.imprimirEstados();
            
        } else println("--- El laberinto no ha sido resuelto ---");
        
        if(this.EInicial != null) this.hunter = new Hunter(this.EInicial, this.arrayCamino);
    }
    
    private void imprimirLaberinto(){
        this.imprimirMatriz(laberinto);
    }
    
    private void imprimirEstados(){
        println("\n=== ESTADOS ===");
        for(int[] coord: arrayCamino)
            print("["+(coord[0]+1)+", "+(coord[1]+1)+"]");
        println("");
    }
    
    private void imprimirMatriz(char [][] matriz){
        for( int i = 0 ; i < matriz.length; i++){
            if(i==0){
                print("   ");
                for(int k=0; k<ancho; k++) print("["+(k+1)+"]");
                println("");
            }
            print("["+(i+1)+"]");
            for( int j = 0 ; j < matriz[0].length; j++)
                print(" "+matriz[i][j]+" ");
            println("");
        }
    }
      
    @Override   
    public void dibujar(){ 
      pushMatrix();  
        this.controlCamara();
        stroke(0);
      
        translate(x_inicial, y_inicial, z_inicial);     
        for(int i=0; i < largo; i++){
          for(int j=0; j < ancho; j++){
            if(laberinto[i][j] == 'o'){
                fill(50,200,0);
                box(alto);
             } else {
                pushMatrix();
                  noFill();
                  rotateX(PI/2);
                  translate(0,0,-alto/2);
                  
                  if(laberinto[i][j] == 'S') fill(255,0,0);
                  else if(laberinto[i][j] == 'H') fill(255,255,0);
                  rect(0, 0, alto, alto);               
                popMatrix(); 
            }   translate(alto, 0, 0); 
          }     translate(-ancho*alto, 0, -alto);
        }
      popMatrix();
      
      try { hunter.dibujar(); } catch ( Throwable e ){};
    }
}
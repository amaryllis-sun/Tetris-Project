class TetrisBlock{
int x;
int y;
color c;
int h = 25; 
   public TetrisBlock(int x, int y, color c){
     this.x = x;
     this.y = y;
     this.c = c; 
   }
   
   void draw(){
     fill(c);
     stroke(225);
     strokeWeight(1);
     square(x,y,h);
   }
   
   int getX(){
     return x;
   }
      
   int getY(){
     return y;
   }
   void setX(int x){
     this.x = x;
   }
   void setY(int y){
     this.y = y;
   }
   color getColor(){
     return c; 
   }
   // for checking work
   void printXY(){
     System.out.println(x+","+y);
   }
   void setColor(color c){
     this.c=c;
   }
   void removeBlock(){
     this.c=color(0);
   }

}

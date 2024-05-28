class Block{
int x;
int y;
color c;
int h; 
   public Block(int x, int y, color c, int h){
     this.x = x;
     this.y =y;
     this.c = c;
     this.h = h;    
   }
   
   void draw(){
     fill(c);
     stroke(225);
     strokeWeight(1);
     square(x,y,h);
   }
}



public class Rotation extends TurtleAction {
  
   private float angle;
   private String direction;
 
   public Rotation(float angle, String direction) {
      super();
      this.angle = angle;
      this.direction = direction;
   }
 
   public String turtleCode() {
       if (!direction.equals("") )
           return turtleName + "." + direction + "(" + int(angle) + ");";
       else
           return "ERROR";
   }
 
   public void doTurtleAction() {
     if (direction.equals("right"))  /* TURTLE TURN! */
         t.right(angle);
     if (direction.equals("left"))
         t.left(angle);
   }
   
}
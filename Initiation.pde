
public class Initiation extends TurtleAction {
 
 public Initiation(Turtle turt, String tn) {
   super();
   turtleName = tn;
   t = turt;
 }
 
 public String turtleCode() {
   return "Turtle " + turtleName + " = new Turtle(this);";
 }
 
 void doTurtleAction() {
   //t = new Turtle(env); /* TURTLE CONSTRUCT! */
 }
 
}
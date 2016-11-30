public class Line extends TurtleAction {
  
 private PVector start, end;
 private float distance;
 
 public Line(PVector start, PVector end) {
   super();
   this.start = start;
   this.end = end;
   this.distance = PApplet.dist(start.x, start.y, end.x, end.y);
 }
 
 public String turtleCode() {
     return turtleName + ".forward(" + int(this.distance) + ");";
 }
 
 void doTurtleAction() {
     t.forward(this.distance); /* TURTLE MOVE! */
 }
 
 public Rotation getRotation(Line nextLine) {
   
   PVector prevDiff = new PVector(this.end.x-this.start.x, this.end.y - this.start.y);
   PVector curDiff = new PVector(nextLine.end.x-nextLine.start.x, nextLine.end.y-nextLine.start.y);
   
   float prevHeading = (degrees(prevDiff.heading()) + 360) % 360;
   float curHeading = (degrees(curDiff.heading()) + 360) % 360;
   
   float angle = PApplet.degrees(PVector.angleBetween(prevDiff, curDiff));
   
   println(this.end.x + " " + this.end.y + " " + prevHeading);
   println(nextLine.end.x + " " + nextLine.end.y + " " + curHeading);
   println(prevHeading + " " + curHeading + " " + angle);
   
   String direction = "";
   // There must be an easier way to do the left vs right turn. I don't know how though.
   if (curHeading > prevHeading && curHeading - prevHeading < 180 || 
       prevHeading > curHeading && prevHeading - curHeading > 180) {
         direction = "right";
   } else if (curHeading < prevHeading && prevHeading - curHeading < 180 || 
       prevHeading < curHeading && curHeading - prevHeading > 180) {
         direction = "left";
   }
   
   return new Rotation(angle, direction);
 }
}
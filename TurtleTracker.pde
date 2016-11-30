import Turtle.*;

public class TurtleTracker {
  
  private PApplet env;
  private String turtleName;
  private ArrayList<TurtleAction> turtleActions;
  private Turtle t;
  
  /* Construct a TurtleTracker for a given environment and TurtleName */
  public TurtleTracker(PApplet env, String turtleName) {
    this.env = env;
    this.turtleName = turtleName;
    this.turtleActions = new ArrayList<TurtleAction>();
    t = new Turtle(this.env);
    this.add(new Initiation(this.t, this.turtleName));
  }
  
  /* Add a new TurtleAction */
  public void add(TurtleAction nextAction) {
    this.turtleActions.add(nextAction); 
  }
  
  /* Get the Turtle code as a String */
  public String getCode() {
    String result = "";
    for (TurtleAction ta : turtleActions) {
      if (!ta.turtleCode().equals("")) {
        result = result +  "\n" + ta.turtleCode();
      }
    }
    return result;
  }
  
  /* Draw the Turtle code */
  public void drawTurtleSketch() {
    env.stroke(128, 0, 128);
    for (TurtleAction ta : turtleActions) {
      t.drawTurtle();  
      ta.doTurtleAction();
    }
  }
   
  /* Get rid of the Turtle drawing */
  public void clear() {
    t.clearTurtleHistory(); /* TURTLE DELETE! */
    //this.env.redraw();
    t = new Turtle(this.env);
  }
  
}
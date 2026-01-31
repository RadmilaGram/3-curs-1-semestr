package fourth;

import first.Task;
import second.Stack;
import third.Strategy;

public class RedoBackTaskRunner extends AbstractTaskRunner {
    private final Stack redoStack = new Stack();

    public RedoBackTaskRunner(Strategy strategy) {
        super(strategy);
    }

    @Override
    protected void afterExecution(Task task) {
        redoStack.push(task);
    }

    public void redo() {
        while (!redoStack.isEmpty()) {
            Task task = redoStack.pop();
            if (task != null) {
                task.execute();
            }
        }
    }
}
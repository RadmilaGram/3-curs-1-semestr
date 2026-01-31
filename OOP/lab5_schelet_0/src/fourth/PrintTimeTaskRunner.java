package fourth;

import first.Task;
import second.Container;
import third.ContainerFactory;
import third.Strategy;
import java.util.Calendar;

// PrintTimeTaskRunner.java
public class PrintTimeTaskRunner extends AbstractTaskRunner {
    public PrintTimeTaskRunner(Strategy strategy) {
        super(strategy);
    }

    @Override
    protected void afterExecution(Task task) {
        System.out.println("Task executed at: " + Calendar.getInstance().getTime());
    }
}
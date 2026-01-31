package fourth;

import first.Task;
import third.Strategy;

public class CounterTaskRunner extends AbstractTaskRunner {
    private int counter = 0;

    public CounterTaskRunner(Strategy strategy) {
        super(strategy);
    }

    @Override
    protected void afterExecution(Task task) {
        counter++;
    }

    public int getCounter() {
        return counter;
    }
}

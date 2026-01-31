package second;

import first.Task;
import java.util.ArrayList;

public class Stack extends AbstractContainer {
    @Override
    public Task pop() {
        if (tasks.isEmpty()) {
            return null;
        }
        return tasks.remove(tasks.size() - 1);
    }
}
package second;

import first.Task;
import java.util.ArrayList;


public class Queue extends AbstractContainer {
    @Override
    public Task pop() {
        if (tasks.isEmpty()) {
            return null;
        }
        return tasks.remove(0);
    }
}
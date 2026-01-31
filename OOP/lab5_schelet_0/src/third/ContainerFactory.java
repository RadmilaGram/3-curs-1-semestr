package third;

import second.Container;
import second.Stack;
import second.Queue;

public class ContainerFactory implements IFactory {
    public static final ContainerFactory INSTANCE = new ContainerFactory();

    private ContainerFactory() {}

    @Override
    public Container createContainer(Strategy strategy) {
        switch (strategy) {
            case LIFO:
                return new Stack();
            case FIFO:
                return new Queue();
            default:
                throw new IllegalArgumentException("Unknown strategy: " + strategy);
        }
    }
}
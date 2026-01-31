package first;

import java.util.Random;

public class RandomOutTask implements Task {
    private final int number;

    public RandomOutTask() {
        Random random = new Random();
        this.number = random.nextInt();
    }

    @Override
    public void execute() {
        System.out.println("Generated number: " + number);
    }
}
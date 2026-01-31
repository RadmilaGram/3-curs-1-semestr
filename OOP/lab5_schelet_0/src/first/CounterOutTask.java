package first;

public class CounterOutTask implements Task {
    private static int counter = 0;
//подразумевает увеличение счетчика при создании новых задач (объектов)
    /*public CounterOutTask() {
        counter++;
    }*/
//подразумевает увеличение счетчика при каждом выполнении задачи (каждом вызове execute())
    @Override
    public void execute() {
        counter++;
        System.out.println("Counter value: " + counter);
    }
}
package task2;

public class Main {
    public static void main(String[] args) {
        Student student1 = new Student(42, "Decebal", "Popescu");

        //исправление ошибки: создаем копию объекта, так как до этого была прямая передача ссылки
        //Student student2 = student1;
        Student student2 = new Student(student1);

        // изменяем копию
        student2.setName("Cezar");
        student2.setSurname("Ghiu");

        student1.show(); // Выводит оригинальные данные
        student2.show(); // Выводит измененные данные
    }
}

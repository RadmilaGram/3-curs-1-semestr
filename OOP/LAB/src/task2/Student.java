package task2;

import java.util.Objects;

public class Student {
    private String name;
    private int year;

    public void setName(String name) {
        //сохранить переданное имя в поле name
        this.name = name;
    }

    public void setYear(int year) {
        this.year = year;
    }

    public String getName() {
        return name;
    }

    public int getYear() {
        return year;
    }
    //аннотация переопределяет
    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        Student student = (Student) o;//приводим объект о к типу Student чтобы могли рбаотать с ним как с объектом Student
        //Objects.equals — Это метод из библиотеки java.util.Objects, который помогает безопасно сравнивать два объекта
        return year == student.year && Objects.equals(name, student.name);
    }

    @Override
    public String toString() {
        return "Student{name='" + name + "', year=" + year + '}';
    }
}

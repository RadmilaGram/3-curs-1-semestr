package task2;

import java.util.Scanner;

public class Test {
    public static void main(String[] args) {

        System.out.println("Provide a year");
        Scanner sc = new Scanner(System.in);
        int year = sc.nextInt(); // считываем год из ввода пользователя
        Course course = getCourse();
        System.out.println(course);
        //вызывакм филтрацию студентов по году
        task2(course, year);
        //тестирование работы
        task3();

        course.printStudents2024();
    }

    private static Course getCourse() {
        Student student1 = new Student();
        student1.setName("Adriana");
        student1.setYear(2022);

        Student student2 = new Student();
        student2.setName("Iulian");
        student2.setYear(2023);

        Student student3 = new Student();
        student3.setName("Pasha");
        student3.setYear(2024);

        Student student4 = new Student();
        student4.setName("Stef");
        student4.setYear(2024);

        Student[] students = {student1, student2, student3, student4};

        Course course = new Course();
        course.setTitle("oop study");
        course.setDescription("Object Oriented Programming");
        course.setStudents(students);

        return course;
    }

    private static void task2(Course curs, int year) {
        System.out.println("Task 2");
        System.out.println(curs.filterStudentByYear(year));
    }

    private static void task3() {
        System.out.println("Task 3 test");

        Student student1 = new Student();
        student1.setName("Stef");
        student1.setYear(2024);

        Student student2 = new Student();
        student2.setName("Stef");
        student2.setYear(2024);

        System.out.println(student1.equals(student2)); // должно вывести false, так как имена разные
    }
}

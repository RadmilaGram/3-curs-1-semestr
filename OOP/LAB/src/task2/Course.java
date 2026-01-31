package task2;

import java.util.ArrayList; //для динамических списков
import java.util.Arrays; //для массивов
import java.util.Objects;//для проверки объектов на равенство

public class Course {
    private String title;
    private String description;
    private Student[] students;

    public void setTitle(String title) {
        this.title = title;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public void setStudents(Student[] students) {
        this.students = students;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        //если o прошло проверку на соответствие типу Course, можем преобразовать его к типу Course, чтобы получить доступ к его полям
        Course course = (Course) o;
        return Objects.equals(title, course.title);
    }

    public ArrayList<Student> filterStudentByYear(int year) {
        ArrayList<Student> filteredStudents = new ArrayList<>();
//на каждой иттерации из объекта класса выбираем одного студента из масссива и называем его tudent
        for (Student student : students) {
            //равен ли год обучения студента году который передан в метод year
            if (student.getYear() == year) {
                filteredStudents.add(student);
            }
        }
        return filteredStudents;
    }

    @Override
    public String toString() {
        return "Course{" +
                "title:'" + title.toUpperCase() + '\'' +
                ", description:'" + description + '\'' +
                ", students:" + Arrays.toString(students) +
                '}';
    }

    public void printStudents2024() {
        ArrayList<Student> students2024 = filterStudentByYear(2024);
        System.out.println("Number of students in 2024: " + students2024.size());
        for (Student student : students2024) {
            System.out.println(student);
        }
    }
}

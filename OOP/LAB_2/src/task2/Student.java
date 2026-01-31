package task2;

class Student {
    private int id;
    private String name, surname;

    public Student(int id, String name, String surname) {
        this.id = id;
        this.name = name;
        //surname = surname
        this.surname = surname;
    }

    // Конструктор копирования
    public Student(Student st) {
        this.id = st.id;
        this.name = st.name;
        //исправление ошибки
        //this.surname = surname;
        this.surname = st.surname;
    }

    public int getId() {
        return id;
    }

    public String getName() {
        return name;
    }

    public String getSurname() {
        return surname;
    }

    public void setId(int id) {
        this.id = id;
    }

    public void setSurname(String surname) {
        this.surname = surname;
    }

    public void setName(String name) {
        this.name = name;
    }

    public void show() {
        System.out.println(String.format("Name: %s\nSurname: %s\nStudent ID: %d\n", name, surname, id));
    }
}

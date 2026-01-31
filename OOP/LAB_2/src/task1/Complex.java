package task1;

public class Complex {
    private int real;
    private int imaginary;

    //1 конструктор с двумя параметрами для комплексного числа
    public Complex(int real, int imaginary) {
        this.real = real;
        this.imaginary = imaginary;
    }
    //2 конструктор без параметров
    public Complex() {
        this(0, 0);//передает значение первому констр
    }

    //3 конструктор копирования
    public Complex(Complex other) {
        this.real = other.real;
        this.imaginary = other.imaginary;
    }

    // геттеры и сеттеры
    public int getReal() {
        return real;
    }

    public void setReal(int real) {
        this.real = real;
    }

    public int getImaginary() {
        return imaginary;
    }

    public void setImaginary(int imaginary) {
        this.imaginary = imaginary;
    }

    // метод типа void для сложения с другим комплексным числом
    public void addWithComplex(Complex other) {
        this.real += other.real;
        this.imaginary += other.imaginary;
    }

    // метод отображения числа
    public void showNumber() {
        System.out.println(this.real + " + " + this.imaginary + "i");
    }
}

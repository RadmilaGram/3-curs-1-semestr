package task1;

public class VeterinaryTest {
    //точку входа в программу, static (можно вызвать без создания объекта)
    public static void main(String[] args) {
        VeterinaryReport vr = new VeterinaryReport();
//полю cats объекта vr присваивается значение 99
        vr.cats = 99;
        vr.dogs = 199;

        vr.displayStatistics();
        System.out.println("The class method says there are " + vr.getAnimalsCount() + " animals");
    }
}


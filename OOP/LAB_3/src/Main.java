import task2.Baravelli;
import task2.ChocAmor;
import task2.Lindt;
import task4.CandyBag;

import task6.Area;

public class Main {
    public static void main(String[] args) {
        CandyBag bag = new CandyBag();

        Lindt lindt = new Lindt("Milk Chocolate", "Switzerland", 10, 5, 2);
        Baravelli baravelli = new Baravelli("Dark Chocolate", "Italy", 3, 7);
        ChocAmor chocAmor = new ChocAmor("White Chocolate", "France", 4);

        bag.addCandy(lindt);
        bag.addCandy(baravelli);
        bag.addCandy(chocAmor);

        Area area = new Area(bag, 25, "Main Street");
        area.getBirthdayCard();

        System.out.println("Equality check: " + lindt.equals(new Lindt("Milk Chocolate", "Switzerland", 10, 5, 2)));
    }
}

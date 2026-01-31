package task6;


import task1.CandyBox;
import task2.Baravelli;
import task2.ChocAmor;
import task2.Lindt;
import task4.CandyBag;

public class Area {
    private CandyBag candyBag;
    private int number;
    private String street;

    public Area() {
        this.candyBag = new CandyBag();
        this.number = 0;
        this.street = "";
    }

    public Area(CandyBag candyBag, int number, String street) {
        this.candyBag = candyBag;
        this.number = number;
        this.street = street;
    }

    public void getBirthdayCard() {
        System.out.println("Address: " + street + " " + number);
        System.out.println("Happy Birthday! Here are your candies:");
        for (CandyBox candy : candyBag.getCandies()) {
            System.out.println(candy);
        }
        for (CandyBox candy : candyBag.getCandies()) {
            if (candy instanceof Lindt) {
                ((Lindt) candy).printLindtDim();
            } else if (candy instanceof Baravelli) {
                ((Baravelli) candy).printBaravelliDim();
            } else if (candy instanceof ChocAmor) {
                ((ChocAmor) candy).printChocAmorDim();
            }
        }
    }
}

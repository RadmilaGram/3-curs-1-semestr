package task4;

import task1.CandyBox;

import java.util.ArrayList;

public class CandyBag {
    private ArrayList<CandyBox> candies;

    public CandyBag() {
        candies = new ArrayList<>();
    }

    public void addCandy(CandyBox candy) {
        candies.add(candy);
    }

    public ArrayList<CandyBox> getCandies() {
        return candies;
    }
}


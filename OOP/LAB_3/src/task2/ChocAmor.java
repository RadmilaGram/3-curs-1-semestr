package task2;

import task1.CandyBox;

public class ChocAmor extends CandyBox {
    private float length;

    public ChocAmor() {
        super();
        this.length = 0;
    }

    public ChocAmor(String flavor, String origin, float length) {
        super(flavor, origin);
        this.length = length;
    }

    @Override
    public float getVolume() {
        return length * length * length;
    }

    @Override
    public String toString() {
        return super.toString() + " has volume: " + getVolume();
    }

    public void printChocAmorDim() {
        System.out.println("ChocAmor dimensions - Length: " + length);
    }
}

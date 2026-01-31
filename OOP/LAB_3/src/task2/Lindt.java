package task2;

import task1.CandyBox;

public class Lindt extends CandyBox {
    private float length, width, height;

    public Lindt() {
        super();
        this.length = 0;
        this.width = 0;
        this.height = 0;
    }

    public Lindt(String flavor, String origin, float length, float width, float height) {
        super(flavor, origin);
        this.length = length;
        this.width = width;
        this.height = height;
    }

    @Override
    public float getVolume() {
        return length * width * height;
    }

    @Override
    public String toString() {
        return super.toString() + " has volume: " + getVolume();
    }

    public void printLindtDim() {
        System.out.println("Lindt dimensions - Length: " + length + ", Width: " + width + ", Height: " + height);
    }
}


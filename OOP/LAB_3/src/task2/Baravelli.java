package task2;

import task1.CandyBox;

public class Baravelli extends CandyBox {
    private float radius, height;

    public Baravelli() {
        super();
        this.radius = 0;
        this.height = 0;
    }

    public Baravelli(String flavor, String origin, float radius, float height) {
        super(flavor, origin);
        this.radius = radius;
        this.height = height;
    }

    @Override
    public float getVolume() {
        return (float) (Math.PI * radius * radius * height);
    }

    @Override
    public String toString() {
        return super.toString() + " has volume: " + getVolume();
    }

    public void printBaravelliDim() {
        System.out.println("Baravelli dimensions - Radius: " + radius + ", Height: " + height);
    }
}

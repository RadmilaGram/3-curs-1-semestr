package task1;

public class CandyBox {
    private String flavor;
    private String origin;

    // конструктор без параметров с полями
    public CandyBox() {
        this.flavor = "";
        this.origin = "";
    }

    // конструктор с параметрами со всеми полями
    public CandyBox(String flavor, String origin) {
        this.flavor = flavor;
        this.origin = origin;
    }

    // Метод getVolume()
    public float getVolume() {
        return 0;
    }

    // Метод toString()
    @Override
    public String toString() {
        return "CandyBox with flavor: " + flavor + " from origin: " + origin;
    }

    // Метод equals()
    @Override
    public boolean equals(Object obj) {
        if (this == obj) return true;
        if (obj == null || getClass() != obj.getClass()) return false;
        CandyBox candyBox = (CandyBox) obj;
        return flavor.equals(candyBox.flavor) && origin.equals(candyBox.origin);
    }
}

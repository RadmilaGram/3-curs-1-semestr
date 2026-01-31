package task3;

import java.util.ArrayList;

class Point {
    private float x; //горизонтальная
    private float y; //вертикальная
//создаем точку с заданными
    public Point(float x, float y) {
        this.x = x;
        this.y = y;
    }

    public void changeCoords(float x, float y) {
        this.x = x;
        this.y = y;
    }

    public void display() {
        System.out.println("(" + x + ", " + y + ")");
    }
}

class  Polygon {
    private ArrayList<Point> points;

    // конструктор с числом вершин
    public Polygon(int n) {
        //cоздаём список, который может хранить n точек
        points = new ArrayList<>(n);
        for (int i = 0; i < n; i++) {
            points.add(new Point(0, 0));
        }
    }

    // конструктор с координатами
    //coordinates ссылается на список
    public Polygon(ArrayList<Float> coordinates) {
        //считаем, сколько точек получится из списка координат
        int n = coordinates.size() / 2;
        points = new ArrayList<>(n);
        for (int i = 0; i < n; i++) {
            //берем координату x и координату y и создаем точку добавляя в список
            points.add(new Point(coordinates.get(2 * i), coordinates.get(2 * i + 1)));
        }
    }

    public void displayPolygon() {
        //проходим по всем точкам в списке
        for (Point p : points) {
            p.display();
        }
    }
}



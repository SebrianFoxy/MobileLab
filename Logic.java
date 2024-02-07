package app;

public class Logic {
    public static double rectangleArea (double lenght, double width) {
        return lenght * width;
    }

    public static double rectanglePerimeter (double lenght, double width) {
        return 2 * (lenght + width);
    }

    public static double circleArea (double radius) {
        return 3.14 * (radius * radius);
    }

    public static double circleCircumference (double radius) {
        return 2 * 3.14 * radius;
    }
    
}


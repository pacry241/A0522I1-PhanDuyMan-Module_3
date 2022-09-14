package model;

public class Student {
    private int id;
    private String name;
    private boolean gender;
    private float point;

    public Student() {
    }

    public Student(int id, String name, boolean gender, float point) {
        this.id = id;
        this.name = name;
        this.gender = gender;
        this.point = point;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public boolean isGender() {
        return gender;
    }

    public void setGender(boolean gender) {
        this.gender = gender;
    }

    public float getPoint() {
        return point;
    }

    public void setPoint(float point) {
        this.point = point;
    }
}

package com.itheima.po;

public class Grades {
    private int grade;
    private String name;

    public int getGrade() {
        return grade;
    }

    public void setGrade(int grade) {
        this.grade = grade;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Grades() {
    }

    public Grades(int grade, String name) {
        this.grade = grade;
        this.name = name;
    }

    @Override
    public String toString() {
        return "{" +
                "grade=" + grade +
                ", name='" + name + '\'' +
                '}';
    }
}

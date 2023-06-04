package service;

import entity.Student;

import java.util.ArrayList;
import java.util.List;

public class StudentService {
    public static List<Student> studentList;
    static {
        studentList = new ArrayList<>();
        studentList.add(new Student("SV001", "Khánh", "<b>A0522I1</b>", "<b>Đà Nẵng</b>"));
        studentList.add(new Student("SV002", "Thành", "A0522I1", "Quảng Nam"));
        studentList.add(new Student("SV003", "Mẫn", "A0522I1", "Đà Nẵng"));
        studentList.add(new Student("SV004", "Bảo", "A0522I1", "Sài Gòn"));
        studentList.add(new Student("SV005", "Nhận", "A0522I1", "Quảng Bình"));
    }
}

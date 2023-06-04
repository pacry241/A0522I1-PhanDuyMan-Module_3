package repository.impl;

import model.Student;
import repository.IStudentRepository;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class StudentRepository implements IStudentRepository {
    private static final String SELECT_FROM_STUDENT = "select * from student";
    private static final String SELECT_FROM_STUDENT_WHERE_NAME = "select * from student where name_student like ?";
    private static final String INSERT_STUDENT = "insert into student(code_student, name_student, gender, point) value (?,?,?,?) ";
    static List<Student> students = new ArrayList<>();
    private BaseRepository baseRepository = new BaseRepository();

    static {
        students.add(new Student(1, "haiTT", 9, 1));
        students.add(new Student(2, "haiTT2", 3, 0));
        students.add(new Student(3, "haiTT3", 6, 1));
        students.add(new Student(4, "haiTT4", 8, null));
        students.add(new Student(5, "haiTT5", 5, 1));
    }

    @Override
    public List<Student> getAll() {
        List<Student> studentList = new ArrayList<>();
        try {
//            Statement statement = this.baseRepository.getConnectionJavaToDB().createStatement();
//            statement.executeQuery("select * from student");
            Connection connection = this.baseRepository.getConnectionJavaToDB();
            PreparedStatement preparedStatement = connection
                    .prepareStatement(SELECT_FROM_STUDENT);
            ResultSet resultSet = preparedStatement.executeQuery();
            Student student;
            while (resultSet.next()) {
                student = new Student();
                student.setCodeStudent(resultSet.getInt("code_student"));
                student.setNameStudent(resultSet.getString("name_student"));
                student.setGender(resultSet.getInt("gender"));
                student.setPoint(resultSet.getDouble("point"));
                studentList.add(student);
            }
            connection.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return studentList;
    }

    @Override
    public void save(Student student) {
       try {
           Connection connection = this.baseRepository.getConnectionJavaToDB();
//           Statement statement = connection.createStatement();
//           statement.executeUpdate("insert into student(code_student, name_student, gender, point) value ("+student.getCodeStudent()+","+student.getNameStudent()+")")
         PreparedStatement preparedStatement = connection.prepareStatement(INSERT_STUDENT);
        preparedStatement.setInt(1, student.getCodeStudent());
        preparedStatement.setString(2, student.getNameStudent());
        preparedStatement.setInt(3, student.getGender());
        preparedStatement.setDouble(4, student.getPoint());
        preparedStatement.executeUpdate();
        connection.close();
       } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}

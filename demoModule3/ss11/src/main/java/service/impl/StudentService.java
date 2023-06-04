package service.impl;

import model.Student;
import repository.IStudentRepository;
import repository.impl.StudentRepository;
import service.IStudentService;

import java.util.List;

public class StudentService implements IStudentService {
    private IStudentRepository iStudentRepository = new StudentRepository();
    @Override
    public List<Student> getAll() {
        return iStudentRepository.getAll();
    }

    @Override
    public void save(Student student) {
        if(student.getPoint()>0 && student.getPoint()<10) {

        }
        this.iStudentRepository.save(student);
    }
}

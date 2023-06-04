package servlet;

import entity.Student;
import service.StudentService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "CreateStudentServlet", urlPatterns = "/student/create")
public class CreateStudentServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        String id = request.getParameter("id");
        String name = request.getParameter("name");
        String className = request.getParameter("className");
        String address = request.getParameter("address");
        Student student = new Student(id, name, className, address);
        StudentService.studentList.add(student);
        request.setAttribute("student", student);

        request.getRequestDispatcher("/student/create.jsp").forward(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setAttribute("student", new Student());
        request.getRequestDispatcher("/student/create.jsp").forward(request, response);
    }
}

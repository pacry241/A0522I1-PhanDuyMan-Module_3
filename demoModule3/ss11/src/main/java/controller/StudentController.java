package controller;

import model.Student;
import service.IStudentService;
import service.impl.StudentService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "StudentController", urlPatterns = "/student")
public class StudentController extends HttpServlet {
    private IStudentService iStudentService = new StudentService();

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "create":
                Integer codeStudent = Integer.valueOf(request.getParameter("codeStudent"));
                String nameStudent = request.getParameter("nameStudent");
                Double point = Double.valueOf(request.getParameter("point"));
                Integer gender = Integer.valueOf(request.getParameter("gender"));
                Student student = new Student(codeStudent,nameStudent,point,gender);
                this.iStudentService.save(student);
//                request.getRequestDispatcher("/list.jsp").forward(request,response);
                response.sendRedirect("/student");
                break;
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "create":
                request.getRequestDispatcher("create.jsp").forward(request, response);
                break;
            default:
                List<Student> students = this.iStudentService.getAll();
//       Gửi dữ liệu về JSP theo dạng key - value
                request.setAttribute("listStudent", students);
//        Chuyển trang sử dụng forward.
                request.getRequestDispatcher("list.jsp").forward(request, response);

        }
    }
}

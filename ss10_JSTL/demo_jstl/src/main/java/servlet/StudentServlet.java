package servlet;

import model.Student;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "StudentServlet",urlPatterns = {"/student","/sinh-vien"})
public class StudentServlet extends HttpServlet {

    public static List<Student> studentList = new ArrayList<>();
     static {
         studentList.add(new Student(1,"chánh",true,5));
         studentList.add(new Student(2,"chánh2",false,9));
         studentList.add(new Student(3,"chánh3",true,7));
         studentList.add(new Student(4,"chánh4",false,6));
         studentList.add(new Student(5,"chánh5",true,3));
     }
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // chuyển dữ liệu
        request.setAttribute("studentList",studentList);
        request.getRequestDispatcher("/view/student/list.jsp").forward(request,response);
    }
}

package servlet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(name = "SumServlet2", urlPatterns = "/sum2")
public class SumServlet2 extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int number1 = Integer.parseInt(request.getParameter("number1"));
        int number2 = Integer.parseInt(request.getParameter("number2"));
        int sum = number1 + number2;
        request.setAttribute("sum", sum);
        request.setAttribute("number1", number1);
        request.setAttribute("number2", number2);
        request.getRequestDispatcher("result2.jsp").forward(request, response);
    }
}

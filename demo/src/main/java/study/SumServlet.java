package study;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(urlPatterns = "/SumServlet")
public class SumServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int a = Integer.parseInt(request.getParameter("number1"));
        int b = Integer.parseInt(request.getParameter("number2"));
//        PrintWriter writer = response.getWriter();
//        writer.println("<b>Tong cua 2 so la: " + (a + b) + "<b>");
        request.setAttribute("result", a + b);
        request.getRequestDispatcher("result.jsp").forward(request, response);
    }
}

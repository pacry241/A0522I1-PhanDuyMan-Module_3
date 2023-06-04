package controller;

import bean.Customer;
import service.CustomerService;
import service.Impl.CRUDServiceImpl;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

@WebServlet(name = "ServletCustomer", value = "/customer")
public class ServletCustomer extends HttpServlet {
    CustomerService service = new CRUDServiceImpl();
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null || action.trim().equals("")) {
            action="list";
        }
        try {
            switch (action) {
                case "create":
//                    showNewForm(request, response);
                    break;
                case "delete":
                    deleteCustomer(request, response);
                    break;
                case "list":
                    showList(request, response);
                    break;
            }
        } catch (SQLException ex) {
            throw new ServletException(ex);
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null || action.trim().equals("")) {
            doGet(request, response);
            return;
        }
    }

    private void showList(HttpServletRequest request, HttpServletResponse response) throws SQLException,ClassNotFoundException,ServletException, IOException{
        List<Customer> customerList = null;
        customerList = service.findAll();
        request.setAttribute("List",customerList);
        request.getRequestDispatcher("WEB-INF/views/customer/list.jsp").forward(request,response);
    }

    private void deleteCustomer(HttpServletRequest request, HttpServletResponse response) throws SQLException, IOException, ServletException, ClassNotFoundException {
        int id = Integer.parseInt(request.getParameter("idDelete"));
        try {
            service.deleteById(id);
        } catch (Exception e) {
            e.printStackTrace();
        }

        response.sendRedirect("/customer");
    }
}

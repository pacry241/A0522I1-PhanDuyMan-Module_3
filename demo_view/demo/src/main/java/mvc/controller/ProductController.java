package mvc.controller;

import mvc.bean.Product;
import mvc.service.ProductService;
import mvc.service.impl.ProductServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

@WebServlet(name = "ProductController", urlPatterns = "/product")
public class ProductController extends HttpServlet {
    private ProductService service = new ProductServiceImpl();

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null || action.trim().equals("")) {
            doGet(request, response);
            return;
        }
        switch (action) {
            case "create":
                createNewProduct(request, response);
                break;
            case "update":
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null || action.trim().equals("")) {
            action = "list";
        }
        switch (action) {
            case "create":
                request.getRequestDispatcher("/WEB-INF/views/product/create.jsp").forward(request, response);
                break;
            case "update":
            case "delete":
            case "detail":
            case "list":
            default:
                showList(request, response);
        }
    }

    private void showList(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Product> products = null;
        try {
            products = service.findAll();
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
        request.setAttribute("products", products);
        request.getRequestDispatcher("/WEB-INF/views/product/list.jsp").forward(request, response);
    }

    private void createNewProduct(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String id = request.getParameter("id");
        String name = request.getParameter("name");
        double price = Double.parseDouble(request.getParameter("price"));
        int quantity = Integer.parseInt(request.getParameter("quantity"));
        String color = request.getParameter("color");
        String description = request.getParameter("description");
        String category = request.getParameter("category");
        String error = null;
        if (error == null) {
            try {
                service.create(new Product(id, name, price, quantity, color,description));
            } catch (Exception e) {
                error = e.getMessage();
            }
        }

        if (error == null) {
            response.sendRedirect("/product");
        } else {
            request.setAttribute("error", error);
            request.getRequestDispatcher("/WEB-INF/views/product/create.jsp").forward(request, response);
        }

    }
}

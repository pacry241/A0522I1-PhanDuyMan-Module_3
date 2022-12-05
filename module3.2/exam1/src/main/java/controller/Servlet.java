package controller;

import models.Category;
import models.Product;
import service.CategoryService;
import service.ProductService;
import service.impl.ProductServiceImpl;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

@WebServlet(name = "Servlet", urlPatterns = "/product")
public class Servlet extends HttpServlet {
    private ProductService service = new ProductServiceImpl();
    private CategoryService categoryService = new ProductServiceImpl();
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null || action.trim().equals("")) {
            doGet(request, response);
            return;
        }
        try{
        switch (action) {
            case "create":
                createNewProduct(request, response);
                break;
            case "edit":
                try {
                    updateProduct(request,response);
                } catch (Exception e) {
                    e.printStackTrace();
                }
                break;
            case "search":
                searchId(request,response);
                break;
            default:
        }
        }catch (SQLException ex) {
            throw new ServletException(ex);
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
    }




    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null || action.trim().equals("")) {
            action = "list";
        }
        try {
            switch (action) {
                case "create":
                    showNewForm(request, response);
                    break;
                case "edit":
                    showFormEdit(request, response);
                    break;
                case "delete":
                    deleteProduct(request, response);
                    break;
                case "search":
                    showFormSearch(request, response);
                    break;
                case "detail":
                case "list":
                default:
                    showList(request, response);
            }
        } catch (SQLException ex) {
            throw new ServletException(ex);
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
    }

    private void createNewProduct(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        String name = request.getParameter("name");
        double price = Double.parseDouble(request.getParameter("price"));
        int quantity = Integer.parseInt(request.getParameter("quantity"));
        String color = request.getParameter("color");
        String description = request.getParameter("description");
        int categoryId = Integer.parseInt(request.getParameter("category"));
        String error = null;
        if (error == null) {
            try {
                service.create(new Product(id, name, price, quantity, color,description,categoryId));
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

    private void showNewForm(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        showCategory(request,response);
        RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/views/product/create.jsp");
        dispatcher.forward(request, response);
    }

    private void showList(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
        List<Product> productList = null;
        try {
            productList = service.findAll();
        } catch (SQLException e) {
            e.printStackTrace();
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
        showCategory(request,response);
        request.setAttribute("List",productList);
        request.getRequestDispatcher("WEB-INF/views/product/list.jsp").forward(request,response);
    }
    private void showCategory(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
        List<Category> categoryList = null;
        try {
            categoryList = categoryService.findAllCategoryService();
        } catch (SQLException e) {
            e.printStackTrace();
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
        request.setAttribute("categoryList",categoryList);
    }
    private void deleteProduct(HttpServletRequest request, HttpServletResponse response) throws SQLException, IOException, ServletException, ClassNotFoundException {
        int id = Integer.parseInt(request.getParameter("idDelete"));
        try {
            service.deleteById(id);
        } catch (Exception e) {
            e.printStackTrace();
        }

        response.sendRedirect("/product");
//        List<Product> productList = service.findAll();
//        request.setAttribute("List",productList);
//        request.getRequestDispatcher("WEB-INF/views/product/list.jsp").forward(request,response);
    }

    private void showFormSearch(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        RequestDispatcher dispatcher = request.getRequestDispatcher("WEB-INF/views/product/search.jsp");
        dispatcher.forward(request, response);
    }

    private void searchId(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, SQLException, ClassNotFoundException {
        int id  = Integer.parseInt(request.getParameter("idProduct"));
        System.out.println(id);

        Product product = service.findById(id);
        request.setAttribute("product", product);
        RequestDispatcher dispatcher = request.getRequestDispatcher("WEB-INF/views/product/list_search.jsp");
        dispatcher.forward(request, response);
    }
    private void showFormEdit(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, ClassNotFoundException, SQLException {
        int id = Integer.parseInt(request.getParameter("id"));

        Product product = service.findById(id);
        showCategory(request,response);
        request.setAttribute("product", product);
        RequestDispatcher dispatcher = request.getRequestDispatcher("WEB-INF/views/product/edit.jsp");
        dispatcher.forward(request, response);
    }

    private void updateProduct(HttpServletRequest request, HttpServletResponse response) throws Exception {
        int id = Integer.parseInt(request.getParameter("id"));
        String name = request.getParameter("name");
        double price = Double.parseDouble(request.getParameter("price"));
        int quantity = Integer.parseInt(request.getParameter("quantity"));
        String color = request.getParameter("color");
        String description = request.getParameter("description");
        int categoryId = Integer.parseInt(request.getParameter("category"));

        Product product = new Product(id,name,price,quantity,color,description,categoryId);
        service.update(product);
        response.sendRedirect("/product?action=list");
//        RequestDispatcher dispatcher = request.getRequestDispatcher("WEB-INF/views/product/list.jsp");
//        dispatcher.forward(request, response);
    }
}


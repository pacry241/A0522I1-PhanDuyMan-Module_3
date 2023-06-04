package controller;

import bean.Book;
import bean.Category;
import service.BookService;
import service.CategoryService;
import service.impl.BookServiceImpl;
import service.impl.CategoryServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "BookController", urlPatterns = "/book")
public class BookController extends HttpServlet {
    private BookService bookService = new BookServiceImpl();
    private CategoryService categoryService = new CategoryServiceImpl();

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        String action = request.getParameter("action");
        if (action == null) {
            response.sendRedirect("/book?action=list");
            return;
        }

        switch (action) {
            case "create":
                doCreate(request, response);
                break;
            case "update":
                break;
            case "delete":
                break;
            default:
                response.sendRedirect("/book?action=list");
        }
    }

    private void doCreate(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String id = request.getParameter("id");
        String name = request.getParameter("name");
        String author = request.getParameter("author");
        String categoryId = request.getParameter("categoryId");
        Category category = categoryService.findById(categoryId);
        Book book = new Book(id, name, author, category);
        bookService.saveOrUpdate(book);
        response.sendRedirect("book?action=list");
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        String action = request.getParameter("action");
        if (action == null) {
            action = "list";
        }

        switch (action) {
            case "create":
                showCreate(request, response);
                break;
            case "update":
                break;
            case "list":
                showList(request, response);
                break;
            case "delete":
                break;
            default:
                showList(request, response);
        }
    }

    private void showCreate(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setAttribute("categories", categoryService.findAll());
        request.getRequestDispatcher("book/create.jsp").forward(request, response);
    }

    private void showList(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setAttribute("books", bookService.findAll());
        request.getRequestDispatcher("book/list.jsp").forward(request, response);
    }
}

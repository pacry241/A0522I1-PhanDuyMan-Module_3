import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.LinkedList;
import java.util.List;

@WebServlet(name = "Customer_Servlet", urlPatterns = "/customer")
public class Customer_Servlet extends HttpServlet {
    public static List<customer> list = new LinkedList<>();
    static {
        list.add(new customer("Mai Văn Hoa","1983-08-20","Hà Nội","https://khoinguonsangtao.vn/wp-content/uploads/2022/05/avatar-dep-chat-nu.jpg"));
        list.add(new customer("Nguyễn Văn Nam","1983-08-21","Bắc Giang","https://imgt.taimienphi.vn/cf/Images/huy/2020/3/19/anh-dai-dien-dep-cho-nam-2.jpg"));
        list.add(new customer("Nguyễn Thái Hòa","1983-08-22","Nam Định","https://24s.vn/anh-dai-dien-cho-facebook-de-thuong/imager_3918.jpg"));
        list.add(new customer("Trần Đăng Khoa","1983-08-17","Hà Tây","https://i.pinimg.com/736x/6e/af/1a/6eaf1a844ae4b6fa6eeb6ff17f468cc0.jpg"));
        list.add(new customer("Nguyễn Đình Thi","1983-08-19","Hà Nội","https://khoinguonsangtao.vn/wp-content/uploads/2022/05/avatar-dep-chat-nu.jpg"));
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setAttribute("CustomerList",list);
        request.getRequestDispatcher("view/list.jsp").forward(request,response);
    }
}

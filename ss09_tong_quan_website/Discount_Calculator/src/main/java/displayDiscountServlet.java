import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(name = "displayDiscountServlet" , urlPatterns = "/display-discount")
public class displayDiscountServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Double price = Double.parseDouble(request.getParameter("price"));
        String stDiscount = request.getParameter("discount");
        Integer discount = null;
        if(!stDiscount.isEmpty()){
            discount = Integer.valueOf(stDiscount);
        }


        String des = request.getParameter("des");

        PrintWriter writer = response.getWriter();
        if (price != null && discount !=null){
            Double discountAmount = discount * price * 0.01;
            double priceAfterDiscount = price - discountAmount;

            writer.println("<div>Description: " + des + "</div>");
            writer.println("<div>Discount Amount: " + discountAmount + "</div>");
            writer.println("Discount Price:" + priceAfterDiscount + "</div>");
        }else {
            writer.println("Error! Please input all field");
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}

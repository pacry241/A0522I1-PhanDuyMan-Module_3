package mvc.utils;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class ConnectionUtils {
    private static String jdbcURL =
            "jdbc:mysql://localhost:3306/demo?useSSL=false";
    private static String jdbcUsername = "codegym1";
    private static String jdbcPassword = "123456";

    public static Connection getConnection() throws SQLException, ClassNotFoundException {
        Connection connection = null;
        Class.forName("com.mysql.jdbc.Driver");
        connection = DriverManager.getConnection(jdbcURL,
                jdbcUsername, jdbcPassword);
        System.out.println("Connect Success");

        return connection;
    }

    public static void main(String[] args) throws SQLException, ClassNotFoundException {
        getConnection();
    }
}

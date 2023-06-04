package utils;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class ConnectionDB {
    private static String jdbcURL =
            "jdbc:mysql://localhost:3306/test?useSSL=false";
    private static String jdbcUsername = "root";
    private static String jdbcPassword = "Phanduyman1";

    public static Connection getConnection() throws SQLException, ClassNotFoundException{
        Connection connection = null;
        Class.forName("com.mysql.cj.jdbc.Driver");
        connection = DriverManager.getConnection(jdbcURL,jdbcUsername,jdbcPassword);
        System.out.println("Ket noi thanh cong");

        return connection;
    }
}

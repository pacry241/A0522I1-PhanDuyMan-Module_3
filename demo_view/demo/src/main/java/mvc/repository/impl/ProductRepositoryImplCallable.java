package mvc.repository.impl;

import mvc.bean.Product;
import mvc.repository.ProductRepository;
import mvc.utils.ConnectionUtils;
import mvc.utils.Constants;

import java.sql.*;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public class ProductRepositoryImplCallable implements ProductRepository {
    @Override
    public void create(Product product) throws Exception {
        if (findById(product.getId()) != null) {
            throw new Exception("Duplicate key");
        }
        Connection connection = ConnectionUtils.getConnection();
        try (
                PreparedStatement statement = connection.prepareStatement(Constants.INSERT_INTO_PRODUCT);
                ) {
            connection.setAutoCommit(false);
            statement.setString(1, product.getId());
            statement.setString(2, product.getName());
            statement.setDouble(3, product.getPrice());
            statement.setDate(4, new java.sql.Date(product.getDateRelease().getTime()));
            statement.setInt(5, product.getQuantity());
            statement.executeUpdate();

            statement.setString(1, "PR021");
            statement.setString(2, "Samsung S22");
            statement.setDouble(3, 600);
            statement.setDate(4, new java.sql.Date(new Date().getTime()));
            statement.setInt(5, 10);
            statement.executeUpdate();

            statement.setString(1, "PR022");
            statement.setString(2, "Samsung S21");
            statement.setDouble(3, 500);
            statement.setDate(4, new java.sql.Date(new Date().getTime()));
            statement.setInt(5, 10);
            statement.executeUpdate();
            connection.commit();
        } catch (SQLException e) {
            System.out.println(e.getMessage());
            connection.rollback();
        }
    }

    @Override
    public void update(Product product) throws Exception {
        if (findById(product.getId()) == null) {
            throw new Exception("Product ID not exist");
        }
        try (
                Connection connection = ConnectionUtils.getConnection();
                PreparedStatement statement = connection.prepareStatement(Constants.INSERT_INTO_PRODUCT);
        ) {
            statement.setString(5, product.getId());
            statement.setString(1, product.getName());
            statement.setDouble(2, product.getPrice());
            statement.setDate(3, new java.sql.Date(product.getDateRelease().getTime()));
            statement.setInt(4, product.getQuantity());
            statement.executeUpdate();
        }
    }

    @Override
    public void deleteById(String id) throws Exception {

    }

    @Override
    public Product findById(String id) throws SQLException, ClassNotFoundException {
        try (
                Connection connection = ConnectionUtils.getConnection();
                PreparedStatement statement = connection.prepareStatement(Constants.FIND_PRODUCT_BY_ID);
        ) {
            statement.setString(1, id);
            ResultSet rs = statement.executeQuery();
            if (rs.next()) {
                String name = rs.getString("name");
                Double price = rs.getDouble("price");
                Date dateRelease = new Date(rs.getDate("date_release").getTime());
                int quantity = rs.getInt("quantity");
                return new Product(id, name, price, dateRelease, quantity);
            }
        }
        return null;
    }

    @Override
    public List<Product> findAll() throws SQLException, ClassNotFoundException {
        List<Product> products = new ArrayList<>();
        String sql = "{call findAllProduct(?, ?)}";
        try (Connection connection = ConnectionUtils.getConnection();
             CallableStatement statement = connection.prepareCall(sql);
             ) {
            statement.setFloat(1, 700);
            statement.registerOutParameter(2, Types.INTEGER);
            ResultSet rs = statement.executeQuery();
            int count = statement.getInt(2);
            while (rs.next()) {
                String id = rs.getString("id");
                String name = rs.getString("name");
                Double price = rs.getDouble("price");
                Date dateRelease = new Date(rs.getDate("date_release").getTime());
                int quantity = rs.getInt("quantity");
                products.add(new Product(id, name, price, dateRelease, quantity));
            }
            System.out.println("Cout: " + count);
        }
        return products;
    }
}

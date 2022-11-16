package mvc.repository.impl;

import mvc.bean.Product;
import mvc.repository.ProductRepository;
import mvc.utils.ConnectionUtils;
import mvc.utils.Constants;

import java.sql.*;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public class ProductRepositoryImplDB implements ProductRepository {
    @Override
    public void create(Product product) throws Exception {
        if (findById(product.getId()) != null) {
            throw new Exception("Duplicate key");
        }
        try (
                Connection connection = ConnectionUtils.getConnection();
                PreparedStatement statement = connection.prepareStatement(Constants.INSERT_INTO_PRODUCT);
                ) {
            statement.setString(1, product.getId());
            statement.setString(2, product.getName());
            statement.setDouble(3, product.getPrice());
            statement.setInt(4,product.getQuantity());
            statement.setString(5,product.getColor());
            statement.setString(6, product.getDescription());
            statement.executeUpdate();
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
            statement.setString(1, product.getId());
            statement.setString(2, product.getName());
            statement.setDouble(3, product.getPrice());
            statement.setInt(4,product.getQuantity());
            statement.setString(5,product.getColor());
            statement.setString(6, product.getDescription());
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
                String name = rs.getString("pr_name");
                Double price = rs.getDouble("pr_price");
                int quantity = rs.getInt("quantity");
                String color = rs.getString("color");
                String description = rs.getString("description_pr");
                return new Product(id, name, price, quantity, color,description);
            }
        }
        return null;
    }

    @Override
    public List<Product> findAll() throws SQLException, ClassNotFoundException {
        List<Product> products = new ArrayList<>();
        try (Connection connection = ConnectionUtils.getConnection();
             Statement statement = connection.createStatement();
             ResultSet rs = statement.executeQuery(Constants.SELECT_ALL_FROM_PRODUCT);) {
            while (rs.next()) {
                String id = rs.getString("pr_id");
                String name = rs.getString("pr_name");
                Double price = rs.getDouble("pr_price");
                int quantity = rs.getInt("quantity");
                String color = rs.getString("color");
                String description = rs.getString("description_pr");
                products.add(new Product(id, name, price, quantity, color,description));
            }
        }
        return products;
    }
}

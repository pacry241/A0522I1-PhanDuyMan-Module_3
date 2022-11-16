package repository.impl;

import models.Category;
import models.Product;
import repository.CategoryRepository;
import repository.ProductRepository;
import utils.ConnectionUtils;
import utils.Constants;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class ProductRepositoryImpl implements ProductRepository, CategoryRepository {
    @Override
    public List<Product> findAll() throws SQLException, ClassNotFoundException {
        List<Product> products = new ArrayList<>();
        try(
                Connection connection = ConnectionUtils.getConnection();
                Statement statement = connection.createStatement();
                ResultSet rs = statement.executeQuery(Constants.SELECT_ALL_FROM_PRODUCT);
                )
                    {
                        while (rs.next()){
                            int id = rs.getInt("pr_id");
                            String namePr = rs.getString("pr_name");
                            Double price = rs.getDouble("pr_price");
                            int quantity = rs.getInt("quantity");
                            String color = rs.getString("color");
                            String description = rs.getString("description_pr");
                            String category = rs.getString("c_name");
                            products.add(new Product(id,namePr,price,quantity,color,description,category));
                        }

            } catch (SQLException throwables) {
                throwables.printStackTrace();
            } catch (ClassNotFoundException e) {
                e.printStackTrace();
            }
        return products;
    }

    @Override
    public void create(Product product) throws Exception {
        if (findById(product.getId()) != null) {
//            System.out.println("Duplicate key");
            throw new Exception("Duplicate key");
        }
        try (
                Connection connection = ConnectionUtils.getConnection();
                PreparedStatement statement = connection.prepareStatement(Constants.INSERT_INTO_PRODUCT);
        ) {
            statement.setInt(1, product.getId());
            statement.setString(2, product.getNameProduct());
            statement.setDouble(3, product.getPrice());
            statement.setInt(4,product.getQuantity());
            statement.setString(5,product.getColor());
            statement.setString(6, product.getDescription());
            statement.setInt(7,product.getCategoryId());
            statement.executeUpdate();
        }
        catch (SQLException throwables) {
        throwables.printStackTrace();
        } catch (ClassNotFoundException e) {
        e.printStackTrace();
        }
    }

    @Override
    public Product findById(int id) throws SQLException, ClassNotFoundException {
        Product product =null;
        try(
                Connection connection = ConnectionUtils.getConnection();
                PreparedStatement statement = connection.prepareStatement(Constants.FIND_PRODUCT_BY_ID);
        ){
            statement.setInt(1,id);
            ResultSet rs = statement.executeQuery();
            if(rs.next()){
                String namePr = rs.getString("pr_name");
                Double price = rs.getDouble("pr_price");
                int quantity = rs.getInt("quantity");
                String color = rs.getString("color");
                String description = rs.getString("description_pr");
                String category = rs.getString("c_name");
                product= new Product(id,namePr,price,quantity,color,description,category);
            }
        }
        return product;
    }

    @Override
    public List<Category> findAllCategory() throws SQLException, ClassNotFoundException {
        List<Category> categoryList = new ArrayList<>();
        try(
                Connection connection = ConnectionUtils.getConnection();
                Statement statement = connection.createStatement();
                ResultSet rs = statement.executeQuery(Constants.SELECT_ALL_FROM_CATEGORY);
        )
        {
            while (rs.next()){
                int id = rs.getInt("c_id");
                String nameC = rs.getString("c_name");
                categoryList.add(new Category(id,nameC));
            }
        }
        return categoryList;
    }

    @Override
    public void update(Product product) throws Exception {
        try (
                Connection connection = ConnectionUtils.getConnection();
                PreparedStatement statement = connection.prepareStatement(Constants.UPDATE_PRODUCT);
        ) {
            statement.setInt(7, product.getId());
            statement.setString(1, product.getNameProduct());
            statement.setDouble(2, product.getPrice());
            statement.setInt(3, product.getQuantity());
            statement.setString(4,product.getColor());
            statement.setString(5, product.getDescription());
            statement.setInt(6,product.getCategoryId());
            statement.execute();
        }
    }

    @Override
    public boolean deleteById(int id) throws Exception {
        boolean rowDeleted;
        try (Connection connection = ConnectionUtils.getConnection();
             PreparedStatement statement = connection.prepareStatement(Constants.DELETE_PRODUCT_SQL);) {
            statement.setInt(1, id);
            rowDeleted = statement.executeUpdate() > 0;
        }
        return rowDeleted;
    }
}

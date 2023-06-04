package repository.Impl;

import bean.Customer;
import repository.CustomerRepository;
import utils.ConnectionDB;
import utils.Constants;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class CustomerRepositoryImpl implements CustomerRepository {
    @Override
    public List<Customer> findAll() throws SQLException, ClassNotFoundException {
        List<Customer> customerList = new ArrayList<>();
        try(
                Connection connection = ConnectionDB.getConnection();
                Statement statement = connection.createStatement();
                ResultSet rs = statement.executeQuery(Constants.SELECT_ALL_FROM_CUSTOMER);
        ){
            while (rs.next()){
                int cID = rs.getInt("c_id");
                int id_thue = rs.getInt("id_thue");
                String cName = rs.getString("c_name");
                String cSDT = rs.getString("sdt");
                String dateStart = rs.getString("date_start");
                String type = rs.getString("type_name");
                String description = rs.getString("description");
                int typeId = rs.getInt("type_id");
                customerList.add(new Customer(cID,  cName,cSDT,id_thue,type,typeId,dateStart,description));
            }
        }catch (SQLException throwables) {
            throwables.printStackTrace();
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
        return customerList;
    }

    @Override
    public void create(Customer customer) throws Exception {
        if (findById(customer.getcId()) != null) {
//            System.out.println("Duplicate key");
            throw new Exception("Duplicate key");
        }

    }

    @Override
    public Customer findById(int id) throws SQLException, ClassNotFoundException {
        Customer customer =null;
        try(
                Connection connection = ConnectionDB.getConnection();
                PreparedStatement statement = connection.prepareStatement(Constants.FIND_PRODUCT_BY_ID);
        ){
            statement.setInt(1,id);
            ResultSet rs = statement.executeQuery();
            if(rs.next()){
                int cId = rs.getInt("c_id");
                int id_thue = rs.getInt("id_thue");
                String cName = rs.getString("c_name");
                String cSDT = rs.getString("sdt");
                String dateStart = rs.getString("date_start");
                String type = rs.getString("type_name");
                String description = rs.getString("description");
                int typeId = rs.getInt("type_id");
                customer = new Customer(cId,cName,cSDT,id_thue,type,typeId,dateStart,description);
            }
        }
        return customer;
    }

    @Override
    public boolean deleteById(int id) throws Exception {
        boolean rowDeleted;
        try (Connection connection = ConnectionDB.getConnection();
             PreparedStatement statement = connection.prepareStatement(Constants.DELETE_PRODUCT_SQL);) {
            statement.setInt(1, id);
            rowDeleted = statement.executeUpdate() > 0;
        }
        return rowDeleted;
    }
}

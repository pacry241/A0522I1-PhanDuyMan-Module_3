package repository.impl;

import bean.User;
import repository.UserRepository;
import utils.ConnectionDB;
import utils.Constants;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class UserRepositoryImpl implements UserRepository {
    @Override
    public List<User> findAll() throws SQLException, ClassNotFoundException {
       List<User> userList = new ArrayList<>();
       try(
               Connection connection = ConnectionDB.getConnection();
               PreparedStatement preparedStatement = connection.prepareStatement(Constants.SELECT_ALL_USERS);
               ResultSet rs = preparedStatement.executeQuery();
               ){
                while (rs.next()){
                    int id = rs.getInt("id");
                    String name = rs.getString("name");
                    String email = rs.getString("email");
                    String country = rs.getString("country");
                    userList.add(new User(id, name, email, country));
                }
       }catch (SQLException e){
           e.printStackTrace();
       }catch (ClassNotFoundException e){
           e.printStackTrace();
       }
        return userList;
    }

    @Override
    public void create(Object o) throws Exception {

    }

    @Override
    public Object findById(int id) throws SQLException, ClassNotFoundException {
        return null;
    }

    @Override
    public void update(Object o) throws Exception {

    }

    @Override
    public boolean deleteById(int id) throws Exception {
        return false;
    }
}

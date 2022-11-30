package service.impl;

import repository.UserRepository;
import repository.impl.UserRepositoryImpl;
import service.UserService;

import java.sql.SQLException;
import java.util.List;

public class UserServiceImpl implements UserService {
    UserRepository userRepository = new UserRepositoryImpl();
    @Override
    public List findAll() throws SQLException, ClassNotFoundException {
        return userRepository.findAll();
    }
}

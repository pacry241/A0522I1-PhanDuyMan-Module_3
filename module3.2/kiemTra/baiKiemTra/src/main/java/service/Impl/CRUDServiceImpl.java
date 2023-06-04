package service.Impl;

import bean.Customer;
import repository.CustomerRepository;
import repository.Impl.CustomerRepositoryImpl;
import service.CustomerService;

import java.sql.SQLException;
import java.util.List;

public class CRUDServiceImpl implements CustomerService {
    CustomerRepository customerRepository = new CustomerRepositoryImpl();
    @Override
    public List<Customer> findAll() throws SQLException, ClassNotFoundException {
        return customerRepository.findAll();
    }

    @Override
    public void create(Customer customer) throws Exception {

    }

    @Override
    public boolean deleteById(int id) throws Exception {
        return customerRepository.deleteById(id);
    }
}

package mvc.service.impl;

import mvc.bean.Product;
import mvc.repository.ProductRepository;
import mvc.repository.impl.ProductRepositoryImpl;
import mvc.repository.impl.ProductRepositoryImplCallable;
import mvc.repository.impl.ProductRepositoryImplDB;
import mvc.service.ProductService;

import java.sql.SQLException;
import java.util.List;

public class ProductServiceImpl implements ProductService {
    private ProductRepository repository = new ProductRepositoryImplCallable();

    @Override
    public void create(Product product) throws Exception {
        repository.create(product);
    }

    @Override
    public void update(Product product) throws Exception {
        repository.update(product);
    }

    @Override
    public void deleteById(String id) throws Exception {
        repository.deleteById(id);
    }

    @Override
    public Product findById(String id) throws SQLException, ClassNotFoundException {
        return repository.findById(id);
    }

    @Override
    public List<Product> findAll() throws SQLException, ClassNotFoundException {
        return repository.findAll();
    }
}

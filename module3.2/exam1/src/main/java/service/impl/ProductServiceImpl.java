package service.impl;

import models.Category;
import models.Product;
import repository.CategoryRepository;
import repository.ProductRepository;
import repository.impl.ProductRepositoryImpl;
import service.CategoryService;
import service.ProductService;

import java.sql.SQLException;
import java.util.List;

public class ProductServiceImpl implements ProductService, CategoryService {
    private ProductRepository productRepository = new ProductRepositoryImpl();
    private CategoryRepository categoryRepository = new ProductRepositoryImpl();
    @Override
    public List<Product> findAll() throws SQLException, ClassNotFoundException {
        return productRepository.findAll();
    }

    @Override
    public void create(Product product) throws Exception {
        productRepository.create(product);
    }

    @Override
    public Product findById(int id) throws SQLException, ClassNotFoundException {
        return productRepository.findById(id);
    }

    @Override
    public void update(Product product) throws Exception {
        productRepository.update(product);
    }

    @Override
    public boolean deleteById(int id) throws Exception {
        return productRepository.deleteById(id);
    }

    @Override
    public List<Category> findAllCategoryService() throws SQLException, ClassNotFoundException {
        return categoryRepository.findAllCategory();
    }
}

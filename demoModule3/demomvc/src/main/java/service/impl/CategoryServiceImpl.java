package service.impl;

import bean.Category;
import repository.CategoryRepository;
import repository.impl.CategoryRepositoryImpl;
import service.CategoryService;

import java.util.List;

public class CategoryServiceImpl implements CategoryService {
    private CategoryRepository repository = new CategoryRepositoryImpl();

    @Override
    public List<Category> findAll() {
        return repository.findAll();
    }

    @Override
    public Category findById(String id) {
        return repository.findById(id);
    }
}

package repository;

import bean.Category;

import java.util.List;

public interface CategoryRepository {
    List<Category> findAll();
    Category findById(String id);
}

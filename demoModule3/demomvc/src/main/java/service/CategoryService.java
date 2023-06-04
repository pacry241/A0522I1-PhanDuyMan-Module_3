package service;

import bean.Category;

import java.util.List;

public interface CategoryService {
    List<Category> findAll();
    Category findById(String id);
}

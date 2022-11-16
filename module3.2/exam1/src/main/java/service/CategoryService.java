package service;

import models.Category;

import java.sql.SQLException;
import java.util.List;

public interface CategoryService {
    List<Category> findAllCategoryService() throws SQLException,ClassNotFoundException;
}

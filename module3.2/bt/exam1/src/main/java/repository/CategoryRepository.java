package repository;

import models.Category;

import java.sql.SQLException;
import java.util.List;

public interface CategoryRepository {
    List<Category> findAllCategory() throws SQLException,ClassNotFoundException;
}

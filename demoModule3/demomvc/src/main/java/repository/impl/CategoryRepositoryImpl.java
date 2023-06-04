package repository.impl;

import bean.Category;
import repository.CategoryRepository;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class CategoryRepositoryImpl implements CategoryRepository {
    private static Map<String, Category> categoryMap;

    static {
        categoryMap = new HashMap<>();
        categoryMap.put("CT001", new Category("CT001", "Sách giáo khoa"));
        categoryMap.put("CT002", new Category("CT002", "Sách tham khảo"));
        categoryMap.put("CT003", new Category("CT003", "Sách khoa học"));
        categoryMap.put("CT004", new Category("CT004", "Sách tiếng anh"));
    }

    @Override
    public List<Category> findAll() {
        return new ArrayList<>(categoryMap.values());
    }

    @Override
    public Category findById(String id) {
        return categoryMap.get(id);
    }
}

package mvc.repository.impl;

import mvc.bean.Product;
import mvc.repository.ProductRepository;

import java.util.*;

public class ProductRepositoryImpl implements ProductRepository {
    private static Map<String, Product> map;

    static {
        map = new HashMap<>();
        map.put("Pr001", new Product("Pr001", "Laptop Dell", 700d, new Date(), 10));
        map.put("Pr002", new Product("Pr002", "Laptop Asus", 750d, new Date(), 10));
        map.put("Pr003", new Product("Pr003", "Laptop Acer", 790d, new Date(), 10));
        map.put("Pr004", new Product("Pr004", "Laptop Lenovo", 600d, new Date(), 10));
        map.put("Pr005", new Product("Pr005", "Laptop HP", 550d, new Date(), 10));
    }

    @Override
    public void create(Product product) throws Exception {
        if (map.containsKey(product.getId())) {
            throw new Exception("Duplicate key");
        }
        map.put(product.getId(), product);
    }

    @Override
    public void update(Product product) throws Exception {
        if (map.containsKey(product.getId())) {
            map.put(product.getId(), product);
            return;
        }
        throw new Exception("Product ID not exist");

    }

    @Override
    public void deleteById(String id) throws Exception{
        if (map.containsKey(id)) {
            map.remove(id);
            return;
        }
        throw new Exception("Product ID not exist");
    }

    @Override
    public Product findById(String id) {
        return map.get(id);
    }

    @Override
    public List<Product> findAll() {
        return new ArrayList<>(map.values());
    }
}

package mvc.repository.impl;

import mvc.bean.Product;
import mvc.repository.ProductRepository;

import java.util.*;

public class ProductRepositoryImpl implements ProductRepository {
    private static Map<String, Product> map;

    static {
        map = new HashMap<>();
        map.put("phone1",new Product("phone1","Iphone 11",799.0,12,"Black","New"));
        map.put("phone2",new Product("phone2","Iphone 11 Pro",1100.0,12,"Black","New"));
        map.put("phone3",new Product("phone3","Iphone 11",799.0,12,"Black","New"));

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

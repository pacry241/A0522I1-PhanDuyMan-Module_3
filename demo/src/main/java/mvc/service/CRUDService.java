package mvc.service;

import java.util.List;

public interface CRUDService<T> {
    void create(T t) throws Exception;
    void update(T t) throws Exception;
    void deleteById(String id) throws Exception;
    T findById(String id);
    List<T> findAll();
}

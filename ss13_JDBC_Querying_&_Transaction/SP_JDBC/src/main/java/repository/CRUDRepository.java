package repository;

import java.sql.SQLException;
import java.util.List;

public interface CRUDRepository<T> {
    List<T> findAll() throws SQLException, ClassNotFoundException;
    void create(T t) throws Exception;
    T findById(int id) throws SQLException, ClassNotFoundException;
    void update(T t) throws Exception;
    boolean deleteById(int id) throws Exception;
}

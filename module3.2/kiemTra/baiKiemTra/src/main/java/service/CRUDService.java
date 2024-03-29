package service;

import java.sql.SQLException;
import java.util.List;

public interface CRUDService<T> {
    List<T> findAll() throws SQLException, ClassNotFoundException;
    void create(T t) throws Exception;

    boolean deleteById(int id) throws Exception;

}

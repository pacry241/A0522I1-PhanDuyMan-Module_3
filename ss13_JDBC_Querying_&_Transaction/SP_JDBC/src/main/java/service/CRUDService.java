package service;

import java.sql.SQLException;
import java.util.List;

public interface CRUDService<T> {
    List<T> findAll() throws SQLException, ClassNotFoundException;

}

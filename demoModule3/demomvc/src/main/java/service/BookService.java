package service;

import bean.Book;

import java.util.List;

public interface BookService {
    void saveOrUpdate(Book book);
    void deleteById(String id);
    Book findById(String id);
    List<Book> findAll();
}

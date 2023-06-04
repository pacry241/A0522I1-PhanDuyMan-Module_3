package repository.impl;

import bean.Book;
import repository.BookRepository;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class BookRepositoryImpl implements BookRepository {
    private static Map<String, Book> bookMap;

    static {
        bookMap = new HashMap<>();
    }

    @Override
    public void saveOrUpdate(Book book) {
        bookMap.put(book.getId(), book);
    }

    @Override
    public void deleteById(String id) {
        bookMap.remove(id);
    }

    @Override
    public Book findById(String id) {
        return bookMap.get(id);
    }

    @Override
    public List<Book> findAll() {
        return new ArrayList<>(bookMap.values());
    }
}

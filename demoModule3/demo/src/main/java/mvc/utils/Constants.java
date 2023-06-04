package mvc.utils;

public interface Constants {
    String SELECT_ALL_FROM_PRODUCT = "Select * from Product";
    String INSERT_INTO_PRODUCT = "Insert into Product values (?, ?, ?, ?, ?)";
    String UPDATE_PRODUCT = "Update Product set name = ?, price = ?, date_release = ?, quantity = ? where id = ?";
    String FIND_PRODUCT_BY_ID = "select * from product where id = ?";
}

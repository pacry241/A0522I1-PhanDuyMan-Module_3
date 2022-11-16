package utils;

public interface Constants {
    String SELECT_ALL_FROM_PRODUCT = "select pr_id,pr_name,pr_price,quantity,color , description_pr,c.c_name from product pr left join category c on pr.c_id = c.c_id;";
//    String SELECT_ALL_FROM_PRODUCT = "Select * from Product";
    String INSERT_INTO_PRODUCT = "Insert into Product values (?, ?, ?, ?, ?, ?,?)";
    String FIND_PRODUCT_BY_ID = "select pr_id,pr_name,pr_price,quantity,color,description_pr,c.c_name from product pr left join category c on pr.c_id = c.c_id where pr_id = ?;";
    String SELECT_ALL_FROM_CATEGORY = "select * from category";
    String UPDATE_PRODUCT = " update product set pr_name = ?, pr_price = ?, quantity = ?, color= ?, description_pr= ?, c_id = ? where pr_id = ?;";
    String DELETE_PRODUCT_SQL = "delete from product where pr_id = ?;";

}

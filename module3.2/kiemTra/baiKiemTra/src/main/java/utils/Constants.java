package utils;

public interface Constants {
    String SELECT_ALL_FROM_CUSTOMER = "select c.c_id,c.id_thue,c.c_name, c.sdt, c.date_start, t.type_name,c.description, t.type_id\n" +
            "from customer c join `type` t on c.type_id = t.type_id;";

    String INSERT_INTO_CUSTOMER = "insert into customer values(?,?,?,?,?,?,?)";
    String FIND_PRODUCT_BY_ID = "select c.c_id,c.id_thue,c.c_name, c.sdt, c.date_start, t.type_name,c.description, t.type_id\n" +
            "from customer c join `type` t on c.type_id = t.type_id where c.c_id = ?;";
    String DELETE_PRODUCT_SQL = "delete from customer where c_id = ?";
}

package utils;

public interface Constants {
    String INSERT_USERS_SQL = "INSERT INTO users" + "  (name, email, country) VALUES " +
            " (?, ?, ?);";

    String SELECT_USER_BY_ID = "select id,name,email,country from users where id =?";
    String SELECT_ALL_USERS = "select * from users";
    String DELETE_USERS_SQL = "delete from users where id = ?;";
    String UPDATE_USERS_SQL = "update users set name = ?,email= ?, country =? where id = ?;";
}

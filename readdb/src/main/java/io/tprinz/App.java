package io.tprinz;

import java.sql.*;  

/**
 * Hello world!
 *
 */
public class App 
{
    public static void main( String[] args )
    {
        System.out.println( "Hello World!" );

        String sqlSelectAllPersons = "SELECT * FROM tasks";

        String mysql_host = System.getenv("MYSQL_HOST");
        System.out.println("MYSQL_HOST : " + mysql_host);

        String mysql_user = System.getenv("MYSQL_USER");
        System.out.println("MYSQL_USER : " + mysql_user);

        String mysql_password = System.getenv("MYSQL_PASSWORD");
        System.out.println("MYSQL_PASSWORD : " + mysql_password);

        String mysql_database = System.getenv("MYSQL_DATABASE");
        System.out.println("MYSQL_DATABASE : " + mysql_database);


//        String connectionUrl = "jdbc:mysql://localhost:3306/todo?serverTimezone=UTC";
        String connectionUrl = "jdbc:mysql://" + mysql_host + ":3306/" + mysql_database + "?serverTimezone=UTC";
        System.out.println("Connection string : " + connectionUrl);

        try (Connection conn = DriverManager.getConnection(connectionUrl, mysql_user, mysql_password); 
                PreparedStatement ps = conn.prepareStatement(sqlSelectAllPersons); 
                ResultSet rs = ps.executeQuery()) {

                while (rs.next()) {
                    long id = rs.getLong("id");
//                    String name = rs.getString("FIRST_NAME");
//                    String lastName = rs.getString("LAST_NAME");
                      System.out.println( "id: "+id );

                    // do something with the extracted data...
                }
        } catch (SQLException e) {
                      System.out.println( e );
            // handle the exception
        }

    }
}

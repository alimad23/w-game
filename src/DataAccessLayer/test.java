package DataAccessLayer;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;

public class test {
    public static void main(String[] args) {
        Connection c = null;
        Statement st = null;
        try {
            c = new DAImpl().getConnection();

//            c.setAutoCommit(false);
            System.out.println("Opened database successfully");
            st = c.createStatement();
            String query = "DELETE FROM level_1 WHERE username='null'";
            st.executeUpdate(query);
            st.close();
            c.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        System.out.println("DONE!");
    }
}

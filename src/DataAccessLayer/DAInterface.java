package DataAccessLayer;

import java.sql.SQLException;
import java.util.ArrayList;

public interface DAInterface {

    void add(String username, String password);

    void remove(String username);

    GameUser getData(String username);

    void levelComplete(String username, int level, int moves, String time) throws SQLException;

    ArrayList<GameUser> bestOfMoves(int level) throws SQLException;

    ArrayList<GameUser> bestOfTime(int level) throws SQLException;

    Object getSpecificData(String table_name, String colName, String username) throws SQLException;
}

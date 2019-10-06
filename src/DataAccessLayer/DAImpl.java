package DataAccessLayer;


import java.sql.*;
import java.util.ArrayList;
import java.util.Properties;

public class DAImpl implements DAInterface {
    private String driver = "org.postgresql.Driver";
    private String user = "postgres";
    private String pass = "ali1234!";
    private String url = "jdbc:postgresql://localhost:5432/postgres";
//    private String table_name = "game";

    public DAImpl() {
    }

    public DAImpl(String driver, String user, String pass, String url) {
        this.driver = driver;
        this.user = user;
        this.pass = pass;
        this.url = url;
    }

    @Override
    public void add(String username, String password) {
        String query = "insert into game(username,password,level,tt,tm)values('" + username + "','"
                + password + "',0,'00:00',0)";
        executeUpdate(query);

        System.out.println("add called");
    }

    @Override
    public void remove(String username) {
        String query = "delete from game where username='" + username + "'";
        System.out.println("remove.runs" + " user name is : " + username);
        executeUpdate(query);
        for (int i = 1; i <= 15; i++) {
            query = "delete from level_" + i + "where username='" + username + "'";
            executeUpdate(query);
        }
    }

    @Override
    public GameUser getData(String username) {
        String query = "select password from game where username='" +
                username + "'";
        Connection c = null;
        Statement statement = null;
        try {
            c = getConnection();
            statement = c.createStatement();
            ResultSet rs = statement.executeQuery(query);
            if (rs.next()) {
                String password = rs.getString("password");
                return new GameUser(username, password);
            } else {
                return null;
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (c != null) {
                try {
                    c.close();
                } catch (SQLException e) {

                    e.printStackTrace();
                }
            }
        }
        return null;
    }

    protected Connection getConnection() {
        try {
            Class.forName(driver).newInstance();
        } catch (Exception e) {
            e.printStackTrace();
        }
        Properties props = new Properties();
        props.put("user", user);
        props.put("password", pass);
        try {
            return DriverManager.getConnection(url, props);
        } catch (SQLException e) {
            throw new RuntimeException("Failed to get Connection", e);
        }
    }

    private ResultSet executeQuery(String query) {
        Connection connection = null;
        ResultSet rs = null;
        try {
            connection = getConnection();
            Statement st = connection.createStatement();
            rs = st.executeQuery(query);
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            if (connection != null) {
                try {
                    connection.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
        }
        return rs;
    }

    private void executeUpdate(String query) {
        Connection connection = null;
        try {
            connection = getConnection();
//            connection.setAutoCommit(false);
            Statement st = connection.createStatement();
            st.executeUpdate(query);
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            if (connection != null) {
                try {
                    connection.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
        }
    }

    @Override
    public void levelComplete(String username, int level, int moves, String time) throws SQLException {
        String query = "insert into level_" + level + "(username,moves,time)values('" +
                username + "'," + moves + ",'" + time + "')";
        System.out.println(query);
        executeUpdate(query);
        query = "select level from game where username = '" + username + "'";
        ResultSet rs = executeQuery(query);
        int dataLevel = 0;
        while (rs.next()) {
            dataLevel = rs.getInt("level");
        }
        if (dataLevel < level) {
            query = "update game set level = " + level + " where username = '" + username + "'";
            executeUpdate(query);
        }
    }

    @Override
    public ArrayList<GameUser> bestOfMoves(int level) throws SQLException {
        String query = "SELECT * FROM level_" + level;
        ResultSet rs = executeQuery(query);
        ArrayList<String> username = new ArrayList<>();
        ArrayList<String> time = new ArrayList<>();
        ArrayList<Integer> moves = new ArrayList<>();
        while (rs.next()) {
            username.add(rs.getString("username"));
            time.add(rs.getString("time"));
            moves.add(rs.getInt("moves"));
        }
        ArrayList<GameUser> min_users = new ArrayList<>();
        if (username.size() == 0){
            min_users.add(new GameUser("null","0",0));
            return min_users;
        }
        String min_user = username.get(0);
        String min_time = time.get(0);
        int min_moves = moves.get(0);
        int index = 0;
        for (int i = 1; i < username.size(); i++) {
            if (min_moves > moves.get(i)) {
                min_user = username.get(i);
                min_time = time.get(i);
                min_moves = moves.get(i);
                index = i;
            }
        }
        username.remove(index);
        moves.remove(index);
        time.remove(index);
        min_users.add(new GameUser(min_user, min_time, min_moves));
        if (username.size() == 0){
            return min_users;
        }
        min_user = username.get(0);
        min_time = time.get(0);
        min_moves = moves.get(0);
        index = 0;
        for (int i = 1; i < username.size(); i++) {
            if (min_moves > moves.get(i)) {
                min_user = username.get(i);
                min_time = time.get(i);
                min_moves = moves.get(i);
                index = i;
            }
        }
        username.remove(index);
        moves.remove(index);
        time.remove(index);
        min_users.add(new GameUser(min_user, min_time, min_moves));
        if (username.size() == 0){
            return min_users;
        }
        min_user = username.get(0);
        min_time = time.get(0);
        min_moves = moves.get(0);
        index = 0;
        for (int i = 1; i < username.size(); i++) {
            if (min_moves > moves.get(i)) {
                min_user = username.get(i);
                min_time = time.get(i);
                min_moves = moves.get(i);
                index = i;
            }
        }
        username.remove(index);
        moves.remove(index);
        time.remove(index);
        min_users.add(new GameUser(min_user, min_time, min_moves));
        return min_users;
    }

    @Override
    public ArrayList<GameUser> bestOfTime(int level) throws SQLException {
        String query = "SELECT * FROM level_" + level;
        ResultSet rs = executeQuery(query);
        ArrayList<String> username = new ArrayList<>();
        ArrayList<String> time = new ArrayList<>();
        ArrayList<Integer> moves = new ArrayList<>();
        while (rs.next()) {
            username.add(rs.getString("username"));
            time.add(rs.getString("time"));
            moves.add(rs.getInt("moves"));
        }

        ArrayList<GameUser> min_users = new ArrayList<>();
        if (username.size() == 0){
            min_users.add(new GameUser("null","0",0));
            return min_users;
        }
        String min_user = username.get(0);
        String min_time = time.get(0);
        int second = Integer.parseInt(min_time.split(":")[1]);
        int minute = Integer.parseInt(min_time.split(":")[0]);
        int min_moves = moves.get(0);
        int index = 0;
        for (int i = 1; i < username.size(); i++) {
            if (minute > Integer.parseInt(time.get(i).split(":")[0])) {
                min_user = username.get(i);
                min_time = time.get(i);
                min_moves = moves.get(i);
                minute = Integer.parseInt(time.get(i).split(":")[0]);
                second = Integer.parseInt(time.get(i).split(":")[1]);
                index = i;
            } else if (minute == Integer.parseInt(time.get(i).split(":")[0]) && second > Integer.parseInt(time.get(i).split(":")[1])) {
                min_user = username.get(i);
                min_time = time.get(i);
                min_moves = moves.get(i);
                minute = Integer.parseInt(time.get(i).split(":")[0]);
                second = Integer.parseInt(time.get(i).split(":")[1]);
                index = i;
            }
        }
        username.remove(index);
        moves.remove(index);
        time.remove(index);
        min_users.add(new GameUser(min_user, min_time, min_moves));
        if (username.size() == 0){
            return min_users;
        }
        min_user = username.get(0);
        min_time = time.get(0);
        second = Integer.parseInt(min_time.split(":")[1]);
        minute = Integer.parseInt(min_time.split(":")[0]);
        min_moves = moves.get(0);
        index = 0;
        for (int i = 1; i < username.size(); i++) {
            if (minute > Integer.parseInt(time.get(i).split(":")[0])) {
                min_user = username.get(i);
                min_time = time.get(i);
                min_moves = moves.get(i);
                minute = Integer.parseInt(time.get(i).split(":")[0]);
                second = Integer.parseInt(time.get(i).split(":")[1]);
                index = i;
            } else if (minute == Integer.parseInt(time.get(i).split(":")[0]) && second > Integer.parseInt(time.get(i).split(":")[1])) {
                min_user = username.get(i);
                min_time = time.get(i);
                min_moves = moves.get(i);
                minute = Integer.parseInt(time.get(i).split(":")[0]);
                second = Integer.parseInt(time.get(i).split(":")[1]);
                index = i;
            }
        }
        username.remove(index);
        moves.remove(index);
        time.remove(index);
        min_users.add(new GameUser(min_user, min_time, min_moves));
        if (username.size() == 0){
            return min_users;
        }
        min_user = username.get(0);
        min_time = time.get(0);
        second = Integer.parseInt(min_time.split(":")[1]);
        minute = Integer.parseInt(min_time.split(":")[0]);
        min_moves = moves.get(0);
        index = 0;
        for (int i = 1; i < username.size(); i++) {
            if (minute > Integer.parseInt(time.get(i).split(":")[0])) {
                min_user = username.get(i);
                min_time = time.get(i);
                min_moves = moves.get(i);
                minute = Integer.parseInt(time.get(i).split(":")[0]);
                second = Integer.parseInt(time.get(i).split(":")[1]);
                index = i;
            } else if (minute == Integer.parseInt(time.get(i).split(":")[0]) && second > Integer.parseInt(time.get(i).split(":")[1])) {
                min_user = username.get(i);
                min_time = time.get(i);
                min_moves = moves.get(i);
                minute = Integer.parseInt(time.get(i).split(":")[0]);
                second = Integer.parseInt(time.get(i).split(":")[1]);
                index = i;
            }
        }
        min_users.add(new GameUser(min_user, min_time, min_moves));

        return min_users;
    }


    public void totalMoveUpdate(String username, int moves) throws SQLException {
        String query = "select tm from game where username = '" + username + "'";
        ResultSet rs = executeQuery(query);
        int total_moves = 0;
        while (rs.next()) {
            total_moves = rs.getInt("tm");
        }
        int result = total_moves + moves;
        query = "update game set tm = " + result + " where username = '" + username + "'";
        executeUpdate(query);
    }

    @Override
    public Object getSpecificData(String table_name, String colName, String username) throws SQLException {
        String query = "select " + colName + " from " + table_name + " where username = '" + username + "'";
        ResultSet rs = executeQuery(query);
        Object result = null;
        while (rs.next()) {
            result = rs.getObject(colName);
        }
        return result;
    }


    public void totalTimeUpdate(String username, String time) {
        String query = "update game set tt = '" + time + "' where username = '" + username + "'";
        executeUpdate(query);
    }

    public ArrayList<Integer> bestOfMyMove(String username, int level) throws SQLException {
        ArrayList<Integer> result = new ArrayList<>();
        String query = "select * from level_" + level + " where username = '" + username + "'";
        ResultSet rs = executeQuery(query);
        while (rs.next()){
            result.add(rs.getInt("moves"));
        }
        return result;
    }

    public ArrayList<String> bestOfMyTime(String username, int level) throws SQLException {
        ArrayList<String> result = new ArrayList<>();
        String query = "select * from level_" + level + " where username = '" + username + "'";
        ResultSet rs = executeQuery(query);
        while (rs.next()){
            result.add(rs.getString("time"));
        }
        return result;
    }
}

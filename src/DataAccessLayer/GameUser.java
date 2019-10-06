package DataAccessLayer;

public class GameUser {
    private String username, password, time;
    private int move;


    public GameUser(String username, String password) {
        this.username = username;
        this.password = password;
    }

    public GameUser(String username, String time, int move) {
        this.username = username;
        this.time = time;
        this.move = move;
    }

    public String getUsername() {
        return username;
    }

    public String getPassword() {
        return password;
    }

    public String getTime() {
        return time;
    }

    public int getMove() {
        return move;
    }

    public boolean checkPassword(String pass) {
        return this.password.equals(pass);
    }


}

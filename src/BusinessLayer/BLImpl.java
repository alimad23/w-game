package BusinessLayer;

import BusinessLayer.Exception.DuplicateUserNameException;
import BusinessLayer.Exception.PasswordDoesntMatchException;
import BusinessLayer.Exception.SimplePasswordException;
import DataAccessLayer.DAImpl;
import DataAccessLayer.GameUser;

import java.sql.SQLException;
import java.util.ArrayList;


public class BLImpl implements BusinessLayerInterface {
    private DAImpl dataAccess;

    public BLImpl(DAImpl dataAccess) {
        this.dataAccess = dataAccess;
    }

    @Override
    public void register(String username, String password) throws DuplicateUserNameException, SimplePasswordException {
        GameUser gu = dataAccess.getData(username);
        if (gu != null) {
            throw new DuplicateUserNameException();
        } else {
            if (password.length() >= 8 )
            dataAccess.add(username, password);
            else {
                throw new SimplePasswordException();
            }
        }
    }

    @Override
    public GameUser login(String username, String password) throws PasswordDoesntMatchException {
        GameUser gu = dataAccess.getData(username);
        if (gu != null && gu.checkPassword(password)) {
            return gu;
        } else if (!gu.checkPassword(password)) {
            throw new PasswordDoesntMatchException();
        }
        return null;
    }

    @Override
    public void remove(String username) {
        dataAccess.remove(username);
    }

    @Override
    public ArrayList<GameUser> bestOfMoves(int level) throws SQLException {
        return dataAccess.bestOfMoves(level);
    }

    public void levelComplete(String username, int level, int moves, String time) throws SQLException {
        dataAccess.levelComplete(username, level, moves, time);
    }

    @Override
    public ArrayList<GameUser> bestOfTime(int level) throws SQLException {
        return dataAccess.bestOfTime(level);
    }

    public void totalMove(String username, int moves) throws SQLException {
        dataAccess.totalMoveUpdate(username, moves);
    }

    public void totalTime(String username, String time) throws SQLException {
        String total_time = (String) dataAccess.getSpecificData("game", "tt", username);
        String sum = time_sum(time, total_time);
        dataAccess.totalTimeUpdate(username, sum);

    }

    private String time_sum(String time1, String time2) {
        String result = "";
        int minute1 = Integer.parseInt(time1.split(":")[0]);
        int second1 = Integer.parseInt(time1.split(":")[1]);
        int minute2 = Integer.parseInt(time2.split(":")[0]);
        int second2 = Integer.parseInt(time2.split(":")[1]);
        int result_minute = minute1 + minute2;
        int result_second = second1 + second2;
        if (result_second >= 60) {
            result_minute++;
            result_second -= 60;
        }
        result += result_minute + ":" + result_second;
        return result;
    }

    public Integer bestOfMyMove(String username, int level) throws SQLException {
        int result = 0;
        ArrayList<Integer> moves = dataAccess.bestOfMyMove(username, level);
        if (moves.size() == 0) {
            return -1;
        }
        result = moves.get(0);
        for (int i = 1; i < moves.size(); i++) {
            if (result > moves.get(i)) {
                result = moves.get(i);
            }
        }
        return result;
    }

    public String bestOfMyTime(String username, int level) throws SQLException {
        String result = "";
        ArrayList<String> time = dataAccess.bestOfMyTime(username, level);
        if (time.size() == 0) {
            return null;
        }
        int minute = Integer.parseInt(time.get(0).split(":")[0]);
        int second = Integer.parseInt(time.get(0).split(":")[1]);
        for (int i = 1; i < time.size(); i++) {
            if (minute > Integer.parseInt(time.get(i).split(":")[0])) {
                minute = Integer.parseInt(time.get(i).split(":")[0]);
                second = Integer.parseInt(time.get(i).split(":")[1]);
            } else if (minute == Integer.parseInt(time.get(i).split(":")[0]) && second > Integer.parseInt(time.get(i).split(":")[1])) {
                minute = Integer.parseInt(time.get(i).split(":")[0]);
                second = Integer.parseInt(time.get(i).split(":")[1]);
            }
        }
        result = minute + "m " + second + "s";
        return result;
    }

    public DAImpl getDataAccess() {
        return dataAccess;
    }
}

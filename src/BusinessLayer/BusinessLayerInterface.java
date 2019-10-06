package BusinessLayer;


import BusinessLayer.Exception.DuplicateUserNameException;
import BusinessLayer.Exception.PasswordDoesntMatchException;
import BusinessLayer.Exception.SimplePasswordException;
import DataAccessLayer.GameUser;

import java.sql.SQLException;
import java.util.ArrayList;

public interface BusinessLayerInterface {
    void register(String username , String password) throws DuplicateUserNameException, SimplePasswordException;
    GameUser login(String username , String password) throws PasswordDoesntMatchException;
    void remove(String username);

    ArrayList<GameUser> bestOfMoves(int level) throws SQLException;

    ArrayList<GameUser> bestOfTime(int level) throws SQLException;
}

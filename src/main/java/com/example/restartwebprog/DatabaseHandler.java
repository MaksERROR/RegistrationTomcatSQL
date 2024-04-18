package com.example.restartwebprog;
import javax.servlet.RequestDispatcher;
import java.sql.*;
public class DatabaseHandler {
    private static Connection dbCon;
    private static Connection getdbConnection() throws ClassNotFoundException,SQLException{
        Class.forName("com.mysql.jdbc.Driver");
        dbCon = DriverManager.getConnection("jdbc:mysql://localhost:3306/mydatabase","root", "password");
        return dbCon;
    }
    public static ResultSet LoginUser(String user, String password){
        String req = "SELECT * FROM users WHERE username = ? and password =?";
        ResultSet resset = null;
        try {
            PreparedStatement st = getdbConnection().prepareStatement(req);
            st.setString(1,user);
            st.setString(2,password);
            resset = st.executeQuery();
            return resset;
        }
        catch (Exception e){
            e.printStackTrace();
        }
        return resset;
    }
    public static boolean RegisterUser(String user,String password,String emai) throws SQLException {
        ResultSet rez = LoginUser(user,password);
        int coun = 0;
        while (rez.next())
            coun++;
        if (coun>0)
            return false;
        String req = "INSERT INTO users(username, password, email) VALUES(?, ?, ?)";
        try {
            PreparedStatement st = getdbConnection().prepareStatement(req);
            st.setString(1,user);
            st.setString(2,password);
            st.setString(3,emai);
            st.executeUpdate();
            return true;
        }
        catch (ClassNotFoundException | SQLException e){
            e.printStackTrace();
        }
        return false;
    }
}

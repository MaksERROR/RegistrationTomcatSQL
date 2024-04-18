package com.example.restartwebprog;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import java.io.IOException;
import java.sql.*;
@WebServlet(name = "LoginServlet", value = "/LoginServlet")
public class LoginServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    }
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String action = request.getParameter("action");
        HttpSession session = request.getSession();
        RequestDispatcher dispatcher = null;
        if ("Login".equals(action) ||"Авторизоваться".equals(action) ){
            try {
                ResultSet rs = DatabaseHandler.LoginUser(username,password);
                int counter = 0;
                while (rs.next())counter++;
                if (counter>0){
                    session.setAttribute("name",username);
                    dispatcher = request.getRequestDispatcher("app/start.jsp");
                }
                else {
                    request.setAttribute("status", "Account not exist");
                    dispatcher = request.getRequestDispatcher("login.jsp");
                }
                dispatcher.forward(request,response);
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
    }
}

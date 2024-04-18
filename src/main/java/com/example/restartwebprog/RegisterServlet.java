package com.example.restartwebprog;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import java.io.IOException;
@WebServlet(name = "RegisterServlet", value = "/RegisterServlet")
public class RegisterServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    }
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String username = request.getParameter("username");
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String action = request.getParameter("action");
        HttpSession session = request.getSession();
        RequestDispatcher dispatcher = null;
        if ("Register".equals(action) || "регистр".equals(action)) {
            try {
                boolean rez = DatabaseHandler.RegisterUser(username,password,email);
                if (rez){
                    session.setAttribute("name",username);
                    dispatcher = request.getRequestDispatcher("app/start.jsp");
                }
                else {
                    request.setAttribute("status", "Account exists");
                    dispatcher = request.getRequestDispatcher("register.jsp");
                }
                dispatcher.forward(request,response);
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
    }
}

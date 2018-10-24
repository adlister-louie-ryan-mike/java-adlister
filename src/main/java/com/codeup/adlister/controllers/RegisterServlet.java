package com.codeup.adlister.controllers;

import com.codeup.adlister.dao.DaoFactory;
import com.codeup.adlister.dao.MySQLUsersDao;
import com.codeup.adlister.models.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;

@WebServlet(name = "controllers.RegisterServlet", urlPatterns = "/register")
public class RegisterServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try{
            String error = request.getParameter("error");
            if (error.equals("error")){
                String message = "Username is already taken. Input a different username.";
                request.setAttribute("error", message);
                request.getRequestDispatcher("/WEB-INF/register.jsp").forward(request, response);

            }
        }
        catch (Exception e){
            System.out.println("No parameter found");
        }
        request.getRequestDispatcher("/WEB-INF/register.jsp").forward(request, response);

    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String username = request.getParameter("username");
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String passwordConfirmation = request.getParameter("confirm_password");

        // validate input
        boolean inputHasErrors = username.isEmpty()
            || email.isEmpty()
            || password.isEmpty()
            || (! password.equals(passwordConfirmation));

        if (inputHasErrors) {
            response.sendRedirect("/register");
            return;
        }


        // create and save a new user
        User user = new User(username, email, password);
        Long newUser = DaoFactory.getUsersDao().insert(user);
        System.out.println(newUser);
        if(newUser == 0){
            response.sendRedirect("/register?error=error");
        }
        else {
            response.sendRedirect("/login");
        }

    }
}

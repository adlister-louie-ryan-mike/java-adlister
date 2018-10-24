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
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "controllers.RegisterServlet", urlPatterns = "/register")
public class RegisterServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try{

            //Gather information from the url to display to the sticky forms on the register page
            // if there were errors from a previous attempt.
            
            String error = request.getParameter("error");
            String usernameInput = request.getParameter("username");
            String emailInput = request.getParameter("email");
            if (error.equals("error")){
                String message = "Username is already taken. Input a different username.";
                request.setAttribute("error", message);
                request.setAttribute("usernameInput", usernameInput);
                request.setAttribute("emailInput", emailInput);

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

        User user = new User(username, email, password);
        Long newUser = DaoFactory.getUsersDao().insert(user);
        System.out.println(newUser);
        String url = "/register?";
        url += "&username="+username;
        url += "&email="+email;

        List<String> errorList = new ArrayList<String>();
        List<String> valid = DaoFactory.getUsersDao().isValid(password, passwordConfirmation, errorList );
        String passwordErrors = "";
        if (!valid.isEmpty()) {
            System.out.println("The password entered here  is invalid");
            for (String error : errorList) {
                passwordErrors += error;
            }
            url+= "&password="+passwordErrors;
        }

        // create and save a new user

        if(newUser == 0){
            url += "&error=error";
            response.sendRedirect(url);
        }
        else {
            response.sendRedirect("/login");
        }

    }
}

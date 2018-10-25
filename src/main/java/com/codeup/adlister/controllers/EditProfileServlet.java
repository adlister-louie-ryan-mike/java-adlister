package com.codeup.adlister.controllers;

import com.codeup.adlister.dao.DaoFactory;
import com.codeup.adlister.models.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;


@WebServlet(name = "controllers.EditProfileServlet", urlPatterns = "/profile/edit/")
public class EditProfileServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {

            //Gather information from the url to display to the sticky forms on the register page
            // if there were errors from a previous attempt.

//            String usernameError = request.getParameter("usernameError");
//            String usernameInput = request.getParameter("username");
            String emailInput = request.getParameter("email");
            String passwordErrors = request.getParameter("password");
            System.out.println(passwordErrors);
            String emailError = request.getParameter("emailTest");
            request.setAttribute("emailInput", emailInput);
//            request.setAttribute("usernameInput", usernameInput);


//            if (usernameError.equals("usernameError")) {
//                String usernameErrorMessage = "Username is already taken. Input a different username.";
//                request.setAttribute("usernameError", usernameErrorMessage);
//
//
//            }
            if (!passwordErrors.isEmpty()) {
                String passwordErrorMessage = "Invalid password! Ensure your password also contains the following:";
                request.setAttribute("passwordErrorMessage", passwordErrorMessage);
                request.setAttribute("passwordErrors", passwordErrors);

            }

            if (emailError.equals("false")) {
                String emailErrorMessage = "Invalid email! Ensure your email contains an '@' and '.com'!";
                request.setAttribute("emailError", emailErrorMessage);
            }
        } catch (Exception e) {
            System.out.println("No parameter found");
        }
        Long userId = Long.parseLong(request.getParameter("userid"));
        System.out.println(userId);
        User user = DaoFactory.getUsersDao().findUserById(userId);
        request.setAttribute("user", user);
        System.out.println(user.getId() + user.getEmail());
//        System.out.println(ad.getTitle());
        request.getRequestDispatcher("/WEB-INF/editprofile.jsp").forward(request, response);

    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Long userId = Long.parseLong(request.getParameter("userid"));
        System.out.println(userId);
        User updatedUser = DaoFactory.getUsersDao().findUserById(userId);
//        String oldUserName = updatedUser.getUsername();

        //Get all the parameters from the form inputs on the jsp.
//        String newUsername = request.getParameter("username");
        String newEmail = request.getParameter("email");
        String newPassword = request.getParameter("password");
        String newConfirmPassword = request.getParameter("confirm_password");


        //Update the user object from the form inputs and concatenate the email to a url string for future processing.
        updatedUser.setEmail(newEmail);
        updatedUser.setPassword(request.getParameter("password"));
        String url = "/profile/edit/?&userid=" + userId;
        url += "&email=" + newEmail;


        //Create a list of errors for the password. Concatenate the errors in this list to the url for processing on the jsp.
        List<String> errorList = new ArrayList<String>();
        List<String> valid = DaoFactory.getUsersDao().isValid(newPassword, newConfirmPassword, errorList);
        String passwordErrors = "";
        if (!valid.isEmpty()) {
            for (String error : errorList) {
                passwordErrors += error;
            }
            url += "&password=" + passwordErrors;
        }


        //Update the URL with a "false" for a bad email input and set the badEmail variable to 'true'
        boolean badEmail = false;
        if (!newEmail.contains("@") || !newEmail.contains(".com")) {
            url += "&emailTest=false";
            badEmail = true;
        }

        //Test if the username is already taken, the error list for the password contains an error,
        // or if the email is incorrect. If either of these conditions is 'true', then send to the new URL
        if (valid.isEmpty() && !badEmail) {
            // create and save a new user if the password error list is empty and the email conditions are correct
            Long editedUser = DaoFactory.getUsersDao().editUser(updatedUser);
            System.out.println(editedUser);
            request.getSession().setAttribute("user", updatedUser);
            response.sendRedirect("/profile");
        } else {
            //Redirect to the url for the register page is the password or email are incorrect
//            url += "&usernameError=null";
            response.sendRedirect( url);
        }
    }
}
package com.codeup.adlister.controllers;

import com.codeup.adlister.dao.DaoFactory;
import com.codeup.adlister.models.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;


@WebServlet(name = "controllers.EditProfileServlet", urlPatterns = "/profile/edit/")
public class EditProfileServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        Long userId = Long.parseLong(request.getParameter("userid"));
        System.out.println(userId);
        User user = DaoFactory.getUsersDao().findUserById(userId);
        request.setAttribute("user", user);
        System.out.println(user.getId()+ user.getUsername() + user.getEmail());
//        System.out.println(ad.getTitle());
        request.getRequestDispatcher("/WEB-INF/editprofile.jsp").forward(request, response);

    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Long userId = Long.parseLong(request.getParameter("userid"));
        System.out.println(userId);
        User updatedUser = DaoFactory.getUsersDao().findUserById(userId);
        String newUsername = request.getParameter("username");
        String newEmail = request.getParameter("email");
        String newPassword = request.getParameter("password");
        String newConfirmPassword = request.getParameter("confirm_password");

        boolean inputCheck = newUsername.isEmpty()
                || newEmail.isEmpty()
                || newPassword.isEmpty()
                || (! newPassword.equals(newConfirmPassword));

        if (!inputCheck) {
            updatedUser.setUsername(newUsername);
            updatedUser.setEmail(newEmail);
            updatedUser.setPassword(request.getParameter("password"));
            request.getSession().setAttribute("user", updatedUser);
            DaoFactory.getUsersDao().editUser(updatedUser);
            response.sendRedirect("/profile");
        } else {
            String redirect = "/profile/edit/?userid="+ updatedUser.getId();
            response.sendRedirect(redirect);
        }
    }
}

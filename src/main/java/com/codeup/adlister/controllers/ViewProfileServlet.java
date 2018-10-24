package com.codeup.adlister.controllers;

import com.codeup.adlister.dao.DaoFactory;
import com.codeup.adlister.models.Ad;
import com.codeup.adlister.models.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "controllers.ViewProfileServlet", urlPatterns = "/profile")
public class ViewProfileServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        if (request.getSession().getAttribute("user") == null) {
            request.getSession().setAttribute("logged_in", false);
            response.sendRedirect("/login");
            return;
        } else {

            request.getSession().setAttribute("logged_in", true);
            User user = (User) request.getSession().getAttribute("user");
            Long userid = user.getId();
            request.setAttribute("ads", DaoFactory.getAdsDao().searchByAdContainsID(userid));
//        System.out.println(DaoFactory.getAdsDao().searchByAdContainsID(userid));

            request.getRequestDispatcher("/WEB-INF/profile.jsp").forward(request, response);

        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Long adId = Long.parseLong(request.getParameter("ad.id"));
        Ad deletedAd = DaoFactory.getAdsDao().getFromID(adId);
        DaoFactory.getAdsDao().deleteAd(deletedAd);
        response.sendRedirect("/profile");
    }
}

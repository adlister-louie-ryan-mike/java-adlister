package com.codeup.adlister.controllers;

import com.codeup.adlister.dao.DaoFactory;
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
            response.sendRedirect("/login");
            return;
        }
        User user = (User) request.getSession().getAttribute("user");
//        System.out.println( user.getId());
//        System.out.println( user.getPassword());
//        System.out.println( user.getEmail());


//        String param1 = request.getParameter(“id”);
//        Long ad_id = Long.parseLong(param1);
//        Ad ad = DaoFactory.getAdsDao().getFromID(ad_id);
//        request.setAttribute(“ad”, ad);
//        System.out.println(ad.getTitle());
        Long userid =  user.getId();
        request.setAttribute("ads", DaoFactory.getAdsDao().searchByAdContainsID(userid));
        System.out.println(DaoFactory.getAdsDao().searchByAdContainsID(userid));

        request.getRequestDispatcher("/WEB-INF/profile.jsp").forward(request, response);

    }
}

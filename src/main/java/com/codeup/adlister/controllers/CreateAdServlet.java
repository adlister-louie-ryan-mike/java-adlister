package com.codeup.adlister.controllers;

import com.codeup.adlister.dao.DaoFactory;
import com.codeup.adlister.models.Ad;
import com.codeup.adlister.models.AdCategory;
import com.codeup.adlister.models.User;
import com.codeup.adlister.models.Category;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "controllers.CreateAdServlet", urlPatterns = "/ads/create")
public class CreateAdServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        if (request.getSession().getAttribute("user") == null) {
            response.sendRedirect("/login");
            return;
        }
        request.setAttribute("categories", DaoFactory.getCategoriesDao().all());
        request.getRequestDispatcher("/WEB-INF/ads/create.jsp")
            .forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
        // get user info from session, user inputs from parameters
        User user = (User) request.getSession().getAttribute("user");
        Long userId = user.getId();
        String adtitle = request.getParameter("title");
        String addesc = request.getParameter("description");
        Long adCategory = Long.parseLong(request.getParameter("category"));

        // create ad & id, get new ad_id //
        Ad ad = new Ad(userId, adtitle, addesc);

        Long newAdId = DaoFactory.getAdsDao().insert(ad);

        System.out.println(newAdId);

        System.out.println(newAdId +" "+ ad.getTitle());

        // create AdCategory table entry
        AdCategory newEntry = new AdCategory(newAdId, adCategory);
        DaoFactory.getAdCategoriesDao().insert(newEntry);
        response.sendRedirect("/ads");


    }
}

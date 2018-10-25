package com.codeup.adlister.controllers;

import com.codeup.adlister.dao.DaoFactory;
import com.codeup.adlister.models.Ad;
import com.codeup.adlister.models.AdCategory;
import com.codeup.adlister.models.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "controllers.EditAdServlet", urlPatterns = "/ads/edit/")
public class EditAdServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String param1 = request.getParameter("id");
        Long ad_id = Long.parseLong(param1);
        Ad ad = DaoFactory.getAdsDao().getFromID(ad_id);
        request.setAttribute("ad", ad);
        request.setAttribute("categories", DaoFactory.getCategoriesDao().all());
        System.out.println(ad.getId()+ ad.getTitle() + ad.getDescription());
//        System.out.println(ad.getTitle());
        request.getRequestDispatcher("/WEB-INF/ads/edit.jsp").forward(request, response);

    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String newTitle = request.getParameter("title");
        String newDesc = request.getParameter("description");
        Long adId = Long.parseLong(request.getParameter("ad.id"));
        User user = (User) request.getSession().getAttribute("user");
        Long userId = user.getId();
        Long adCategory = Long.parseLong(request.getParameter("category"));

        Ad updatedAd = DaoFactory.getAdsDao().getFromID(adId);
        updatedAd.setTitle(newTitle);
        updatedAd.setDescription(newDesc);
        System.out.println(updatedAd);

        // Create AdCategory table entry
        AdCategory updatedAdCategory = new AdCategory(adId, adCategory);
        DaoFactory.getAdCategoriesDao().editAdCategory(updatedAdCategory);
        System.out.println(updatedAdCategory);

        // edit ad with information from form POST
        DaoFactory.getAdsDao().editAd(updatedAd);
        response.sendRedirect("/profile");

    }
}

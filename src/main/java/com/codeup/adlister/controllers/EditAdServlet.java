package com.codeup.adlister.controllers;

import com.codeup.adlister.dao.DaoFactory;
import com.codeup.adlister.models.Ad;

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
        System.out.println(ad.getId()+ ad.getTitle() + ad.getDescription());
//        System.out.println(ad.getTitle());
        request.getRequestDispatcher("/WEB-INF/ads/edit.jsp").forward(request, response);

    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String newTitle = request.getParameter("title");
        String newDesc = request.getParameter("description");
        Long adId = Long.parseLong(request.getParameter("ad.id"));
        Ad updatedAd = DaoFactory.getAdsDao().getFromID(adId);
        updatedAd.setTitle(newTitle);
        updatedAd.setDescription(newDesc);
        System.out.println(updatedAd.getTitle());
        DaoFactory.getAdsDao().editAd(updatedAd);
        response.sendRedirect("/profile");

    }
}

package com.codeup.adlister.controllers;

import com.codeup.adlister.dao.DaoFactory;
import com.codeup.adlister.models.Ad;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "controllers.DisplaySingleAdServlet", urlPatterns = "/ads/")
public class DisplaySingleAdServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String param1 = request.getParameter("id");
        Long ad_id = Long.parseLong(param1);
        Ad ad = DaoFactory.getAdsDao().getFromID(ad_id);
        request.setAttribute("ad", ad);
        System.out.println(ad.getTitle());
        request.getRequestDispatcher("/WEB-INF/ads/ad.jsp").forward(request, response);

        String param2 = request.getParameter("seller");



    }
}
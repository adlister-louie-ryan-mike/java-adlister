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
        request.setAttribute("ads", DaoFactory.getAdsDao().all());
        String param1 = request.getParameter("id");
        Long ad_id = Long.parseLong(param1);
        Ad ad = DaoFactory.getAdsDao().getFromID(ad_id);
        System.out.println(param1);
        request.getRequestDispatcher("/WEB-INF/ads/ad.jsp").forward(request, response);
    }
}
package com.codeup.adlister.controllers;

import com.codeup.adlister.dao.DaoFactory;
import com.codeup.adlister.models.Ad;
import com.codeup.adlister.models.User;
import com.codeup.adlister.util.Password;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

//  OLD SERVLET
//@WebServlet(name = "controllers.SearchServlet", urlPatterns = "/ads/search")
//public class SearchServlet extends HttpServlet {
//    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//        String searchParam = request.getParameter("searchBar");
//        Ad ad = DaoFactory.getAdsDao().searchByAdContains(searchParam);
//        request.setAttribute("ad", ad);
//        System.out.println(ad.getTitle());
//        request.getRequestDispatcher("/WEB-INF/ads/search.jsp").forward(request, response);
//    }
//}

@WebServlet(name = "controllers.SearchServlet", urlPatterns = "/ads/search")
public class SearchServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("/WEB-INF/ads/search.jsp").forward(request, response);
        String searchParam = request.getParameter("searchBar");
        request.setAttribute("ads", DaoFactory.getAdsDao().all());
        List<Ad> ads = DaoFactory.getAdsDao().searchByAdContains(searchParam);
        System.out.println("12" + ads);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        String searchParam = request.getParameter("searchBar");
        request.setAttribute("ads", DaoFactory.getAdsDao().searchByAdContains(searchParam));
        request.getRequestDispatcher("/WEB-INF/ads/search.jsp").forward(request, response);
    }
}



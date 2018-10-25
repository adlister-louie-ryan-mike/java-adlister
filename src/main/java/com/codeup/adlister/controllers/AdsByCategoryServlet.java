package com.codeup.adlister.controllers;

import com.codeup.adlister.dao.DaoFactory;
import com.codeup.adlister.models.Ad;
import com.codeup.adlister.models.Category;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "controllers.AdsByCategoryServlet", urlPatterns = "/ads/byCategory")
public class AdsByCategoryServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Long searchedCategory = Long.parseLong(request.getParameter("category"));

        request.setAttribute("ads", DaoFactory.getAdsDao().searchByAdCategory(searchedCategory));
        request.getRequestDispatcher("/WEB-INF/ads/category.jsp").forward(request, response);

    }
}
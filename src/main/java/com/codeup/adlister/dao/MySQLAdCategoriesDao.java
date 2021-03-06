package com.codeup.adlister.dao;
import com.codeup.adlister.models.Ad;
import com.codeup.adlister.models.AdCategory;
import com.mysql.cj.jdbc.Driver;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class MySQLAdCategoriesDao implements AdCategories {

    private Connection connection = null;

    public MySQLAdCategoriesDao(Config config) {
        try {
            DriverManager.registerDriver(new Driver());
            connection = DriverManager.getConnection(
                    config.getUrl(),
                    config.getUsername(),
                    config.getPassword()
            );
        } catch (SQLException e) {
            throw new RuntimeException("Error connecting to the database!", e);
        }
    }

    public Long insert(AdCategory adCategory) {
        String query = "INSERT INTO ads_categories(ad_id, category_id) VALUES (?, ?)";
        try {
            PreparedStatement stmt = connection.prepareStatement(query, Statement.RETURN_GENERATED_KEYS);
            System.out.println("inserting ad.....");
            stmt.setLong(1, adCategory.getAdId());
            stmt.setLong(2, adCategory.getCategoryId());
            stmt.executeUpdate();
            ResultSet rs = stmt.getGeneratedKeys();
            rs.next();
            return rs.getLong(1);
        } catch (SQLException e) {
            return Long.valueOf(0);
        }
    }

        @Override
    public void editAdCategory(AdCategory adCategory) {
            try {
                String insertQuery = "UPDATE ads_categories SET category_id = ? WHERE ad_id = ?";
                PreparedStatement stmt = connection.prepareStatement(insertQuery, Statement.RETURN_GENERATED_KEYS);
                stmt.setLong(1, adCategory.getCategoryId());
                stmt.setLong(2, adCategory.getAdId());

                stmt.executeUpdate();
//            ResultSet rs = stmt.getGeneratedKeys();
//            rs.next();
//            return rs.getLong(1);
            } catch (SQLException e) {
                throw new RuntimeException("Error updating ad category.", e);
            }
    }

    @Override
    public void deleteAdCategoryEntry(Long adId) {
        try {
            String insertQuery = "DELETE FROM ads_categories WHERE ad_id = ?";
            PreparedStatement stmt = connection.prepareStatement(insertQuery, Statement.RETURN_GENERATED_KEYS);
            stmt.setLong(1, adId);
            stmt.executeUpdate();
        } catch (SQLException e) {
            throw new RuntimeException("Error deleting adcategory.", e);
        }
    }

}
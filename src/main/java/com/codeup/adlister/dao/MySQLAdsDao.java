package com.codeup.adlister.dao;

import com.codeup.adlister.models.Ad;
import com.codeup.adlister.models.User;
import com.mysql.cj.jdbc.Driver;

import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class MySQLAdsDao implements Ads {
    private Connection connection = null;

    public MySQLAdsDao(Config config) {
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

    @Override
    public List<Ad> all() {
        PreparedStatement stmt = null;
        try {
            stmt = connection.prepareStatement("SELECT * FROM ads");
            ResultSet rs = stmt.executeQuery();
            return createAdsFromResults(rs);
        } catch (SQLException e) {
            throw new RuntimeException("Error retrieving all ads.", e);
        }
    }

    @Override
    public Long insert(Ad ad) {
        try {
            String insertQuery = "INSERT INTO ads(user_id, title, description) VALUES (?, ?, ?)";
            PreparedStatement stmt = connection.prepareStatement(insertQuery, Statement.RETURN_GENERATED_KEYS);
            stmt.setLong(1, ad.getUserId());
            stmt.setString(2, ad.getTitle());
            stmt.setString(3, ad.getDescription());
            stmt.executeUpdate();
            ResultSet rs = stmt.getGeneratedKeys();
            rs.next();
            return rs.getLong(1);
        } catch (SQLException e) {
            throw new RuntimeException("Error creating a new ad.", e);
        }
    }

    @Override
    public void editAd(Ad ad) {
        try {
            String insertQuery = "UPDATE ads SET title = ?, description = ? WHERE ad_id = " + ad.getId();
            PreparedStatement stmt = connection.prepareStatement(insertQuery, Statement.RETURN_GENERATED_KEYS);
            stmt.setString(1, ad.getTitle());
            stmt.setString(2, ad.getDescription());
            stmt.executeUpdate();
//            ResultSet rs = stmt.getGeneratedKeys();
//            rs.next();
//            return rs.getLong(1);
        } catch (SQLException e) {
            throw new RuntimeException("Error creating a new ad.", e);
        }
    }

    @Override
    public void deleteAd(Ad ad) {
        try {
            String insertQuery = "DELETE FROM ads WHERE ad_id = " + ad.getId();
            PreparedStatement stmt = connection.prepareStatement(insertQuery, Statement.RETURN_GENERATED_KEYS);
            stmt.executeUpdate();
        } catch (SQLException e) {
            throw new RuntimeException("Error deleting ad.", e);
        }
    }

    private Ad extractAd(ResultSet rs) throws SQLException {
        return new Ad(
            rs.getLong("ad_id"),
            rs.getLong("user_id"),
            rs.getString("title"),
            rs.getString("description")
        );
    }

    private List<Ad> createAdsFromResults(ResultSet rs) throws SQLException {
        List<Ad> ads = new ArrayList<>();
        while (rs.next()) {
            ads.add(extractAd(rs));
        }
        return ads;
    }


    public Ad getFromID(Long id) {
        try {
            PreparedStatement stmt = connection.prepareStatement("SELECT * FROM ads WHERE ad_id = ?");
            stmt.setLong(1, id);
            ResultSet rs = stmt.executeQuery();
            if (rs.next())
                System.out.println(extractAd(rs));
                return extractAd(rs);
        }catch(SQLException e){
            throw new RuntimeException("id not found", e);
        }
    }


    @Override
    public List<Ad> searchByAdContains(String search) {

        String searchTermWithWildcards = "%" + search + "%";
        String query = "SELECT * FROM ads WHERE ads.title LIKE ? OR ads.description LIKE ? ";
        try {
            PreparedStatement stmt = connection.prepareStatement(query);
            stmt.setString(1, searchTermWithWildcards);
            stmt.setString(2, searchTermWithWildcards);
           List<Ad> ads = createAdsFromResults(stmt.executeQuery());
            System.out.println(ads);
           return ads;
        } catch (SQLException e) {
            e.printStackTrace();
            throw new RuntimeException("Error finding your results", e);
        }
    }
    @Override
    public List<Ad> searchByAdContainsID(Long search) {
        try {
            PreparedStatement stmt = connection.prepareStatement("SELECT * FROM ads WHERE ads.user_id =" + search);
            List<Ad> ads = createAdsFromResults(stmt.executeQuery());
            System.out.println(ads);
            return ads;
        } catch (SQLException e) {
            e.printStackTrace();
            throw new RuntimeException("Error finding your results", e);
        }
    }

    @Override
    public List<Ad> searchByAdCategory(Long search) {
        try {
            PreparedStatement stmt = connection.prepareStatement("SELECT * FROM ads as a JOIN ads_categories as ac ON a.ad_id = ac.ad_id WHERE ac.category_id =" + search);
            List<Ad> ads = createAdsFromResults(stmt.executeQuery());
            System.out.println(ads);
            return ads;
        } catch (SQLException e) {
            e.printStackTrace();
            throw new RuntimeException("Error finding your results", e);
        }
    }
}

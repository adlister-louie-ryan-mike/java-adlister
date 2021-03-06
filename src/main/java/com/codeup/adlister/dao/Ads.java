package com.codeup.adlister.dao;

import com.codeup.adlister.models.Ad;

import java.util.List;

public interface Ads {
    // get a list of all the ads
    List<Ad> all();
    // insert a new ad and return the new ad's id
    Long insert(Ad ad);

    Ad getFromID(Long id);

    List<Ad> searchByAdContains(String search);

    List<Ad> searchByAdContainsID(Long search);

    public List<Ad> searchByAdCategory(Long search);

    void editAd(Ad ad);

    void deleteAd(Ad ad);
}

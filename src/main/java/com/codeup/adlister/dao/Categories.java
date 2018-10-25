package com.codeup.adlister.dao;
import com.codeup.adlister.models.Category;


import java.util.List;

public interface Categories {
    // get a list of all the categories
    List<Category> all();
    // insert a new category and return the new category id
    Long insert(Category category);
    //  find by category description method
    Category findByCategoryDesc(String categoryDesc);
    //find by category Id
    Category findByCategoryId(Long categoryId);
}
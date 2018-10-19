package com.codeup.adlister.models;

public class Category {

    private long categoryId;
    private String categoryDesc;

    // #### CONSTRUCTORS #### //
    public Category() {}

    public Category(String categoryDesc) {
        this.categoryDesc = categoryDesc;
    }

    public Category(long id, String categoryDesc) {
        this.categoryId = id;
        this.categoryDesc = categoryDesc;
    }
    
    // GETTERS & SETTERS //

    public long getCategoryId() {
        return categoryId;
    }

    public String getCategoryDesc() {
        return categoryDesc;
    }

    public void setCategoryId(long categoryId) {
        this.categoryId = categoryId;
    }

    public void setCategoryDesc(String categoryDesc) {
        this.categoryDesc = categoryDesc;
    }


}

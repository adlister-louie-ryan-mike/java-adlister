drop database if exists ad_lister_db;
create database if not exists ad_lister_db;
use ad_lister_db;

DROP TABLE IF EXISTS users;
CREATE TABLE users (
    user_id INT UNSIGNED NOT NULL AUTO_INCREMENT,
    username VARCHAR(240) NOT NULL UNIQUE,
    email VARCHAR(240) NOT NULL,
    password VARCHAR(255) NOT NULL,
    PRIMARY KEY (user_id)
);

DROP TABLE IF EXISTS ads;
CREATE TABLE ads (
    ad_id INT UNSIGNED NOT NULL AUTO_INCREMENT,
    user_id INT UNSIGNED NOT NULL,
    title VARCHAR(240) NOT NULL,
    description TEXT NOT NULL,
    PRIMARY KEY (ad_id),
    FOREIGN KEY (user_id) REFERENCES users(user_id)
        ON DELETE CASCADE
);

DROP TABLE IF EXISTS categories;
CREATE TABLE IF NOT EXISTS categories (
    category_id INT UNSIGNED NOT NULL AUTO_INCREMENT,
    category_desc VARCHAR(50),
    PRIMARY KEY (category_id)
);


DROP TABLE IF EXISTS ads_categories;
CREATE TABLE IF NOT EXISTS ads_categories (
    ad_id INT UNSIGNED NOT NULL,
    category_id INT UNSIGNED NOT NULL,
    FOREIGN KEY (ad_id) REFERENCES ads (ad_id),
    FOREIGN KEY (category_id) REFERENCES categories (category_id)
);

INSERT INTO categories (category_desc) values

('Jobs'),
('Cars'),
('Toys'),
('Games'),
('Services');



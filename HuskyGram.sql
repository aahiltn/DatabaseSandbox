DROP DATABASE IF EXISTS HuskyGram;
CREATE DATABASE IF NOT EXISTS HuskyGram;

USE HuskyGram;

DROP TABLE IF EXISTS users;
CREATE TABLE IF NOT EXISTS users (
    id INT PRIMARY KEY,
    username VARCHAR(255) UNIQUE NOT NULL,
    created_at DATETIME
);

INSERT INTO users (id, username, created_at)
    VALUES (123, 'aahil', NOW()),
           (456, 'anjola', NOW());

DROP TABLE IF EXISTS follows;
CREATE TABLE IF NOT EXISTS follows (
    follower_id INT UNIQUE NOT NULL,
    followee_id INT UNIQUE NOT NULL,
    created_at DATETIME,
    PRIMARY KEY(follower_id, followee_id),
    FOREIGN KEY (follower_id) REFERENCES users(id)
        ON UPDATE CASCADE
        ON DELETE RESTRICT,
    FOREIGN KEY (followee_id) REFERENCES users(id)
        ON UPDATE CASCADE
        ON DELETE RESTRICT
);

INSERT INTO follows (follower_id, followee_id, created_at)
VALUES (123, 456, NOW()), (456, 123, NOW());

DROP TABLE IF EXISTS photos;
CREATE TABLE IF NOT EXISTS photos (
    id INT PRIMARY KEY,
    image_url VARCHAR(255) NOT NULL,
    user_id INT NOT NULL,
    created_at DATETIME,
    FOREIGN KEY(user_id) REFERENCES users(id)
        ON UPDATE CASCADE
        ON DELETE RESTRICT
);

INSERT INTO photos (id, image_url, user_id, created_at)
VALUES (1, 'aa', 123, NOW()), (2, 'bb', 456, NOW());

DROP TABLE IF EXISTS likes;
CREATE TABLE IF NOT EXISTS likes (
    user_id INT,
    photo_id INT,
    created_at DATETIME,
    PRIMARY KEY(user_id, photo_id),
    FOREIGN KEY(user_id) REFERENCES users(id)
        ON UPDATE CASCADE
        ON DELETE RESTRICT,
    FOREIGN KEY(photo_id) REFERENCES photos(id)
        ON UPDATE CASCADE
        ON DELETE RESTRICT
);

INSERT INTO likes (user_id, photo_id, created_at)
VALUES (123, 1, NOW()), (456, 2, NOW());


DROP TABLE IF EXISTS comments;
CREATE TABLE IF NOT EXISTS comments(
    id           INT PRIMARY KEY,
    comment_text VARCHAR(255) NOT NULL,
    user_id      INT NOT NULL,
    photo_id     INT NOT NULL,
    created_at   DATETIME,
    FOREIGN KEY (user_id) REFERENCES users (id)
        ON UPDATE CASCADE
        ON DELETE RESTRICT
);
INSERT INTO comments(id, comment_text, user_id, photo_id, created_at)
VALUES (11, 'yippee', 123, 1, NOW()), (22, 'wee', 456, 2, NOW());


DROP TABLE IF EXISTS tags;
CREATE TABLE IF NOT EXISTS tags (
    id INT PRIMARY KEY,
    tag_name VARCHAR(255) UNIQUE,
    created_at DATETIME
);
INSERT INTO tags(id, tag_name, created_at)
VALUES (11, '#fontenot', NOW()), (22, '#paolo', NOW());


DROP TABLE IF EXISTS photo_tags;
CREATE TABLE IF NOT EXISTS photo_tags (
    photo_id INT,
    tag_id INT,
    PRIMARY KEY(photo_id, tag_id),
    FOREIGN KEY(photo_id) REFERENCES photos(id)
        ON UPDATE CASCADE
        ON DELETE RESTRICT,
    FOREIGN KEY(photo_id) REFERENCES photos(id)
        ON UPDATE CASCADE
        ON DELETE RESTRICT
);

INSERT INTO photo_tags(photo_id, tag_id)
VALUES (1, 11), (2, 22);

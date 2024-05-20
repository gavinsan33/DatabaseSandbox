DROP DATABASE IF EXISTS HuskyGram;
CREATE DATABASE IF NOT EXISTS HuskyGram;

USE HuskyGram;

CREATE TABLE IF NOT EXISTS users (
    username VARCHAR(255) NOT NULL,
    created_at DATETIME,
    id INT UNIQUE NOT NULL,
    PRIMARY KEY(id)
);

CREATE TABLE IF NOT EXISTS follows (
    created_at DATETIME,
    follower_id INT UNIQUE NOT NULL,
    followee_id INT UNIQUE NOT NULL,
    PRIMARY KEY(follower_id, followee_id),
    FOREIGN KEY (followee_id) REFERENCES users(id),
    FOREIGN KEY (follower_id) REFERENCES users(id)
);

CREATE TABLE IF NOT EXISTS photos (
    image_url VARCHAR(255),
    user_id INT UNIQUE NOT NULL,
    created_at DATETIME,
    id INT UNIQUE NOT NULL,
    PRIMARY KEY(id),
    FOREIGN KEY (id) REFERENCES users(id)
);

DROP table photo_tags;
DROP table tags;

CREATE TABLE IF NOT EXISTS tags (
    tagname VARCHAR(255),
    created_at DATETIME,
    id INT UNIQUE NOT NULL,
    PRIMARY KEY(id)
);

CREATE TABLE IF NOT EXISTS photo_tags (
    photo_id INT NOT NULL,
    tag_id INT UNIQUE NOT NULL,
    FOREIGN KEY (photo_id) REFERENCES photos(id),
    FOREIGN KEY (tag_id) REFERENCES tags(id),
    PRIMARY KEY(photo_id, tag_id)
);

CREATE TABLE IF NOT EXISTS comments (
    comment_text VARCHAR(255),
    user_id INT,
    photo_id INT,
    created_at DATETIME,
    id INT,
    PRIMARY KEY(id),
    FOREIGN KEY (photo_id) REFERENCES photos(id),
    FOREIGN KEY (user_id) REFERENCES users(id)
);

CREATE TABLE IF NOT EXISTS likes (
    created_at DATETIME,
    user_id INT UNIQUE NOT NULL,
    photo_id int,
    PRIMARY KEY(user_id, photo_id),
    FOREIGN KEY (user_id) REFERENCES users(id),
    FOREIGN KEY (photo_id) REFERENCES photos(id)
);

INSERT INTO users (username, created_at, id) VALUES ('john_doe', '2022-01-01 10:00:00', 1), ('jane_smith', '2022-01-02 15:30:00', 2);

INSERT INTO follows (created_at, follower_id, followee_id) VALUES ('2022-01-03 09:45:00', 1, 2), ('2022-01-04 14:20:00', 2, 1);

INSERT INTO photos (image_url, user_id, created_at, id) VALUES ('https://example.com/photo1.jpg', 1, '2022-01-05 11:10:00', 1), ('https://example.com/photo2.jpg', 2, '2022-01-06 16:40:00', 2);

INSERT INTO tags (tagname, created_at, id) VALUES ('#NEU', '2022-01-07 08:30:00', 1), ('#BU', '2022-01-08 13:15:00', 2);

INSERT INTO photo_tags (photo_id, tag_id) VALUES (1, 1), (1, 2);

INSERT INTO comments (comment_text, user_id, photo_id, created_at, id) VALUES ('Great photo!', 1, 1, '2022-01-09 07:20:00', 1), ('Beautiful!', 2, 2, '2022-01-10 12:05:00', 2);

INSERT INTO likes (created_at, user_id, photo_id) VALUES ('2022-01-11 06:50:00', 1, 2), ('2022-01-12 11:25:00', 2, 1);

INSERT INTO tags (tagname, created_at, id) VALUES ('#NEU', '2022-01-07 08:30:00', 3), ('#hi', '2022-01-08 13:15:00', 4);
INSERT INTO photo_tags (photo_id, tag_id) VALUES (2, 3), (2, 4);

INSERT INTO comments (comment_text, user_id, photo_id, created_at, id) VALUES ('asdknkacollegenxkjnx!', 1, 1, '2022-01-09 07:20:00', 3);

INSERT INTO users (username, created_at, id) VALUES ('jennifer_wong', '2022-01-13 09:00:00', 3);

INSERT INTO users (username, created_at, id) VALUES ('alice_smith', '2022-01-18 09:30:00', 6);

INSERT INTO photos (image_url, user_id, created_at, id) VALUES ('https://example.com/photo4.jpg', 6, '2022-01-19 14:40:00', 5);

INSERT INTO likes (created_at, user_id, photo_id) VALUES ('2022-01-20 11:50:00', 1, 5), ('2022-01-21 16:10:00', 2, 5);
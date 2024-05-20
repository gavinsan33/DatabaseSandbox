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
    follower_id INT,
    followee_id INT,
    PRIMARY KEY(follower_id, followee_id),
    FOREIGN KEY (followee_id) REFERENCES users(id),
    FOREIGN KEY (follower_id) REFERENCES users(id)
);

CREATE TABLE IF NOT EXISTS photos (
    image_url VARCHAR(255),
    user_id INT,
    created_at DATETIME,
    id INT UNIQUE NOT NULL,
    PRIMARY KEY(id),
    FOREIGN KEY (user_id) REFERENCES users(id)
);

CREATE TABLE IF NOT EXISTS tags (
    tagname VARCHAR(255),
    created_at DATETIME,
    id INT UNIQUE NOT NULL,
    PRIMARY KEY(id)
);

CREATE TABLE IF NOT EXISTS photo_tags (
    photo_id INT,
    tag_id INT,
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
    user_id INT NOT NULL,
    photo_id int,
    PRIMARY KEY(user_id, photo_id),
    FOREIGN KEY (user_id) REFERENCES users(id),
    FOREIGN KEY (photo_id) REFERENCES photos(id)
);

-- Insert data into users
INSERT INTO users (username, created_at, id) VALUES
('user1', '2024-01-01 10:00:00', 1),
('user2', '2024-01-02 11:00:00', 2),
('user3', '2024-01-03 12:00:00', 3),
('user4', '2024-01-04 13:00:00', 4),
('user5', '2024-01-05 14:00:00', 5);

-- Insert data into follows
INSERT INTO follows (created_at, follower_id, followee_id) VALUES
('2024-01-01 10:00:00', 1, 2),
('2024-01-01 10:00:00', 2, 1),
('2024-01-01 10:00:00', 1, 3),
('2024-01-01 10:00:00', 3, 1),
('2024-01-01 10:00:00', 2, 3),
('2024-01-01 10:00:00', 3, 2),
('2024-01-01 10:00:00', 4, 5);

-- Insert data into photos
INSERT INTO photos (image_url, user_id, created_at, id) VALUES
('photo1_url', 1, '2024-01-01 10:00:00', 1),
('photo2_url', 1, '2024-01-01 11:00:00', 2),
('photo3_url', 2, '2024-01-02 10:00:00', 3),
('photo4_url', 2, '2024-01-02 11:00:00', 4),
('photo5_url', 3, '2024-01-03 10:00:00', 5),
('photo6_url', 4, '2024-01-04 10:00:00', 6);

-- Insert data into tags
INSERT INTO tags (tagname, created_at, id) VALUES
('nature', '2024-01-01 10:00:00', 1),
('animal', '2024-01-01 10:30:00', 2),
('travel', '2024-01-01 11:00:00', 3),
('food', '2024-01-01 11:30:00', 4);

-- Insert data into photo_tags
INSERT INTO photo_tags (photo_id, tag_id) VALUES
(1, 1),
(1, 2),
(2, 3),
(3, 1),
(3, 4),
(4, 2),
(5, 3),
(6, 4);


-- Insert data into likes
INSERT INTO likes (created_at, user_id, photo_id) VALUES
('2024-01-01 10:00:00', 1, 1),
('2024-01-01 10:05:00', 2, 1),
('2024-01-01 11:00:00', 1, 2),
('2024-01-02 10:00:00', 3, 3),
('2024-01-02 11:00:00', 4, 4),
('2024-01-03 10:00:00', 5, 5),
('2024-01-04 10:00:00', 1, 6),
('2024-01-04 10:00:00', 2, 6),
('2024-01-04 10:00:00', 3, 6);

-- Insert data into comments
INSERT INTO comments (comment_text, user_id, photo_id, created_at, id) VALUES
('Nice photo!', 1, 1, '2024-01-01 10:30:00', 1),
('Amazing shot!', 2, 2, '2024-01-01 11:30:00', 2),
('Beautiful!', 3, 3, '2024-01-02 10:30:00', 3),
('Great capture!', 4, 4, '2024-01-02 11:30:00', 4),
('Wonderful!', 5, 5, '2024-01-03 10:30:00', 5),
('Stunning!', 1, 6, '2024-01-04 10:30:00', 6);



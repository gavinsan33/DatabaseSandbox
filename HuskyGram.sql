USE HuskyGram;

SELECT photo_id, image_url, COUNT(comment_text) AS comment_count
FROM photos p LEFT OUTER JOIN comments c ON p.id = c.photo_id
GROUP BY photo_id, p.created_at, p.image_url
ORDER BY p.created_at DESC;

SELECT DISTINCT username
FROM users u JOIN photos p ON u.id = p.user_id
JOIN comments c ON p.id = c.photo_id
LEFT OUTER JOIN likes l ON p.id = l.photo_id
WHERE l.created_at IS NULL
ORDER BY username;

SELECT COUNT(*) AS num_photos FROM (
SELECT pt1.photo_id
FROM photo_tags pt1 JOIN tags t1 ON pt1.tag_id = t1.id
WHERE t1.tagname = '#NEU'
INTERSECT
SELECT pt2.photo_id
FROM photo_tags pt2 JOIN tags t2 ON pt2.tag_id = t2.id
WHERE t2.tagname = '#BU') AS t;

SELECT username, comment_text
FROM comments c JOIN users u on c.user_id = u.id
WHERE comment_text LIKE '%college%'
ORDER BY c.created_at;

SELECT username, u.created_at AS joined_date
FROM users u LEFT OUTER JOIN photos p ON u.id = p.user_id
WHERE p.id IS NULL
ORDER BY username;

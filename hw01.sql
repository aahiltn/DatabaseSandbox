
# Question 4
SELECT p.id, p.image_url, COUNT(c.id) as num_comments
FROM photos p LEFT OUTER JOIN comments c
ON p.id = c.photo_id
GROUP BY p.id, p.created_at
ORDER BY p.created_at DESC;

# Question 5
SELECT DISTINCT u.username
FROM users u
      JOIN photos p ON u.id = p.user_id
JOIN comments c ON p.id = c.photo_id
LEFT OUTER JOIN likes l ON p.id = l.photo_id
WHERE l.user_id IS NULL
ORDER BY u.username ASC;

# Question 6
SELECT COUNT(*) AS 'num_photos'
FROM (SELECT DISTINCT pt.photo_id
      FROM photo_tags pt
               JOIN tags t on pt.tag_id = t.id
      WHERE t.tag_name = '#NEU'
      INTERSECT
      SELECT DISTINCT pt.photo_id
      FROM photo_tags pt
               JOIN tags t on pt.tag_id = t.id
      WHERE t.tag_name = '#BU') as b;

# Question 7
SELECT u.username, c.comment_text
FROM comments c JOIN users u ON u.id = c.user_id
WHERE LOWER(c.comment_text) LIKE 'college%'
ORDER BY c.created_at;


# Question 8
SELECT u.username as ‘Username’ , u.created_at as 'Join Date'
FROM users u LEFT OUTER JOIN photos p ON u.id = p.user_id
WHERE p.user_id IS NULL
ORDER BY u.username ASC;


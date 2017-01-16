# Number of employees by title
SELECT
  title,
  COUNT(title) AS amount
FROM titles
-- filter expired titles
WHERE to_date > NOW()
GROUP BY title;
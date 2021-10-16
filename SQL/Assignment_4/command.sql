SELECT 	Series.Series_id, title,rating
FROM			Series

INNER JOIN 		Reviews	
ON		Reviews.Series_id=Series.Series_id
-- Series_id = 1
WHERE		(Series.Series_id > 0 ) AND (Series.Series_id < 4) -- WHERE (1 > 0) AND (1 < 4) <=> A AND B -> WHERE true AND true -> true
ORDER BY	title;


SELECT 	title,avg(rating)	avg_rating
FROM			Series
INNER JOIN 		Reviews	
ON		Reviews.Series_id=Series.Series_id
GROUP BY title
ORDER BY	avg_rating;

SELECT			first_name,last_name,rating 
FROM			Reviewers
INNER	JOIN	Reviews
ON				Reviewers.Reviewer_id=Reviews.Reviewer_id
WHERE			reviewers.Reviewer_id > 0 AND reviewers.Reviewer_id < 4
ORDER BY		last_name DESC;

SELECT	* FROM	reviews;
SELECT	* FROM	series;
SELECT	* FROM	reviewers;


SELECT	s.title unreviewed_series	
FROM			series s
LEFT	JOIN	Reviews	r	
ON	r.Series_id=s.Series_id
WHERE r.rating IS NULL
;

SELECT			s.genre,avg(r.rating) avg_rating 
FROM			reviews r
INNER	JOIN	series s
ON				s.Series_id=r.Series_id
GROUP BY		genre
;

SELECT			first_name,last_name,rating 
FROM			Reviewers
INNER	JOIN	Reviews
ON				Reviewers.Reviewer_id=Reviews.Reviewer_id
GROUP BY
-- WHERE			reviewers.Reviewer_id > 0 AND reviewers.Reviewer_id < 4
ORDER BY		last_name DESC;

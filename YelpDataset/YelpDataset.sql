-- Part 1: Yelp Dataset Profiling and Understanding

-- 1. Profile the data by finding the total number of records for each of the tables below:
SELECT COUNT(*) AS RecordCount, 'Attribute' AS TableName FROM Attribute
UNION
SELECT COUNT(*) AS RecordCount, 'Business' AS TableName FROM Business
UNION
SELECT COUNT(*) AS RecordCount, 'Category' AS TableName FROM Category
UNION
SELECT COUNT(*) AS RecordCount, 'Checkin' AS TableName FROM Checkin
UNION
SELECT COUNT(*) AS RecordCount, 'elite_years' AS TableName FROM elite_years
UNION
SELECT COUNT(*) AS RecordCount, 'friend' AS TableName FROM friend
UNION
SELECT COUNT(*) AS RecordCount, 'hours' AS TableName FROM hours
UNION
SELECT COUNT(*) AS RecordCount, 'photo' AS TableName FROM photo
UNION
SELECT COUNT(*) AS RecordCount, 'review' AS TableName FROM review
UNION
SELECT COUNT(*) AS RecordCount, 'tip' AS TableName FROM hours
UNION
SELECT COUNT(*) AS RecordCount, 'user' AS TableName FROM photo;

-- 2. Find the total distinct records by either the foreign key or primary key for each table. If two foreign keys are listed in the table, please specify which foreign key.
SELECT 'Business', COUNT(DISTINCT id) AS RecordCount FROM Business
UNION ALL
SELECT 'Hours', COUNT(DISTINCT business_id) AS RecordCount FROM Hours
UNION ALL
SELECT 'Category', COUNT(DISTINCT business_id) AS RecordCount FROM Category
UNION ALL
SELECT 'Attribute', COUNT(DISTINCT business_id) AS RecordCount FROM Attribute
UNION ALL
SELECT 'Review', COUNT(DISTINCT id) AS RecordCount FROM Review
UNION ALL
SELECT 'Checkin', COUNT(DISTINCT business_id) AS RecordCount FROM Checkin
UNION ALL
SELECT 'Photo', COUNT(DISTINCT id) AS RecordCount FROM Photo
UNION ALL
SELECT 'Tip', COUNT(DISTINCT business_id) AS RecordCount FROM Tip
UNION ALL
SELECT 'User', COUNT(DISTINCT id) AS RecordCount FROM User
UNION ALL
SELECT 'Friend', COUNT(DISTINCT user_id) AS RecordCount FROM Friend
UNION ALL
SELECT 'Elite_years', COUNT(DISTINCT user_id) AS RecordCount FROM Elite_years;

-- 3. Are there any columns with null values in the Users table? Indicate "yes," or "no."
SELECT id, name, review_count, yelping_since, useful, funny, cool, fans, average_stars,
compliment_hot, compliment_more, compliment_profile, compliment_cute, compliment_list, 
compliment_note, compliment_plain, compliment_cool, compliment_funny, compliment_writer, 
compliment_photos

FROM user
WHERE id = NULL OR name = NULL OR review_count = NULL OR yelping_since = NULL OR 
useful = NULL OR funny = NULL OR cool = NULL OR fans= NULL OR average_stars= NULL OR 
compliment_hot= NULL OR compliment_more= NULL OR compliment_profile= NULL OR compliment_cute= NULL 
OR compliment_list= NULL OR compliment_note= NULL OR compliment_plain = NULL OR 
compliment_cool= NULL OR compliment_funny= NULL OR compliment_writer= NULL OR 
compliment_photos= NULL;

-- 4. For each table and column listed below, display the smallest (minimum), largest (maximum), and average (mean) value for the following fields:
SELECT MIN(Stars), MAX(Stars), AVG(Stars) FROM Review
UNION ALL
SELECT MIN(Stars), MAX(Stars), AVG(Stars) FROM Business
UNION ALL
SELECT MIN(Likes), MAX(Likes), AVG(Likes) FROM Tip
UNION ALL
SELECT MIN(Count), MAX(Count), AVG(Count) FROM Checkin
UNION ALL
SELECT MIN(Review_count), MAX(Review_count), AVG(Review_count) FROM User;

-- 5. List the cities with the most reviews in descending order:
SELECT city, COUNT(review_count) AS total
FROM business
GROUP BY city
ORDER BY total DESC;

-- 6. Find the distribution of star ratings to the business in the following cities:
SELECT stars, COUNT(*)
FROM business
WHERE city = 'Avon'
GROUP BY stars;

SELECT stars, COUNT(*)
FROM business
WHERE city = 'Beachwood'
GROUP BY stars;

-- 7. Find the top 3 users based on their total number of reviews:
SELECT name, review_count
FROM user
ORDER BY review_count DESC LIMIT 3;

-- 8. Does posing more reviews correlate with more fans?
SELECT name, review_count, fans
FROM user
ORDER BY review_count DESC;

SELECT name, review_count, fans
FROM user
ORDER BY review_count;

-- 9. Are there more reviews with the word "love" or with the word "hate" in them?
SELECT 'love', COUNT(*)
FROM review
WHERE text LIKE '% love %'
UNION ALL
SELECT 'hate', COUNT(*)
FROM review
WHERE text LIKE '% hate %';

-- 10. Find the top 10 users with the most fans:
SELECT name, fans
FROM user
ORDER BY fans DESC LIMIT 10;


-- Part 2: Inferences and Analysis

-- 1. Pick one city and category of your choice and group the businesses in that city or category by their overall star rating. Compare the businesses with 2-3 stars to the businesses with 4-5 stars and answer the following questions. Include your code.

SELECT b.name, b.city, c.category, b.stars, h.hours, b.review_count, b.postal_code
FROM (business b
INNER JOIN category c ON b.id = c.business_id) 
INNER JOIN hours h ON h.business_id = c.business_id
WHERE b.city = 'Mesa' 
GROUP BY b.stars;

SELECT b.name, b.city, c.category, b.stars, h.hours, b.review_count, b.postal_code
FROM (business b
INNER JOIN category c ON b.id = c.business_id) 
INNER JOIN hours h ON h.business_id = c.business_id
WHERE c.category = 'Restaurants' 
GROUP BY b.stars;

-- i. Do the two groups you chose to analyze have a different distribution of hours?



-- ii. Do the two groups you chose to analyze have a different number of reviews?
         
         
-- iii. Are you able to infer anything from the location data provided between these two groups? Explain.

-- SQL code used for analysis:

		
-- 2. Group business based on the ones that are open and the ones that are closed. What differences can you find between the ones that are still open and the ones that are closed? List at least two differences and the SQL code you used to arrive at your answer.
		
-- i. Difference 1:
         
         
-- ii. Difference 2:
         
         
         
-- SQL code used for analysis:

SELECT COUNT(DISTINCT(id)), AVG(stars), AVG(review_count), SUM(review_count), is_open
FROM business
GROUP BY is_open;
	
	
-- 3. For this last part of your analysis, you are going to choose the type of analysis you want to conduct on the Yelp dataset and are going to prepare the data for analysis.

-- Ideas for analysis include: Parsing out keywords and business attributes for sentiment analysis, clustering businesses to find commonalities or anomalies between them, predicting the overall star rating for a business, predicting the number of fans a user will have, and so on. These are just a few examples to get you started, so feel free to be creative and come up with your own problem you want to solve. Provide answers, in-line, to all of the following:
	
-- i. Indicate the type of analysis you chose to do:
         
         
-- ii. Write 1-2 brief paragraphs on the type of data you will need for your analysis and why you chose that data:
                           
                  
-- iii. Output of your finished dataset:
         
         
-- iv. Provide the SQL code you used to create your final dataset:
        SELECT B.id,
               B.neighborhood,
			   B.city,
			   B.state,
			   B.review_count,
			   B.is_open,
			   MAX(CASE
			   WHEN H.hours LIKE "%monday%" THEN TRIM(H.hours,'%MondayTuesWednesThursFriSatSun|%') 
			   END) AS monday_hours,
			   MAX(CASE
			   WHEN H.hours LIKE "%tuesday%" THEN TRIM(H.hours,'%MondayTuesWednesThursFriSatSun|%') 
			   END) AS tuesday_hours,
			   MAX(CASE
			   WHEN H.hours LIKE "%wednesday%" THEN TRIM(H.hours,'%MondayTuesWednesThursFriSatSun|%') 
			   END) AS wednesday_hours,
			   MAX(CASE
			   WHEN H.hours LIKE "%thursday%" THEN TRIM(H.hours,'%MondayTuesWednesThursFriSatSun|%') 
			   END) AS thursday_hours,
			   MAX(CASE
			   WHEN H.hours LIKE "%friday%" THEN TRIM(H.hours,'%MondayTuesWednesThursFriSatSun|%') 
			   END) AS friday_hours,
			   MAX(CASE
			   WHEN H.hours LIKE "%saturday%" THEN TRIM(H.hours,'%MondayTuesWednesThursFriSatSun|%') 
			   END) AS saturday_hours,
			   MAX(CASE
			   WHEN H.hours LIKE "%sunday%" THEN TRIM(H.hours,'%MondayTuesWednesThursFriSatSun|%') 
			   END) AS sunday_hours,
			   GROUP_CONCAT(DISTINCT(C.category)) AS categories,
			   GROUP_CONCAT(DISTINCT(A.name)) AS attributes,
			   B.stars
		FROM business B
		INNER JOIN hours H
		ON B.id = H.business_id
		INNER JOIN category C
		ON B.id = C.business_id
		INNER JOIN attribute A
		ON B.id = A.business_id
		GROUP BY B.id;
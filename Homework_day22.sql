## Exercise 1 — Tasks
SELECT title FROM movies;
SELECT director FROM movies;
SELECT title, director FROM movies;
SELECT title, year FROM movies;
SELECT * FROM movies;

## Exercise 2 — Tasks
SELECT title
FROM Movies
WHERE id = 6;
SELECT title, year 
FROM movies
WHERE year BETWEEN 2000 AND 2010;SELECT title, year 
FROM movies
WHERE year NOT BETWEEN 2000 AND 2010;
SELECT title, year 
FROM movies
WHERE id IN (1,2,3,4,5);

Exercise 3 — Tasks
SELECT * FROM movies
WHERE title LIKE "Toy Story%";
SELECT * FROM movies
WHERE director LIKE "John Lasseter%";
SELECT * FROM movies
WHERE director NOT LIKE "John Lasseter%";
SELECT * FROM movies
WHERE title LIKE "WALL-%";

# Exercise 4 — Tasks
SELECT DISTINCT director 
FROM movies
ORDER BY director ASC;
SELECT * 
FROM movies
ORDER BY year DESC
LIMIT 4;
SELECT * 
FROM movies
ORDER BY title ASC
LIMIT 5;
SELECT * 
FROM movies
ORDER BY title ASC
LIMIT 5 offset 5;

# SQL Review: Simple SELECT Queries 
# Review 1 — Tasks
SELECT city, population FROM north_american_cities
WHERE country = "Canada";
SELECT city, latitude FROM north_american_cities
WHERE country = "United States"
ORDER BY latitude DESC;
SELECT city, latitude FROM north_american_cities
WHERE longitude < -87.629798
ORDER BY longitude ASC;
SELECT city, population FROM north_american_cities
WHERE country LIKE "Mexico"
ORDER BY population DESC
LIMIT 2;
SELECT city, population FROM north_american_cities
WHERE country LIKE "United States"
ORDER BY population DESC
LIMIT 2 OFFSET 2;

# SQL Lesson 6: Multi-table queries with JOINs
# Exercise 6 — Tasks
SELECT title, Domestic_sales, International_sales
FROM Boxoffice
INNER JOIN Movies 
    ON Boxoffice.movie_id = Movies.id;
SELECT title, Domestic_sales, International_sales
FROM Boxoffice
INNER JOIN Movies 
    ON Boxoffice.movie_id = Movies.id
WHERE International_sales > Domestic_sales;
SELECT title
FROM Movies
INNER JOIN  Boxoffice
    ON Boxoffice.movie_id = Movies.id
ORDER BY rating DESC;

# SQL Lesson 7: OUTER JOINs
# Exercise 7 — Tasks
SELECT DISTINCT building FROM employees;
SELECT * FROM Buildings;
SELECT DISTINCT building_name, role
FROM Buildings
LEFT JOIN employees 
    ON Buildings.building_name = employees.building;

# SQL Lesson 8: A short note on NULLs 
# Exercise 8 — Tasks 
SELECT role, name
FROM employees
WHERE building IS NULL;
# SQL Lesson 9: Queries with expressions
SELECT title, (domestic_sales + international_sales) / 1000000 AS combined_sales_in_ml
FROM movies
  JOIN boxoffice
    ON movies.id = boxoffice.movie_id;
SELECT title, rating * 10 AS rating_in_persent
FROM movies
  JOIN boxoffice
    ON movies.id = boxoffice.movie_id;
SELECT title, year%2=0 AS even_year
FROM movies;

# SQL Lesson 10: Queries with aggregates (Pt. 1)
SELECT MAX(Years_employed) AS Longest_time 
FROM Employees;
SELECT role, AVG(Years_employed) AS average_employed
FROM employees
GROUP BY role;
SELECT building, SUM(Years_employed) AS total_years_employed
FROM employees
GROUP BY building;

# SQL Lesson 11: Queries with aggregates (Pt. 2)
SELECT role, COUNT(*) AS number_of_artists
FROM employees
WHERE role = "Artist";
SELECT role, COUNT(*) AS number_of_empl_eachrole
FROM employees
GROUP BY role;
SELECT SUM(Years_employed) 
FROM employees
WHERE role = "Engineer";

# SQL Lesson 12: Order of execution of a Query
SELECT Director, COUNT(*) AS number_of_movies
FROM movies
GROUP BY director;
SELECT DISTINCT Director, SUM(Domestic_sales+International_sales)
FROM movies
    JOIN boxoffice
      ON movies.id = boxoffice.movie_id
    GROUP BY director;

# SQL Lesson 13: Inserting rows
INSERT INTO movies 
VALUES (4, "Toy Story 4", "John Lasseter", 2012, 95);
INSERT INTO Boxoffice
VALUES (4, 8.7, 340000000, 270000000);

#SQL Lesson 14: Updating rows
UPDATE movies
SET director = "John Lasseter"
WHERE id = 2;
UPDATE movies
SET year = 1999 
WHERE id = 3;
UPDATE movies
SET title = "Toy Story 3", 
    director = "Lee Unkrich"
WHERE id = 11;

#SQL Lesson 15: Deleting rows
DELETE FROM movies
WHERE year <= 2005;
DELETE FROM movies
WHERE director = "Andrew Stanton";

#SQL Lesson 16: Creating tables
CREATE TABLE Database (
    Name CHARACTER,
    Version FLOAT,
    Download_count INTEGER
);

#SQL Lesson 17: Altering tables
ALTER TABLE movies
ADD Aspect_ratio FLOAT;
ALTER TABLE movies
ADD Language CHARACTER 
    DEFAULT english;

#SQL Lesson 18: Dropping tables
DROP TABLE IF EXISTS movies;
DROP TABLE IF EXISTS boxoffice;

###SQL Lesson X: To infinity and beyond!
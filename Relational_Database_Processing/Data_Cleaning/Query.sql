-- Find company's rating with found titles
SELECT s.title, c.company, r.star
FROM company_salary as s
INNER JOIN company AS c ON
s.company_id = c.company_id
INNER JOIN company_rating AS r ON
c.company = r.company
WHERE (r.star != 'Rating Unknown' AND r.star != 'No Rating');


-- Find titles that has salary range written out in Indeed
SELECT company, title, salary
FROM company_salary
WHERE company_salary.salary != 'Unknown'

-- Find number of postings per company
SELECT company, COUNT(title)
FROM company_salary
GROUP BY company

-- Look for average housing price in a city from zillow
SELECT "City", Round(AVG("Asking_Price")::bigint) AS "average_asking_price"
FROM housing
GROUP BY "City"

-- Find house listing for a specific posting (Liberty Mutual Insurance)
SELECT h."Asking_Price", h."Street", h."City"
From housing AS h
WHERE "City" IN
(
	SELECT city
	FROM city
	WHERE city in
	(
		SELECT city
		From company_salary
		WHERE company = 'Liberty Mutual Insurance'
	)
);




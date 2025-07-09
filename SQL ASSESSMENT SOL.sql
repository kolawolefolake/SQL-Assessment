-- Question 1.  
/* What are the popular car brands in the community? Show a table that shows a summary 
of car brands and number of persons that owns that brand. */


SELECT car_make AS "Car Brand", COUNT(car_make) AS "Number of cars"
FROM drivers_license
GROUP BY car_make
ORDER BY 2 DESC


--Question 2. 

/* The council is thinking of creating a fund raiser. please identify the top 20 highest earning 
individuals in the community.  
It would be nice if you can show us in the table the following:  
Their name, their address, their age, gender, the type of car they drive. */ 


SELECT name, address_street_name, age, gender, car_make AS "Car Type", annual_income
FROM income AS I
LEFT JOIN person AS P
USING(ssn)
LEFT JOIN drivers_license AS DL
ON
P.license_id = DL.id
ORDER BY 6 DESC
LIMIT 20

--  Question 3.  
/* The council have been having some concerns over pressures on the use of some available 
public places such as libraries, parks etc. Help the council generate a summary table that 
shows the name of the street and the number of persons living in that street. */


SELECT address_street_name AS "Street Name", COUNT(address_street_name) AS "Population"
FROM person 
GROUP BY address_street_name
ORDER BY 2 DESC


 Question 4 
/* The government is planning on promoting fitness. But they will need to know some facts 
about the fitness centre in the DB.  
a.) How many males and females are currently registered at the gym?  
b.) What is the breakdown of the membership status? [that is, how many people are there 
for each membership category?]
 */

-- a.)

SELECT gender, COUNT(gender) AS "Population"
FROM get_fit_now_member AS GF
LEFT JOIN person AS P
ON
GF.person_id = P.id
LEFT JOIN drivers_license AS DL
ON
P.license_id = DL.id
GROUP BY gender
ORDER BY 2 DESC

-- b.)
SELECT membership_status, COUNT(membership_status) AS "Population"
FROM get_fit_now_member
GROUP BY membership_status
ORDER BY 2 DESC



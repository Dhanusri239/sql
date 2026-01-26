SELECT
p.FirstName,
p.LastName,
a.city,
a.state
FROM person person
JOIN Address a
ON p.personID=a.personID;

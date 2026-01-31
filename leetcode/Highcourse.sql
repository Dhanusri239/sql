SELECT
class
FROM Courses
GROUP BY class
HAVING COUNT(Student)>=5
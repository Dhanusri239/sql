SELECT
actor_id,
director_id
FROM DirectorActor
GROUP BY actor_id,director_id
HAVING COUNT(*)>=3;
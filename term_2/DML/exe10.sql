WITH max_city_visit AS (
    SELECT m.id, COUNT(*) AS visits
    FROM Grad
    LEFT JOIN Mesto m ON Grad.id_mesto = m.id
    LEFT JOIN Poseta p ON p.id_mesto = m.id
    GROUP BY m.id
),
max_city AS (
    SELECT id, MAX(visits) AS max_visits
    FROM max_city_visit
)
SELECT m.ime FROM max_city 
LEFT JOIN Objekt o ON max_city.id = o.id_grad
LEFT JOIN Mesto m ON o.id_mesto = m.id
ORDER BY m.ime DESC

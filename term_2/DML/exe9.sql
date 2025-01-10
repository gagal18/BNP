WITH max_visit AS (
    SELECT Objekt.id_mesto,
        COUNT(*) as visits
    FROM Objekt
        LEFT JOIN Poseta pt ON pt.id_mesto = Objekt.id_mesto
    GROUP BY Objekt.id_mesto
)
SELECT ime
FROM (
        SELECT MAX(visits) AS mx,
            ob.*,
            Mesto.*
        FROM max_visit
            LEFT JOIN Objekt ob ON ob.id_mesto = max_visit.id_mesto
            LEFT JOIN Grad ON ob.id_grad = Grad.id_mesto
            LEFT JOIN Mesto ON Grad.id_mesto = Mesto.id
    )
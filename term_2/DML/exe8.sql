SELECT DISTINCT Bend.ime as B1,
    b2.ime as B2
FROM Bend
    CROSS JOIN Bend b2 ON Bend.godina_osnovanje = b2.godina_osnovanje
    AND Bend.id != b2.id
WHERE b2.ime < Bend.ime
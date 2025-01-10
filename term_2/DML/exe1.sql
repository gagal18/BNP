SELECT Lice.id
FROM Lice
    LEFT JOIN "Test" ON Lice.id = Test.id
    LEFT JOIN Vakcinacija_datum vd ON Lice.id = vd.id_lice
WHERE Test.rezultat = 'pozitiven'
    AND Test.datum < vd.datum
GROUP BY Lice.id
ORDER BY Lice.id ASC;
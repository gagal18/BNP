WITH CNT AS (
    SELECT Lice.id,
        COUNT(*) AS num_vac
    FROM Lice
        LEFT JOIN Test ON Lice.id = Test.id
        LEFT JOIN Vakcinacija_datum vd ON vd.id_lice = Lice.id
    WHERE Test.datum >= '2021-08-01'
        AND Test.datum <= '2021-08-31'
        AND Test.rezultat = 'pozitiven'
    GROUP BY Lice.id
)
SELECT (
        select count(*)
        from CNT
        WHERE num_vac < 2
    ) * 100.0 / (
        select count(*)
        from CNT
    ) as procent
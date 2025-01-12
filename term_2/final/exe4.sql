WITH max_2023 AS (SELECT m.ime_muzej, COUNT(*) as broj FROM Muzej m
LEFT JOIN Izlozba i ON i.shifra_muzej = m.shifra
LEFT JOIN Izlozba_UD iud ON iud.ime_i = i.ime_i
LEFT JOIN Izlozeni izl ON izl.ime_i = iud.ime_i
WHERE izl.datum_pocetok >= '2023-01-01' AND izl.datum_pocetok < '2024-01-01'
GROUP BY m.ime_muzej)

SELECT ime_muzej FROM max_2023
WHERE broj = (SELECT MAX(broj) from max_2023)

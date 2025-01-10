SELECT DISTINCT v.ime, v.prezime FROM Shalterski_rabotnik sr
INNER JOIN Vraboten v ON sr.ID = v.ID
LEFT JOIN Transakcija_shalter ts ON ts.ID_v = v.ID
LEFT JOIN Smetka s ON s.MBR_k = ts.MBR_k
WHERE ts.tip = 'isplata'
AND ts.suma > 1000
AND s.valuta = 'EUR'
ORDER BY v.ime ASC

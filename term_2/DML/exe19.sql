WITH vrb_fill AS (SELECT v.ID as vraboten, ts.datum, COUNT(*) as broj_transakcii FROM Vraboten v
LEFT JOIN Transakcija_shalter ts ON ts.ID_v = v.ID
GROUP BY v.ID, ts.datum
HAVING ts.ID_v IS NOT NULL)

SELECT * FROM vrb_fill vf 
WHERE broj_transakcii = (SELECT MAX(broj_transakcii) FROM vrb_fill WHERE vf.vraboten = vraboten)

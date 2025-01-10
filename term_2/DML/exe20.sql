
WITH pst_shal AS (
    SELECT ts.MBR_k_s, AVG(suma) as prosechna_isplata_shalter 
    FROM Transakcija_shalter ts
    WHERE datum >= '2021-01-01' AND datum < '2022-01-01'
    AND tip = 'isplata'
    GROUP BY ts.MBR_k_s
),
pst_bank AS (
    SELECT tb.MBR_k_s, AVG(suma) as prosechna_isplata_bankomat 
    FROM Transakcija_bankomat tb
    WHERE datum >= '2021-01-01' AND datum < '2022-01-01'
    GROUP BY tb.MBR_k_s
)

SELECT s.MBR_k, broj ,pb.prosechna_isplata_bankomat, ps.prosechna_isplata_shalter
FROM Smetka s
LEFT JOIN pst_shal ps ON ps.MBR_k_s = s.MBR_k
LEFT JOIN pst_bank pb ON pb.MBR_k_s = s.MBR_k
WHERE (s.valuta = 'USD' OR s.valuta = 'EUR')
AND pb.prosechna_isplata_bankomat IS NOT NULL 
AND ps.prosechna_isplata_shalter IS NOT NULL

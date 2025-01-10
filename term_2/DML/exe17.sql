SELECT s.* FROM Smetka s
LEFT JOIN Transakcija_shalter ts ON ts.MBR_k = s.MBR_k
LEFT JOIN Transakcija_bankomat tb ON tb.MBR_k_s = s.MBR_k
WHERE ts.tip = 'isplata'
AND s.valuta = 'MKD'
AND tb.datum >= '2021-01-01' AND tb.datum < '2022-01-01'
AND ts.datum >= '2021-01-01' AND ts.datum < '2022-01-01'

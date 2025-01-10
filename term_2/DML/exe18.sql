SELECT k.* FROM Klient k
LEFT JOIN Smetka s ON s.MBR_k = k.MBR_k
LEFT JOIN Transakcija_shalter ts ON ts.MBR_k_s = k.MBR_k
LEFT JOIN Transakcija_bankomat tb ON tb.MBR_k_s = k.MBR_k
WHERE s.valuta = 'EUR'
AND ts.MBR_k_s IS NULL
ORDER BY k.ime

SELECT DISTINCT k.ime, k.prezime FROM Klient k
LEFT JOIN Smetka s ON s.MBR_k = k.MBR_k
LEFT JOIN Transakcija_bankomat tb ON tb.MBR_k_s= k.MBR_k 
WHERE s.valuta = 'USD'
AND tb.suma > 400
ORDER BY k.ime ASC

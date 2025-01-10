SELECT zanr, COUNT(*) as broj_zanrovi FROM Preporaka p
LEFT JOIN Video_zapis_zanr vzz ON p.naslov = vzz.naslov
WHERE p.komentar LIKE '%interesting%'
GROUP BY zanr

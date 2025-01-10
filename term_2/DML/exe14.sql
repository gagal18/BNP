WITH movies_avg_rate AS (SELECT vz.naslov, AVG(p.ocena) as sr FROM Video_zapis vz
LEFT JOIN Preporaka p ON p.naslov = vz.naslov
GROUP BY vz.naslov)

SELECT lz.ime, AVG(mr.sr) as po_profil FROM Profil p
LEFT JOIN Lista_zelbi lz ON lz.k_ime = p.k_ime AND lz.ime = p.ime
LEFT JOIN movies_avg_rate mr ON mr.naslov = lz.naslov 
GROUP BY lz.ime
HAVING AVG(mr.sr) IS NOT NULL

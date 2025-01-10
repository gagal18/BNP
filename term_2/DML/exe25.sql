WITH film_shared AS(SELECT naslov, COUNT(*) AS count_list FROM Lista_zelbi
GROUP BY naslov)

SELECT vz.naslov, vz.vremetraenje, COUNT(*) AS broj_preporaki FROM film_shared fs
LEFT JOIN Video_zapis vz ON vz.naslov = fs.naslov
LEFT JOIN Preporaka p ON p.naslov = vz.naslov
WHERE count_list > 1
GROUP BY vz.naslov

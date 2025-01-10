WITH Festivals AS (SELECT f.id, ime, cena, kapacitet, COUNT(*) as broj_odrzuvanja FROM Festival f
LEFT JOIN Nastan n ON n.id = f.id
LEFT JOIN Festival_odrzuvanje fo ON fo.id = f.id
GROUP BY f.id
),

all_ent AS (SELECT * FROM Festivals f
LEFT JOIN Festival_bend fb ON f.id = fb.id_festival
GROUP BY f.id, fb.id_bend)

SELECT ime, cena, kapacitet, broj_odrzuvanja, count(*) as broj_bendovi FROM all_ent
GROUP BY all_ent.id

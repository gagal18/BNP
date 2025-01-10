WITH max_given AS (SELECT Korisnik.k_ime, COUNT(*) as given FROM Korisnik
LEFT JOIN Preporaka p ON Korisnik.k_ime = p.k_ime_od
GROUP BY Korisnik.k_ime),

max_cnt AS (
	SELECT k_ime FROM max_given
	WHERE given = (select MAX(given) FROM max_given)
)

SELECT max_cnt.k_ime, COUNT(*) as dobieni_preporaki FROM max_cnt
LEFT JOIN Preporaka p ON max_cnt.k_ime = p.k_ime_na
GROUP BY max_cnt.k_ime





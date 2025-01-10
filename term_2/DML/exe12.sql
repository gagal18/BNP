WITH all_prep AS (SELECT k_ime_od,naslov, COUNT(*) as broj FROM Preporaka
GROUP BY k_ime_od, naslov)

SELECT DISTINCT ap.k_ime_od AS k_ime, ap.naslov, ap.broj FROM all_prep
CROSS JOIN all_prep ap ON all_prep.k_ime_od = ap.k_ime_od
WHERE ap.naslov != all_prep.naslov AND ap.k_ime_od = all_prep.k_ime_od
AND ap.broj = (
	SELECT MAX(broj) FROM all_prep
	WHERE ap.k_ime_od = k_ime_od
)



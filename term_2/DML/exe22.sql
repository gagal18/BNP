WITH user_rec AS (
SELECT k_ime_od as k_ime, COUNT(*) as given  FROM Preporaka
GROUP BY k_ime_od
)

SELECT k_ime, COUNT(*) as dobieni_preporaki FROM user_rec ur
LEFT JOIN Preporaka p ON p.k_ime_na = ur.k_ime
WHERE given = (SELECT MAX(GIVEN) from user_rec)
GROUP BY k_ime_na

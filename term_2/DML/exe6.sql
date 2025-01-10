SELECT kp.k_ime,
    pr.naslov
FROM Premium_korisnik as pk
    LEFT JOIN Korisnik kp ON pk.k_ime = kp.k_ime
    LEFT JOIN Preporaka pr ON pk.k_ime = pr.k_ime_na
    LEFT JOIN Video_zapis vz ON pr.naslov = vz.naslov
    LEFT JOIN Lista_zelbi lz ON pk.k_ime = lz.k_ime
    AND lz.naslov = pr.naslov
WHERE pr.ocena >= 3
    AND pr.datum >= '2021-01-01'
    AND pr.datum <= '2021-12-31'
    AND lz.naslov = pr.naslov
ORDER BY pk.k_ime ASC
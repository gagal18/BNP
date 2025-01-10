SELECT DISTINCT ime,
    prezime
FROM Premium_korisnik as pk
    LEFT JOIN Korisnik kr ON kr.k_ime = pk.k_ime
    LEFT JOIN Preporaka pr ON pr.k_ime_od = pk.k_ime
    LEFT JOIN Video_zapis vz ON pr.naslov = vz.naslov
WHERE pr.ocena >= 4
    AND vz.vremetraenje >= 120
ORDER BY kr.datum_reg ASC
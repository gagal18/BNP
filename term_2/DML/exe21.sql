SELECT DISTINCT ime, prezime FROM Premium_korisnik pk
LEFT JOIN Korisnik k ON k.k_ime = pk.k_ime
LEFT JOIN Preporaka p ON p.k_ime_od = k.k_ime
LEFT JOIN Video_zapis vz ON vz.naslov = p.naslov
WHERE vz.vremetraenje > 120 AND p.ocena >=4
ORDER BY k.datum_reg

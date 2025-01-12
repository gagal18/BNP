SELECT ud.ime, ud.umetnik FROM Umetnicko_delo ud
LEFT JOIN Izlozeni i ON ud.shifra = i.shifra_d
LEFT JOIN Izlozba_UD iud ON iud.ime_i = i.ime_i
LEFT JOIN Izlozba izl ON izl.ime_i = iud.ime_i
WHERE i.datum_pocetok = izl.datum_od AND
i.datum_kraj = izl.datum_do
ORDER BY ud.ime ASC

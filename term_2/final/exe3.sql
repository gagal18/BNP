WITH ztv_um AS (
SELECT DISTINCT ud.umetnik FROM Umetnicko_delo ud
LEFT JOIN Izlozeni izl ON izl.shifra_d = ud.shifra
LEFT JOIN Izlozba_UD iud ON iud.ime_i = izl.ime_i
LEFT JOIN Izlozba i ON iud.ime_i = i.ime_i
LEFT JOIN Muzej m ON m.shifra = i.shifra_muzej
WHERE m.tip = 'zatvoreno'

)

SELECT ud.umetnik FROM Umetnicko_delo ud
WHERE ud.umetnik NOT IN ztv_um
ORDER BY ud.umetnik

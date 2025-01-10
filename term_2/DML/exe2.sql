SELECT ime,
    prezime
FROM Muzicar
    LEFT JOIN Muzicar_instrument md on Muzicar.id = md.id_muzicar
    LEFT JOIN Koncert_muzicar_bend kmb on Muzicar.id = kmb.id_muzicar
    LEFT JOIN Koncert konc on konc.id = kmb.id_koncert
    LEFT JOIN Muzicar_bend mb on mb.id_muzicar = kmb.id_muzicar
    AND mb.id_bend = kmb.id_bend
WHERE md.instrument = 'gitara'
    AND mb.datum_napustanje < datum
CREATE TRIGGER update_count
AFTER INSERT ON Izlozeni
FOR EACH ROW
BEGIN
    UPDATE Umetnicko_delo
    SET br_izlozbi_otvoreno = br_izlozbi_otvoreno + 1
    WHERE shifra = NEW.shifra_d AND NEW.ime_i IN (
        SELECT ime_i
        FROM Izlozba iz
        JOIN Muzej m ON iz.shifra_muzej = m.shifra
        WHERE m.tip = 'otvoreno'
    );
    
    UPDATE Umetnicko_delo
    SET br_izlozbi_zatvoreno = br_izlozbi_zatvoreno + 1
    WHERE shifra = NEW.shifra_d AND NEW.ime_i IN (
        SELECT ime_i
        FROM Izlozba iz
        JOIN Muzej m ON iz.shifra_muzej = m.shifra
        WHERE m.tip = 'zatvoreno'
    );
END;

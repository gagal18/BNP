CREATE TABLE "MUZEJ"(
	shifra TEXT PRIMARY KEY,
	ime_muzej TEXT,	
	opis TEXT,
	grad TEXT,
	tip TEXT,
	rabotno_vreme TEXT,
	CONSTRAINT check_tip CHECK (tip in ('otvoreno', 'zatvoreno')),
	CONSTRAINT check_shifra CHECK (tip <> 'otvoreno' OR shifra LIKE 'o%')
);
CREATE TABLE "Umetnicko_delo"(
	shifra TEXT PRIMARY KEY,
	ime TEXT,
	godina INT,
	umetnik TEXT
);
CREATE TABLE "Izlozeni"(
	shifra_d TEXT, 
	ime_i TEXT,
	datum_pocetok DATE,
	datum_kraj DATE,
	PRIMARY KEY (shifra_d, ime_i),
	FOREIGN KEY (ime_i) REFERENCES Izlozba_UD(ime_i)
		ON DELETE CASCADE ON UPDATE CASCADE
	FOREIGN KEY (shifra_d) REFERENCES Umetnicko_delo(shifra)
		ON DELETE CASCADE ON UPDATE CASCADE
);


CREATE TABLE "Korisnik"(
    k_ime TEXT PRIMARY KEY,
    ime TEXT,
    prezime TEXT,
    tip TEXT,
    pretplata TEXT,
    datum_reg DATE,
    tel_broj TEXT,
    email TEXT,
    CONSTRAINT check_pretplata CHECK (NOT (datum_reg < '2015-01-01' AND pretplata = 'pretplata 3'))
);

CREATE TABLE "Premium_korisnik"(
    k_ime TEXT PRIMARY KEY,
    datum DATE,
    procent_popust DECIMAL DEFAULT 10,
    FOREIGN KEY (k_ime) REFERENCES Korisnik(k_ime)
        ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE "Lista_zelbi"(
    ID int PRIMARY KEY,
    naslov TEXT,
    k_ime TEXT,
    ime TEXT, 
    FOREIGN KEY (k_ime, ime) REFERENCES Profil(k_ime, ime)
        ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (naslov) REFERENCES Video_zapis(naslov)
        ON DELETE SET NULL ON UPDATE CASCADE
);
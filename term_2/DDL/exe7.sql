CREATE TABLE "Korisnik"(
    k_ime TEXT PRIMARY KEY,
    ime TEXT,
    prezime TEXT,
    tip TEXT,
    pretplata TEXT,
    datum_reg DATE,
    tel_broj varchar(12),
    email TEXT,
    CONSTRAINT check_reg_date CHECK (
        datum_reg >= '2023-01-01' AND datum_reg <= '2024-12-31'
    )
);

CREATE TABLE "Premium_korisnik"(
    k_ime TEXT PRIMARY KEY,
    datum DATE,
    procent_popust DECIMAL DEFAULT 20,
    FOREIGN KEY (k_ime) REFERENCES Korisnik(k_ime)
        ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE "Profil"(
    k_ime TEXT,
    ime TEXT,
    datum DATE,
    PRIMARY KEY (k_ime, ime),
    FOREIGN KEY (k_ime) REFERENCES Korisnik(k_ime)
        ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE "Video_zapis"(
    naslov TEXT PRIMARY KEY,
    jazik TEXT DEFAULT 'English',
    vremetraenje DECIMAL,
    datum_d DATE,
    datum_p DATE,
    CONSTRAINT check_date CHECK (
        datum_d >= datum_p
    )
);

CREATE TABLE "Video_zapis_zanr"(
    naslov TEXT,
    zanr TEXT,
    PRIMARY KEY (naslov, zanr),
    FOREIGN KEY (naslov) REFERENCES Video_zapis(naslov)
        ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE "Lista_zelbi"(
    naslov TEXT,
    k_ime TEXT,
    ime TEXT,
    PRIMARY KEY(naslov, k_ime, ime),
    FOREIGN KEY (k_ime, ime) REFERENCES Profil(k_ime, ime)
        ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (naslov) REFERENCES Video_zapis(naslov)
        ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE "Preporaka"(
    ID INT PRIMARY KEY,
    k_ime_od TEXT,
    k_ime_na TEXT,
    naslov TEXT DEFAULT 'Deleted',
    datum DATE,
    komentar varchar(250) NOT NULL,
    ocena INT,
    FOREIGN KEY (k_ime_od) REFERENCES Korisnik(k_ime)
        ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (k_ime_na) REFERENCES Korisnik(k_ime)
        ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (naslov) REFERENCES Video_zapis(naslov)
        ON DELETE SET DEFAULT ON UPDATE CASCADE,
    CONSTRAINT check_ocena CHECK (
        ocena >= 1 AND ocena <= 5
    ),
    CONSTRAINT check_date_preporaka CHECK (
        datum > '2022-12-07'
    )
);

CREATE TABLE "Vraboten"(
    ID INT PRIMARY KEY,
    ime TEXT,
    prezime TEXT,
    datum_r DATE,
    datum_v DATE,
    obrazovanie TEXT,
    plata DECIMAL,
    CONSTRAINT check_obr CHECK (
        obrazovanie in ('PhD', 'MSc', 'High School', 'BSc')
    ),
    CONSTRAINT check_dates CHECK (
        datum_r < datum_v
    )
);

CREATE TABLE "Shalterski_rabotnik"(
    ID INT,
    PRIMARY KEY (ID),
    FOREIGN KEY (ID) REFERENCES Vraboten(ID)
        ON DELETE CASCADE ON UPDATE CASCADE
);
CREATE TABLE "Klient"(
    MBR_k TEXT PRIMARY KEY,
    ime TEXT,
    prezime TEXT,
    adresa TEXT DEFAULT 'Ne e navedena',
    datum DATE
);
CREATE TABLE "Smetka"(
    MBR_k TEXT,
    broj TEXT,
    valuta TEXT,
    saldo TEXT,
    PRIMARY KEY (MBR_k, broj),
    FOREIGN KEY (MBR_k) REFERENCES Klient(MBR_k)
        ON DELETE CASCADE ON UPDATE CASCADE
);
CREATE TABLE "Transakcija_shalter"(
    ID INT PRIMARY KEY,
    ID_v INT,
    MBR_k TEXT,
    MBR_k_s TEXT,
    broj INT,
    datum DATE,
    suma DECIMAL, 
    tip TEXT,
    FOREIGN KEY (ID_v) REFERENCES Shalterski_rabotnik(ID)
        ON DELETE SET NULL ON UPDATE CASCADE,
    FOREIGN KEY (MBR_k) REFERENCES Klient(MBR_k)
        ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (MBR_k_s, broj) REFERENCES Smetka(MBR_k, broj)
        ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT check_tip CHECK (
        tip in ('uplata', 'isplata')
    )
);
CREATE TABLE "Bankomat"(
    ID INT PRIMARY KEY,
    lokacija TEXT UNIQUE,
    datum DATE,
    zaliha DECIMAL,
    CONSTRAINT check_zaliha CHECK (
        zaliha >= 0
    )
);

CREATE TABLE "Transakcija_bankomat"(
    ID INT PRIMARY KEY,
    MBR_k_s TEXT,
    broj TEXT,
    ID_b INT DEFAULT -1,
    datum DATE,
    suma DECIMAL,
    FOREIGN KEY (ID_b) REFERENCES Bankomat(ID)
        ON DELETE SET DEFAULT ON UPDATE CASCADE,
    FOREIGN KEY (MBR_k_s, broj) REFERENCES Smetka(MBR_k, broj)
        ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT check_date CHECK (
       NOT(datum > '2020-12-30' AND datum < '2021-01-14')
    )
);
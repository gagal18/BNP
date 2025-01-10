CREATE TABLE "Video_zapis"(
    naslov varchar(50) PRIMARY KEY,
    jazik varchar(10),
    vremetraenje INT,
    datum_d DATE,      
    datum_p DATE
);

CREATE TABLE "Video_zapis_zanr"(
    naslov varchar(50),
    zanr varchar(10),
    PRIMARY KEY(naslov, zanr),
    FOREIGN KEY (naslov) REFERENCES Video_zapis(naslov)
        ON DELETE CASCADE ON UPDATE CASCADE
);
CREATE TABLE "Preporaka"(
    ID int PRIMARY KEY,
    k_ime_od varchar(50), 
    k_ime_na varchar(50), 
    naslov varchar(50), 
    datum DATE,
    komentar varchar(50),
    ocena INT,
    FOREIGN KEY (naslov) REFERENCES Video_zapis(naslov)
        ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (k_ime_na) REFERENCES Korisnik(k_ime)
        ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (k_ime_od) REFERENCES Korisnik(k_ime)
        ON DELETE SET NULL ON UPDATE CASCADE,
    CONSTRAINT check_date CHECK (
        datum < DATE()
    ),
    CONSTRAINT check_user CHECK (
        k_ime_od != k_ime_na
    )

    
);
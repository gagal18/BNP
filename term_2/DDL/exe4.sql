CREATE TABLE "Korisnik"(
    kor_ime varchar(20) PRIMARY KEY,
    ime varchar(20),
    prezime varchar(20),
    pol varchar(20),
    data_rag DATE,
    data_reg DATE
);

CREATE TABLE "Korisnik_email"(
    kor_ime varchar(20),
    email varchar(30),
    PRIMARY KEY (kor_ime, email),
    FOREIGN KEY (kor_ime) REFERENCES Korisnik(kor_ime)
        ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT checK_email CHECK (
        email LIKE "%.com" AND LENGTH(email) > 9
    )
);

CREATE TABLE "Poseta"(
    id INT PRIMARY KEY,
    kor_ime varchar(20),
    id_mesto INT,
    datum DATE,
    FOREIGN KEY (id_mesto) REFERENCES Mesto(id)
        ON DELETE CASCADE ON UPDATE CASCADE
    FOREIGN KEY (kor_ime) REFERENCES Korisnik(kor_ime)
        ON DELETE SET NULL ON UPDATE CASCADE,
    CONSTRAINT check_date CHECK (
        datum < DATE()
    )
);
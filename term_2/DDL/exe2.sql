CREATE TABLE "Test"(
    id INT,
    shifra varchar(20),
    tip varchar(20),
    datum DATE,
    rezultat varchar(20),
    laboratorija varchar(20),
    PRIMARY KEY (id, shifra),
    FOREIGN KEY (id) REFERENCES Lice(id) ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT check_lab CHECK (
        NOT (laboratorija = 'lab-abc' AND tip != 'seroloshki')
    )
);
CREATE TABLE "Vakcinacija"(
    id_lice INT,
    id_med_lice INT,
    shifra_vakcina INT,
    PRIMARY KEY(id_lice, id_med_lice, shifra_vakcina),
    FOREIGN KEY (id_lice) REFERENCES Lice(id) ON DELETE
    SET DEFAULT ON UPDATE CASCADE,
        FOREIGN KEY (id_med_lice) REFERENCES Med_lice(id) ON DELETE
    SET DEFAULT ON UPDATE CASCADE,
        FOREIGN KEY (shifra_vakcina) REFERENCES Vakcina(shifra) ON DELETE
    SET DEFAULT ON UPDATE CASCADE,
        CONSTRAINT check_lice CHECK (id_lice != id_med_lice)
);
CREATE TABLE "Vakcinacija_datum"(
    id_lice INT,
    id_med_lice INT,
    shifra_vakcina INT,
    datum DATE,
    PRIMARY KEY(id_lice, id_med_lice, shifra_vakcina, datum),
    FOREIGN KEY (id_lice, id_med_lice, shifra_vakcina) REFERENCES Vakcinacija(id_lice, id_med_lice, shifra_vakcina) ON DELETE
    SET NULL ON UPDATE CASCADE
);
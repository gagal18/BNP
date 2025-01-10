CREATE TABLE "Bend"(
    id INT PRIMARY KEY,
    ime varchar(20),
    godina_osnovanje INT,
    CONSTRAINT check_year CHECK (godina_osnovanje > 1970)
);

CREATE TABLE "Bend_zanr"(
    id_bend INT,
    zanr varchar(20),
    PRIMARY KEY(id_bend, zanr)
    FOREIGN KEY (id_bend) REFERENCES Bend(id)
        ON DELETE CASCADE ON UPDATE CASCADE

);

CREATE TABLE "Festival_bend"(
    id_festival INT,
    datum_od DATE,
    id_bend INT,
    PRIMARY KEY (id_festival, datum_od, id_bend),
    FOREIGN KEY (id_festival, datum_od) REFERENCES Festival_odrzuvanje(id, datum_od)
        ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (id_bend) REFERENCES Bend(id)
        ON DELETE SET DEFAULT ON UPDATE CASCADE, 
    CONSTRAINT check_fest CHECK (NOT (id_festival = 2 AND id_bend = 5))
)
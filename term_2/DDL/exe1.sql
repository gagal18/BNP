CREATE TABLE "Vraboten"(
  ID INT PRIMARY KEY,
  ime varchar(20),
  prezime varchar(20),
  datum_r DATE,
  datum_v DATE,
  obrazovanie varchar(20) NOT NULL,
  plata DECIMAL(10,2),
  CONSTRAINT check_datum CHECK (datum_r < datum_v)
);

CREATE TABLE "Shalterski_rabotnik"(
    ID INT PRIMARY KEY,
    FOREIGN KEY (ID) REFERENCES Vraboten(ID) 
    ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE "Transakcija_shalter"(
	ID INT PRIMARY KEY,
	ID_v INT,
  	MBR_k INT,
  	MBR_k_s INT,
  	broj INT,
  	datum DATE,
  	suma INT,
  	tip varchar(10),
    CONSTRAINT check_tip CHECK (tip IN ('uplata', 'isplata'))
  	CONSTRAINT check_datum_transakcija CHECK (datum NOT BETWEEN '2020-12-30' AND '2021-01-14')
  	FOREIGN KEY (ID_v) REFERENCES Shalterski_rabotnik(ID)
  		ON DELETE SET NULL ON UPDATE CASCADE
  	FOREIGN KEY (MBR_k_s, broj) REFERENCES Smetka(MBR_k_s, broj)
   		ON DELETE CASCADE ON UPDATE CASCADE
  	FOREIGN KEY (MBR_k) REFERENCES Klient(MBR_k)
  		ON DELETE CASCADE ON UPDATE CASCADE

);
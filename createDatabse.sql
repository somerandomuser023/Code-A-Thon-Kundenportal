DROP database dal_db;
CREATE database dal_db;
USE dal_db;

CREATE TABLE Kundenunternehmen (
    Kunde_ID INT auto_increment PRIMARY KEY,
    Name VARCHAR(100) NOT NULL,
    Straße VARCHAR(100) NOT NULL,
    Plz VARCHAR(10) NOT NULL,
    Ort VARCHAR(50) NOT NULL,
    Geschäftszweig VARCHAR(100),
    Email VARCHAR(100) NOT NULL,
    Telefon VARCHAR(20),
    Handelsregisternummer VARCHAR(50),
    Amtsgericht VARCHAR(50)
);

CREATE TABLE Portalnutzer (
    Nutzer_ID INT PRIMARY KEY,
    Name VARCHAR(50) NOT NULL,
    Vorname VARCHAR(50) NOT NULL,
    Email VARCHAR(100) NOT NULL,
    Passwort VARCHAR(100) NOT NULL,
    Telefon VARCHAR(20),
    GP_Nummer VARCHAR(50),
    Kunde_ID INT,
    FOREIGN KEY (Kunde_ID) REFERENCES Kundenunternehmen(Kunde_ID)
);

CREATE TABLE Asset (
    Asset_ID INT auto_increment PRIMARY KEY,
    Objektart_Bezeichnung VARCHAR(100) NOT NULL,
    Straße VARCHAR(100),
    PLZ VARCHAR(10),
    Ort VARCHAR(50),
    Zustand VARCHAR(50),
    Objekterrichtung VARCHAR(50),
    Grundstücksart VARCHAR(50),
    Untermieter boolean not null default 0
);

CREATE TABLE Vertrag (
    Vertrag_ID DECIMAL(10, 3) PRIMARY KEY,
    Typ VARCHAR(50),
    Leasingobjektgesellschaft VARCHAR(100),
    Kunde_ID INT,
    Mietbeginn DATE,
    Laufzeit INT,
    Mietende DATE,
    Zahlungsrhythmus VARCHAR(50),
    Zahlungsweise VARCHAR(50),
    Gesamtinvestitionskosten DECIMAL(15, 2),
    Lastschrifteinzug boolean not null default 0,
    Asset_ID INT,
    FOREIGN KEY (Kunde_ID) REFERENCES Kundenunternehmen(Kunde_ID),
    FOREIGN KEY (Asset_ID) REFERENCES Asset(Asset_ID)
);

CREATE TABLE Vertragsereignis (
    Event_ID INT auto_increment PRIMARY KEY,
    Vertrag_ID DECIMAL(10, 3),
    Ereignis VARCHAR(100),
    Ereignisdatum DATE,
    FOREIGN KEY (Vertrag_ID) REFERENCES Vertrag(Vertrag_ID)
);


CREATE TABLE Rechnung (
    Rechnungsnummer INT auto_increment PRIMARY KEY,
    Rechnungsdatum DATE,
    Betrag DECIMAL(15, 2),
    Status VARCHAR(50),
    Vertrag_ID DECIMAL(10, 3),
    FOREIGN KEY (Vertrag_ID) REFERENCES Vertrag(Vertrag_ID)
);

CREATE TABLE Nachhaltigkeitsdaten (
    Asset_ID INT,
    Abfragedatum DATE,
    Erfassungsdatum DATE,
    Stromverbrauch_kWh DECIMAL(15, 2),
    Gasverbrauch_kWh DECIMAL(15, 2),
    PRIMARY KEY (Asset_ID, Abfragedatum),
    FOREIGN KEY (Asset_ID) REFERENCES Asset(Asset_ID)
);

CREATE TABLE Anzeigetext (
    Anzeigetext_ID INT PRIMARY KEY,
    Text TEXT
);

CREATE TABLE Pop_Up (
    Nutzer_ID INT,
    Anzeigedatum DATE,
    Anzeigetext_ID INT,
    Nutzerreaktion VARCHAR(5),
    PRIMARY KEY (Nutzer_ID, Anzeigedatum, Anzeigetext_ID),
    FOREIGN KEY (Nutzer_ID) REFERENCES Portalnutzer(Nutzer_ID),
    FOREIGN KEY (Anzeigetext_ID) REFERENCES Anzeigetext(Anzeigetext_ID)
);



CREATE TABLE Postbox_Nachricht (
    Nutzer_ID INT,
    Richtung VARCHAR(20),
    Datum DATE,
    Text TEXT,
    PRIMARY KEY (Nutzer_ID, Richtung, Datum),
    FOREIGN KEY (Nutzer_ID) REFERENCES Portalnutzer(Nutzer_ID)
);

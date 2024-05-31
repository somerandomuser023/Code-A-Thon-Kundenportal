use dal_db;
-- Kundenunternehmen
INSERT INTO Kundenunternehmen (Kunde_ID, Name, Straße, Plz, Ort, Geschäftszweig, Email, Telefon, Handelsregisternummer, Amtsgericht)
VALUES
(78952, 'RABO Fliesengroßhandels GmbH', 'Haribostraße 1', '55127', 'Gummistadt', 'Fliesenherstellung', 'info@rabo.de', '08721-657821', 'HRB 217566', 'Gummistadt'),
(85421, 'Autohaus Autopia', 'Amselstraße 91', '78542', 'Reisetadt', 'Autohaus; Autohandel', 'info@autopia.de', '06587-85423', 'HRB 56821', 'Reisestadt'),
(25412, 'BrauBier GmbH', 'Froschgasse 78', '58912', 'Bierstadt', 'Brauerei', 'info@braubier.de', '05213-85472', 'HRB 12546', 'Bierstadt'),
(98572, 'Bilderfreak GmbH', 'Bahnhofstraße 22', '45213', 'Sonnenstadt', 'Grosshandel Bilderrahmen', 'info@bilderfreak.de', '09542-872139', 'HRB 78956', 'Sonnenstadt'),
(33333, 'Mediengeist GmbH', 'Lange Straße 45', '85423', 'Hafenstadt', 'TV Sender', 'info@mediengeist.de', '06821-581236', 'HRB 58742', 'Hafenstadt'),
(85712, 'Stadt Mustermann', 'Musterstraße 85', '42121', 'Musterstadt', 'Stadtverwaltung', 'info@stadt-mustermann.de', '02143-985321', 'HRB 89521', 'Musterstadt'),
(52648, 'Sparkasse Heaven', 'Europlatz', '84512', 'Rheinstadt', 'Sparkasse', 'info@sparkasse-heaven.de', '08745-54123', 'HRB 45127', 'Rheinstadt'),
(65892, 'Isolation GmbH', 'Rabenstraße 12', '45872', 'Rabenstadt', 'Herstelung von Dämmung', 'info@Isolation.de', '06842-85412', 'HRB 85423', 'Rabenstadt'),
(85422, 'Bicyle GmbH', 'Berliner Staße 26', '65214', 'Schönenstadt', 'Verkauf von Fahrrädern & E-Bikies', 'info@bicyle.de', '03217-74512', 'HRB 45127', 'Schönenstadt'),
(78542, 'Mehrwohnen GmbH', 'Hamburger Straße 33', '58721', 'Schönheim', 'Alten-, Wohn- und Pflegeheim', 'info@mehrwohnen.de', '08745-657412', 'HRB 85412', 'Schönheim');

-- Portalnutzer
INSERT INTO Portalnutzer (Nutzer_ID, Name, Vorname, Email, Passwort, Telefon, GP_Nummer, Kunde_ID)
VALUES
(2789, 'Schulze', 'Doris', 'd.schulze@braubier.de', 'm7K1jV6x', '05213-85444', NULL, '25412'),
(3085, 'Klein', 'Robert', 'r.klein@braubier.de', 'f2P8nJ4s', '05213-85433', NULL, '25412'),
(3312, 'Krieger', 'Anton', 'a.krieger@braubier.de', 'D9u3W5bH', '05213-85411', NULL, '25412'),
(3340, 'Weber', 'Robert', 'r.weber@braubier.de', 't5X7gQ1M', '05213-85472', NULL, '25412');

-- Assets
INSERT INTO Asset (Asset_ID, Objektart_Bezeichnung, Straße, PLZ, Ort, Zustand, Objekterrichtung, Grundstücksart, Untermieter)
VALUES
(5472, 'Parkhaus', 'Froschgasse 93', '58912', 'Bierstadt', 'Neubau', 'Sale and lease back', 'Kauf', 0),
(6160, 'Lagerhalle', 'Weingasse 11', '58911', 'Hasstadt', 'Neubau', 'Projektmanagement', 'Erbbaurecht', 0),
(7845, 'Verwaltungsgebäude mit Lagerhalle', 'Froschgasse 78', '58912', 'Bierstadt', 'Neubau', 'Sale and lease back', 'Kauf', 1),
(9017, 'Lagerhalle', 'Weingasse 11', '58911', 'Hasstadt', 'Neubau', 'Projektmanagement', 'Erbbaurecht', 0),
(8542, 'Produktionsgebäude', 'Froschgasse 85', '58912', 'Bierstadt', 'Neubau', 'Sale and lease back', 'Kauf', 1),
(5509, 'Sondergebäude', 'Weingasse 13', '58911', 'Hasstadt', 'Neubau', 'Projektmanagement', 'Erbbaurecht', 0);


-- Vertrag
INSERT INTO Vertrag (Vertrag_ID, Typ, Leasingobjektgesellschaft, Kunde_ID, Mietbeginn, Laufzeit, Mietende, Zahlungsrhythmus, Zahlungsweise, Gesamtinvestitionskosten, Lastschrifteinzug, Asset_ID)
VALUES

(78451.001, 'TA', 'Fatina GVG Vermietungs KG', 25412, '2016-06-01', 180, '2031-05-31', 'monatlich', 'vorschüssig', '32650000.00', 1, 7845),
(78451.002, 'TA', 'Fatina GVG Vermietungs KG', 25412, '2017-01-01', 174, '2031-06-30', 'monatlich', 'vorschüssig', '22750000.00', 1, 8542),
(78451.003, 'TA', 'Fatina GVG Vermietungs KG', 25412, '2020-01-01', 138, '2031-06-30', 'monatlich', 'vorschüssig', '5000000.00', 1, 5472),
(68912.001, 'VA', 'Fatina GVG Vermietungs KG', 25412, '2022-08-01', 192, '2038-07-31', 'monatlich', 'nachschüssig', '17250000.00', 0, 6160),
(68912.002, 'VA', 'Fatina GVG Vermietungs KG', 25412, '2023-05-01', 183, '2038-07-31', 'monatlich', 'nachschüssig', '8900000.00', 0, 5509);

-- Vertragsereignis
INSERT INTO Vertragsereignis (Event_ID, Vertrag_ID, Ereignis, Ereignisdatum)
VALUES

(6262, 68912.001, 'Vertragsabschluss', '2021-10-19'),
(6161, 68912.001, 'Mietbeginn', '2022-08-01'),
(1602, 68912.001, 'Endabrechnung', '2023-12-01'),
(1808, 68912.001, 'Zinskonversion', '2032-07-31'),
(1511, 68912.002, 'Vertragsabschluss', '2023-01-08'),
(6647, 68912.002, 'Mietbeginn', '2023-05-01'),
(9999, 68912.002, 'Zinskonversion', '2033-07-31'),
(9880, 78451.001, 'Vertragsabschluss', '2015-08-09'),
(1243, 78451.001, 'Mietbeginn', '2016-06-01'),
(3621, 78451.001, 'Endabrechnung', '2019-12-31'),
(8488, 78451.001, 'Zinskonversion', '2026-01-01'),
(9157, 78451.002, 'Vertragsabschluss', '2016-06-15'),
(9138, 78451.002, 'Mietbeginn', '2017-01-01'),
(1843, 78451.002, 'Endabrechnung', '2020-10-01'),
(8741, 78451.002, 'Konversion', '2026-12-31'),
(2455, 78451.003, 'Vertragsabschluss', '2019-06-16'),
(1404, 78451.003, 'Mietbeginn', '2020-01-01'),
(2107, 78451.003, 'Endabrechnung', '2023-10-01'),
(2808, 78451.003, 'Zinskonversion', '2030-12-31');

-- Rechnung
INSERT INTO Rechnung (Rechnungsnummer, Rechnungsdatum, Betrag, Status, Vertrag_ID)
VALUES
('45871', '2024-01-02', '1910.60', 'offen', 78451.001),
('98652', '2024-02-12', '73.90', 'beglichen', 78451.001),
('89124', '2024-02-14', '50.34', 'beglichen', 78451.001),
('45812', '2024-03-01', '214438.00', 'offen', 78451.002),
('94283', '2024-03-01', '190638.00', 'offen', 78451.003),
('77412', '2022-06-01', '192185.00', 'offen', 68912.001),
('66842', '2024-03-01', '12495.00', 'offen', 68912.001),
('22661', '2024-03-01', '1785.00', 'offen', 68912.002);

-- Nachhaltigkeitsdaten 
INSERT INTO Nachhaltigkeitsdaten (Asset_ID, Abfragedatum, Erfassungsdatum, Stromverbrauch_kWh, Gasverbrauch_kWh)
VALUES

(7845, '2023-12-31', '2024-03-01', 54124, 87412),
(7845, '2022-12-31', '2023-08-07', 88741, 99651),
(8542, '2023-12-31', '2024-02-06', 77123, NULL),
(8542, '2022-12-31', '2023-02-02', 84131, 98512);

-- Anzeigetext
INSERT INTO Anzeigetext (Anzeigetext_ID, Text)
VALUES
(1, '"Einverständniserklärung zum elektronischen Rechnungsversand per E-Mail\nSehr geehrte Damen und Herren, im Zuge der Einführung der elektronischen Mietrechnungen ist eine Erstellung von Dauermietrechnungen nicht mehr möglich. Wir informieren Sie,

dass Sie ab sofort zu jeder Fälligkeit eine gesonderte Mietrechnung von uns erhalten. Die Ihnen vorliegenden Dauermietrechnungen sind somit ab der neuen Fälligkeit und Vorlage der neuen Mietrechnungen gegenstandslos. Sollten Sie noch nicht an unserem elektronischen Versand teilnehmen, bieten wir Ihnen hiermit die Gelegenheit, an diesem Verfahren teilzunehmen. Sofern Sie sich dazu entscheiden, nicht am elektronischen Versand teilzunehmen, erhalten Sie die Mietrechnungen sowie die Rechnungen über die Nebenkosten zu jeweiligen Fälligkeit in Papierform. Auswahlmöglichkeiten: Ich stimme zu."\n\nStimmen Sie zu?'),
(2, '"Einwilligung Änderung Datenschutzbedingungen\nSehr geehrte Damen und Herren, wir haben unsere Datenschutzbedingungen geändert, siehe [Link].\nStimmen Sie diesen zu?"');

-- Pop_Up
INSERT INTO Pop_Up (Nutzer_ID, Anzeigedatum, Anzeigetext_ID, Nutzerreaktion)
VALUES
(3312, '2024-03-31', 1, 'offen'),
(3312, '2024-03-15', 2, 'offen'),
(3340, '2024-03-31', 1, 'offen');



-- Postbox_Nachricht 
INSERT INTO Postbox_Nachricht (Nutzer_ID, Richtung, Datum, Text)
VALUES
(3312, 'DAL an Kunde', '2021-12-11', 'Sehr geehrter Herr Krieger, wunschgemäß bestätige ich Ihnen den Eingang der Vertragsunterlagen. Freundliche Grüße, Torsten Neumann (DAL Vertragsmanager)'),
(3340, 'DAL an Kunde', '2024-02-25', 'Sehr geehrter Herr Weber, wir bitten um Begleichung der offenen Rechnung. Bei Fragen melden Sie sich gerne! Freundliche Grüße, Ernst Mahnmann (DAL Rechnungswesen)'),
(3312, 'Kunde an DAL', '2021-12-13', 'Hallo Herr Neumann, klasse, dass das noch vor Geschäftsjahresende geklappt hat. Ihnen ein frohes Weihnachtsfest und einen guten Rutsch! Grüße, Anton Krieger');
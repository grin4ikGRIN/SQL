

use geld_her_v4;


-- a)	Erstellen Sie bitte zunächst einen *VIEW (namens „View_3“), der für alle *Produkte dessen *Namen und die *Anzahl der von ihm *verkauften Exemplare ermittelt. Nutzen Sie diesen VIEW bitte *anschließend, um die folgende Abfrage zu formulieren:
-- *Ausgabe aller vom VIEW ermittelten Werte

create view view_3 as
select 
	Produkt_Name,
    count(Abrechnung_ID)
from produkt as p
		left join abrechnung_produkt as ap on p.Produkt_id = ap.Produkt_ID
group by Produkt_Name;

drop view view_3;

select * from view_3;


-- b)	Erstellen Sie bitte zunächst einen *VIEW (namens „View_4“), der für alle *Kunden *Vor-, *Nachname und das *Datum ihrer (aktuell) *letzten Abrechnung ermittelt. (Wichtig: Das Attribut für *MAX(Datum) muss mittels eines *ALIAS (AS) eine eigenständige Bezeichnung erhalten (z.B. „*Letztes_Datum“) erhalten, um auf dieses Attribut später bei der Verwendung des VIEWs zugreifen zu können). Nutzen Sie diesen VIEW bitte anschließend, um die folgende Abfrage zu formulieren:
-- Ausgabe von *Vorname und *letztem Abrechnungs-Datum aller Kunden, die mit *Nachnamen *„Myrnow“ heißen.

create view view_4 as
select 
	Vorname,
    Nachname,
    max(Datum) as 'Letztes_Datum'
from kunde as k
		join abrechnung as a on k.Kunde_ID = a.Kunde_id
group by k.Kunde_ID, Vorname, Nachname;

select
	vorname,
    Letztes_Datum
from view_4
where nachname = 'Myrnow';

-- c)	Erstellen Sie bitte den neuen *User *„Kundenbetreuer“ (*localhost, *kein Passwort [man notiert dann einfach zwei Anführungszeichen ohne Leerzeichen dazwischen]). Er soll die *Rechte erhalten, *SELECT und *INSERT zu verwenden. Dies allerdings *nur für die *Tabelle *„Kunde“ in der Datenbank *„Geld_her“. (Hinweis: Sie können mit GRANT SELECT, INSERT … arbeiten, oder alternativ 2 einzelne GRANT-Statements absenden)
-- *Testen Sie die *Rechte-Vergabe bitte durch geeignete Beispiele.

create user 'Kundenbetreuer'@'localhost' identified by '';
grant select, insert on geld_her_v4.kunde to 'Kundenbetreuer'@'localhost';
grant select,insert on *.* to 'Kundenbetreuer'@'localhost';

select 
	host,
    user,
    password,
    select_priv,
    insert_priv
from mysql.user;


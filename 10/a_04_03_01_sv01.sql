

use geld_her_v4;

/*
a)	Erstellen Sie bitte zunächst einen VIEW (namens „View_1“), der für alle Produkte den Produktnamen, den Preis und den zugehörigen Speditionsnamen ermittelt. 
Nutzen Sie diesen VIEW bitte anschließend, um die folgende Abfrage zu formulieren:
Ausgabe von Produktname und zugehörigem Speditionsnamen des Produkts mit dem größten Preis.
*/

create view View_1 as
select
	Produkt_Name,
    Euro_Preis,
    Spedition_Name
from produkt as p
		join hersteller as h on p.Hersteller_ID = h.Hersteller_ID
        join spedition as s on h.Spedition_ID = s.Spedition_ID;
        
select
	produkt_name,
    Spedition_Name
from view_1
where euro_preis = (select max(Euro_Preis) from view_1);	
-- im subselect nach dem from sollte man den namen des views schreiben, da in einem view nicht alle Daten gespeichert werden können und der Name der Tabelle nicht bekannt sein könnte

/*
b)	Erstellen Sie bitte zunächst einen VIEW (namens *„View_2“), der für alle Produkte den *Produktnamen, den *Preis und zugehörigen *Herstellernamen ermittelt. Nutzen Sie diesen *VIEW bitte *anschließend, um die folgende Abfrage zu formulieren:
Ausgabe der *drei *teuersten Produkte (*Produktname, *Preis und zugehöriger *Herstellername)
*/

create view View_2 as
select
	Produkt_Name,
    Euro_Preis,
    h.Hersteller_Name
from produkt as p
		join hersteller as h on p.Hersteller_ID = h.Hersteller_ID;
        
select
	*
from view_2
order by euro_preis desc 
limit 3;

/*
c)	Erstellen Sie bitte den neuen User *„Admin“ (Passwort: *„1234abcd“). Er soll für alle Datenbanken und für alle Tabellen auf dem MySQL-Server das Recht haben, Abfragen zu stellen, sofern er sich vom „localhost“ anmeldet. 
Testen Sie dies, indem Sie sich anschließend als Admin anmelden und sich die gesamte Tabelle „Kunde“ anzeigen lassen.
*/

create user 'admin'@'localhost' identified by '1234abcd';
grant select on *.* to 'admin'@'localhost';




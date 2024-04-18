

USE Geld_her_v03;

/*
a)	Für alle Fälle, in denen ein bestimmter Kunde ein bestimmtes Produkt mindestens 1-mal kaufte, soll der Produktname zusammen mit Vor- und Nachname des Kunden ausgegeben werden. Es sollen aber auch Vor- und Nachname jener Kunden ausgegeben werden, die bisher noch nichts bei „Geld_her“ bestellt haben.
*/

select distinct
    Vorname,
    Nachname,
    Produkt_Name
from kunde 	left	join abrechnung 			on kunde.Kunde_ID 					= 	abrechnung.Kunde_id
			left	join abrechnung_produkt 	on abrechnung.Abrechnung_ID 		= 	abrechnung_produkt.Abrechnung_ID
			left	join produkt 				on abrechnung_produkt.Produkt_ID 	= 	produkt.Produkt_id;

/*
b)	Für alle Fälle, in denen ein bestimmter Kunde ein bestimmtes Produkt mindestens 1-mal kaufte, soll der Produktname zusammen mit Vor- und Nachname des Kunden ausgegeben werden. Es sollen aber auch die Namen jener Produkte ausgegeben werden, die bisher bei „Geld_her“ noch nicht bestellt wurden.
*/

select distinct
	Produkt_Name,
    Vorname,
    Nachname
from kunde 	right 	join abrechnung on kunde.Kunde_ID = abrechnung.Kunde_id
			right 	join abrechnung_produkt on abrechnung.Abrechnung_ID = abrechnung_produkt.Abrechnung_ID
            right	join produkt on abrechnung_produkt.Produkt_ID = produkt.Produkt_id;

/*
c)	Für alle Fälle, in denen zu einer bestimmten Abrechnung eine bestimmte Spedition mindestens 1 bestelltes Produkt lieferte, soll das Kalenderdatum der Abrechnung und der Speditionsnamen ausgegeben werden. Es sollen aber auch Speditionen angezeigt werden, die bisher noch kein Produkt auslieferten.
*/

select distinct
	Spedition_Name,
    datum    
from spedition	left	join hersteller on spedition.Spedition_ID = hersteller.Spedition_ID
				left	join produkt on hersteller.Hersteller_ID = produkt.Hersteller_ID
                left	join abrechnung_produkt on produkt.Produkt_id = abrechnung_produkt.Abrechnung_ID
                left	join abrechnung on abrechnung_produkt.Abrechnung_ID = abrechnung.Abrechnung_ID;

/*
d)	Für alle Produkte, die mindestens 50 Euro kosten, soll Produktname und Herstellername ausgegeben werden. Es sollen aber auch Hersteller angezeigt werden, die aktuell kein Produkt im Sortiment von „Geld_her“ haben, oder für die gilt, dass deren Produktpreise alle unter 50 Euro liegen. Lösen Sie bitte die Aufgabe, indem Sie die „inhaltliche“ Preis-Bedingung einmal MIT und einmal OHNE WHERE-Klausel abarbeiten. Notieren Sie den Unterschied bitte schriftlich.
*/

select
	Produkt_Name,
    Hersteller_Name
from produkt right join hersteller on produkt.Hersteller_ID = hersteller.Hersteller_ID
where Euro_Preis >= 50;

/*aus der Lösung:

SELECT Produkt_Name,Hersteller_Name
FROM Produkt RIGHT JOIN Hersteller ON Produkt.Hersteller_ID=Hersteller.Hersteller_ID AND Euro_Preis>=50;

*/



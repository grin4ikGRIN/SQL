-- a_03_01_02_v01

use geld_her;

/*
a)	Vor- und Nachname der Person, die Abrechnung 2 eingereicht hat.
*/
-- Schritt 1:
select * from abrechnung;

-- Schritt 2:
select * 
from abrechnung
	join kunde on kunde.Kunde_ID = abrechnung.Kunde_id;

-- Schritt 3:
select 
	Vorname,
    Nachname
from abrechnung
	join kunde on kunde.Kunde_ID = abrechnung.Kunde_id
where Abrechnung_ID = 2;

/*
b)	Name der Spedition, die für den Transport des Produkts „solver premium“ zuständig ist.
*/

select
	Spedition_Name
from spedition 
		join hersteller on spedition.Spedition_ID = hersteller.Spedition_ID
        join produkt on produkt.Hersteller_ID = hersteller.Hersteller_ID
where Produkt_Name = 'solver premium';

/*

c)	Name aller Hersteller, die mindestens ein Produkt im Sortiment von „Geld_her“ haben. Ausgabe nach Herstellername abfallend. Dubletten sind zu vermeiden. Es sollen allerdings nur Produkte mit einer ID>2 berücksichtigt werden.   
*/
select
	distinct hersteller_name
from hersteller, produkt
where 	hersteller.Hersteller_ID = produkt.Produkt_id and
		Produkt_id > 2
order by Hersteller_Name desc;
/*
d)	Name aller Speditionen, die Produkte transportieren (würden), sofern deren Preis zwischen (beiderseits einschließlich) 10 und 1000 Euro liegen. Ausgabe alphabetisch sortiert. Keine Dubletten. 
(Hinweis: „würden“ bezieht sich auf die Tatsache, dass nicht problematisiert wird, ob dieses Produkt auch wirklich gekauft, bzw. ob es entsprechend jemals transportiert wurde.)
*/
select
	spedition_name
from spedition;

select
	distinct spedition_name
from spedition
join hersteller on spedition.Spedition_ID = hersteller.Spedition_ID
join produkt on hersteller.Hersteller_ID = produkt.Hersteller_ID
where Euro_Preis between 10 and 1000;

/*
e)	Name aller Speditionen, die (tatsächlich) Produkte transportierten, sofern deren Preis zwischen (beiderseits einschließlich) 10 und 1000 Euro liegen. Ausgabe alphabetisch sortiert. Keine Dubletten. 
(Hinweis: „tatsächlich“ bezieht sich auf die Tatsache, dass nun nur Produkte berücksichtigt werden, die auch wirklich gekauft wurden, bzw. für deren Einkauf es einen entsprechenden Eintrag in der Hilfstabelle gibt.)
*/

select
	distinct spedition_name
from spedition
join hersteller on spedition.Spedition_ID = hersteller.Spedition_ID
join produkt on hersteller.Hersteller_ID = produkt.Hersteller_ID
join abrechnung_produkt on produkt.Produkt_id = abrechnung_produkt.Produkt_ID
where (Euro_Preis between 10 and 1000);

/*f)	Die drei teuersten Produkte, die jemals von Elli Rot gekauft wurden. Ausgabe pro Produkt: Name und Preis, sowie das jeweilige Einkaufsdatum. Dubletten werden zugelassen, da diese lediglich Ausdruck der Tatsache wären, dass ein Produkt am selben Tag mehrfach von Elli Rot gekauft wurde.


*/


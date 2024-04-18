
use geld_her;

/*
a)	Für jede Abrechnung soll deren Datum, Kunden-ID und Nachnamen des Kunden, der diese Abrechnung einreichte, ausgegeben werden. Ausgabe nach Datum abfallend sortiert, auf 10 Datensätze begrenzt.
*/

select
	abrechnung.Kunde_id,
    Datum,
    Nachname
from abrechnung join kunde on abrechnung.Kunde_id = kunde.Kunde_ID
order by datum desc limit 10;


/*
b)	Für alle Produkte soll der Produktname, Preis und Herstellername ausgegeben werden, allerdings nur, wenn das Produkt weniger als 1000 Euro kostet. Ausgabe alphabetisch sortiert (erstes Kriterium Herstellername, 2. Kriterium Produktname).
*/

select
	produkt_name,
    Euro_Preis,
    hersteller_name
from produkt join hersteller on produkt.Hersteller_ID = hersteller.Hersteller_ID
where Euro_Preis < 1000
order by Hersteller_Name, Produkt_Name asc;

select
	produkt_name,
    Euro_Preis,
    hersteller_name
from produkt, hersteller
where (produkt.Hersteller_ID = hersteller.Hersteller_ID) and
(Euro_Preis < 1000)
order by Hersteller_Name, Produkt_Name asc;

/*
c)	Von allen Kunden sollen Vor- und Nachname ausgegeben werden, sofern der jeweilige Kunde mindestens 1-mal das Produkt „tool 2.0“ kaufte. Ausgabe alphabetisch sortiert nach (1.) Nachname und (2.) Vorname. Ausgabe-Dubletten sollen vermieden werden.
*/
select * from abrechnung;
select * from abrechnung_produkt;
select * from produkt;

select
	vorname,
    nachname
from kunde 
join abrechnung on kunde.Kunde_ID = abrechnung.Kunde_id
join abrechnung_produkt on abrechnung.Abrechnung_ID = abrechnung_produkt.Abrechnung_ID
join produkt on abrechnung_produkt.Produkt_ID = produkt.Produkt_id
where Produkt_Name = 'tool 2.0'
order by nachname, vorname asc;


/*
d)	Name aller Produkte, die am 16. Oktober 2021 gekauft wurden. Ausgabe alphabetisch sortiert, Vermeidung von Dubletten.  Die ersten 2 Treffer sollen jedoch übersprungen, und nur die 3 folgenden ausgegeben werden. 
*/

select
	distinct produkt_name
from produkt, abrechnung_produkt, abrechnung
where 	(produkt.Produkt_id = abrechnung_produkt.Produkt_ID) and
		(abrechnung_produkt.Abrechnung_ID = abrechnung.Abrechnung_ID) and
(Datum = '2021-10.16')
order by Produkt_Name asc limit 2,3;

/*
e)	Ausgabe aller Kalenderdaten, an denen die Spedition „Speedvan GmbH“ mindestens 1 Produkt der Firma „Geld_her“ transportierte. Erneut sollen Dubletten vermieden werden. Ausgabe chronologisch sortiert. Ausgabe auf 100 Datensätze begrenzt.
*/

select 
	distinct datum
from abrechnung
join abrechnung_produkt on abrechnung.Abrechnung_ID = abrechnung_produkt.Abrechnung_ID
join produkt on abrechnung_produkt.Produkt_ID = produkt.Produkt_id
join hersteller on produkt.Hersteller_ID = hersteller.Hersteller_ID
join spedition on hersteller.Spedition_ID = spedition.Spedition_ID
where Spedition_Name = 'Speedvan GmbH'
order by datum asc limit 100;

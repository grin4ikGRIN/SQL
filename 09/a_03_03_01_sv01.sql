

use geld_her_v4;
-- a)	Ausgabe der kleinsten und größten Speditions-ID, sowie der Anzahl der Speditionen (bzw. die Anzahl der Speditions-IDs, die nach Definition ja alle ungleich NULL sind).  

select
	min(Spedition_ID),
    max(Spedition_ID),
	count(Spedition_ID)
from spedition
where Spedition_ID is not null;

select
	min(Spedition_ID),
    max(Spedition_ID),
	(select count(*) from spedition where Spedition_ID is not null)
from spedition;

-- b)	Durchschnittlicher Preis aller bisher verkauften Produkte. Ausgabe unter der Überschrift „Durchschnittspreis“.

select
	cast(avg(Euro_Preis) as decimal(10,2))
from produkt as p
	join abrechnung_produkt as ap on p.Produkt_id = ap.Produkt_ID; 

-- c)	Pro Abrechnung: *Kalenderdatum und *Gesamtbestellsumme. *Sortiert nach *Gesamtbestellsumme *abfallend.

select
	Datum,
    sum(Euro_Preis) as 'Gesamtsumme'
from abrechnung as a
	join abrechnung_produkt as ap on a.Abrechnung_ID = ap.Abrechnung_ID
	join produkt as p on ap.Produkt_ID = p.Produkt_id
group by a.Abrechnung_ID, datum
order by Gesamtsumme desc;

-- d)	Pro Kunde: Kunden-ID, Nachname und Anzahl der von ihm bestellten Produkte. Ausgabe nach 1.) Anzahl abfallend und 2.) Nachname aufsteigend sortiert.

select
	k.Kunde_ID,
    Nachname,
    count(Produkt_ID) as 'Anzahl_Produkte'
from kunde as k
	join abrechnung as a on k.Kunde_ID = a.Kunde_id
    join abrechnung_produkt as ap on a.Abrechnung_ID = ap.Abrechnung_ID
group by k.Kunde_ID, Nachname
order by Anzahl_Produkte desc, Nachname asc;

-- e)	Pro Hersteller: Herstellername und Anzahl der Produkte im Sortiment von „Geld_her“. Ausgabe sortiert nach Anzahl abfallend. Es sollen aber nur Hersteller berücksichtigt werden, die mindestens 1 Produkt im Sortiment haben.

select
	h.Hersteller_ID,
    Hersteller_Name,
    count(Produkt_id) as 'Anzahl_Produkte'
from hersteller as h
	join produkt as p on h.Hersteller_ID = p.Hersteller_ID
group by h.Hersteller_ID, Hersteller_Name
order by Anzahl_Produkte desc;

-- f)	Pro Produkt: *Produktname und *Anzahl der bestellten Exemplare. Ausgabe *sortiert nach *Anzahl *abfallend, *begrenzt auf 3. (Es sollen aber nur Produkte berücksichtigt werden, die mindestens 1-mal bestellt wurden.)

select 
	Produkt_Name,
    count(p.Produkt_id) as 'Anzahl_Exemplare'
from produkt as p
	join abrechnung_produkt as ap on p.Produkt_id = ap.Produkt_ID
group by p.Produkt_id, Produkt_Name
order by Anzahl_Exemplare desc
limit 3;


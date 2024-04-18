
use geld_her_v4;



/*
Formulieren Sie bitte entsprechende SQL-Anweisungen für folgende Aufgabestellungen: 

a)	Ausgabe der kleinsten und größten Speditions-ID, sowie der Anzahl der Speditionen (bzw. die Anzahl der Speditions-IDs, die nach Definition ja alle ungleich NULL sind).  
*/

select
	min(spedition_ID),
    max(spedition_ID),
    count(*)
from Spedition;

/*
b)	Durchschnittlicher Preis aller bisher verkauften Produkte. Ausgabe unter der Überschrift „Durchschnittspreis“.
*/

select
	avg(Euro_preis) as Durchschnittspreis
from produkt
		join abrechnung_produkt on produkt.produkt_id = abrechnung_produkt.produkt_id;

/*
c)	Pro Abrechnung: Kalenderdatum und Gesamtbestellsumme. Sortiert nach Gesamtbestellsumme abfallend.
*/

select * from abrechnung a;
select * from abrechnung_produkt ap;
select * from produkt p;

select
	a.abrechnung_id,
	a.datum,
    sum(euro_preis)
from abrechnung as a
		join abrechnung_produkt as ap on a.abrechnung_id = ap.abrechnung_id
        join produkt as p on ap.produkt_id = p.produkt_id
group by a.Abrechnung_ID/*, datum*/
order by sum(euro_preis) desc;


/*d)	Pro Kunde: Kunden-ID, Nachname und Anzahl der von ihm bestellten Produkte. 
Ausgabe nach 1.) Anzahl abfallend und 2.) Nachname aufsteigend sortiert.
*/

select * from abrechnung a;
select * from abrechnung_produkt ap;
select * from produkt p;

select
	k.kunde_id,
    nachname,
	count(ap.produkt_id) as 'bestellte_Produkte'
from kunde as k
		join abrechnung as a on k.kunde_id = a.kunde_id
        join abrechnung_produkt as ap on a.abrechnung_id = ap.abrechnung_id
group by k.kunde_id, nachname
order by bestellte_Produkte desc, nachname asc;


/*e)	Pro Hersteller: Herstellername und Anzahl der Produkte im Sortiment von „Geld_her“. 
Ausgabe sortiert nach Anzahl abfallend. Es sollen aber nur Hersteller berücksichtigt werden, die mindestens 1 Produkt im Sortiment haben.
*/

select
	h.hersteller_id,
	hersteller_name,
    count(produkt_id) as 'Anzahl_Produkte'
from hersteller as h
		/*left*/ join produkt as p on h.hersteller_id = p.hersteller_id
/*where produkt_id is not null*/
group by hersteller_name
having count(produkt_id) > 0
order by anzahl_produkte desc;



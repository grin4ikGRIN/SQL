
use geld_her_v4;

/*
b)	Jüngstes Kalenderdatum aller Abrechnungen.
*/

select max(datum) from abrechnung;

/*
c)	Anzahl der verkauften Produkt-TYPEN. (Alternative Formulierung: Anzahl der Produkttypen, die mindestens 1-mal verkauft wurden.)
*/

select count(distinct produkt_id) from abrechnung_produkt;

/*
d)	Billigstes und teuerste Produkt im Sortiment von „Geld_her“. Es sollen aber nur die Produkte aus der Preisspanne (beiderseits einschließlich) 20 und 60 Euro berücksichtigt werden.
e)	Pro Spedition: *Speditionsname und *Anzahl der von ihr bisher transportierten Exemplare. Ausgabe nach Anzahl *abfallend sortiert. Es sollen aber nur Speditionen berücksichtigt werden, die mindestens *1 Produkt transportierten.
*/

select
	s.Spedition_ID,
    Spedition_Name,
    count(ap.Produkt_ID)
from spedition as s
		join hersteller as h on s.Spedition_ID = h.Spedition_ID
        join produkt as p on h.Hersteller_ID = p.Hersteller_ID
        join abrechnung_produkt as ap on p.Produkt_id = ap.Produkt_ID
group by s.Spedition_ID, Spedition_Name
order by count(ap.Produkt_ID) desc;


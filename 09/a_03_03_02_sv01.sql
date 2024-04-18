

use geld_her_v4;


-- a)	Durchschnittspreis aller von Elli Rot im Mai 2021 gekauften Waren.
-- b)	Gesamteinnahme von „Geld_her“ beim Verkauf von „tool 2.0“.
-- c)	*PRO Produkt: *Produktname und *Gesamteinnahme. Ausgabe nach *Gesamteinnahme *abfallend sortiert. Es sollen *nur Produkte berücksichtigt werden, die mindestens *1-mal bestellt wurden.

select
	p.Produkt_id,
    Produkt_Name,
    sum(Euro_Preis) as 'Gesamteinnahme'
from produkt as p
	join abrechnung_produkt as ap on p.Produkt_id = ap.Produkt_ID
group by p.Produkt_id, Produkt_Name
order by Gesamteinnahme desc;


-- d)	*PRO Produkt: *Produktname und *Gesamteinnahme. Ausgabe *nach Gesamteinnahme *abfallend sortiert. Es sollen aber nur Produkte berücksichtigt werden, deren Gesamteinnahme *über *100 Euro liegt.


select
	p.Produkt_id,
    Produkt_Name,
    sum(Euro_Preis) as 'Gesamteinnahme'
from produkt as p
	join abrechnung_produkt as ap on p.Produkt_id = ap.Produkt_ID
group by p.Produkt_id, Produkt_Name
having gesamteinnahme > 100
order by Gesamteinnahme desc;

-- e)	*PRO Kunde: *Vor-, *Nachname und die *Anzahl der Speditionen, die ihn mindestens 1-mal belieferten. Ausgabe *nach Anzahl *abfallend sortiert. Es sollen nur Kunden berücksichtigt werden, die *mindestens von 1 Spedition und *maximal von 4 Speditionen beliefert wurden.


-- f)	PRO *1.) Spedition *2.) Kunde soll *Speditionsnamen und *Vor- und *Nachnamen des Kunden, sowie die *Gesamtbestellsumme ausgegeben werden. Ausgabe *sortiert nach *1.) Bestellsumme *abfallend und *alphabetisch sortiert nach *2.) Speditionsnamen *3.) Kundennachname *4.) Kundenvorname. Ausgabe allerdings nur, falls der pro Spedition/Kunden-Kombination bestellte *Durchschnitts-Preis *über 25 Euro liegt. HINWEIS: GROUP BY Attribut1, Attribut2 gruppiert nach der entsprechenden Kombination dieser beiden Attribute.

select
	spedition_name,
    vorname,
    nachname,
    sum(euro_preis) as 'Gesamtbestellsumme'
FROM Kunde,Abrechnung,Abrechnung_Produkt,Produkt,Hersteller,Spedition
WHERE Kunde.Kunde_ID=Abrechnung.Kunde_id
      AND Abrechnung.Abrechnung_ID=Abrechnung_Produkt.Abrechnung_ID
      AND Abrechnung_Produkt.Produkt_ID=Produkt.Produkt_id
      AND Produkt.Hersteller_ID=Hersteller.Hersteller_ID
      AND Hersteller.Spedition_ID=Spedition.Spedition_ID
group by spedition.Spedition_ID, kunde.Kunde_ID, spedition_name, vorname, nachname
having avg(euro_preis) > 25
order by Gesamtbestellsumme desc, spedition_name, nachname, vorname;
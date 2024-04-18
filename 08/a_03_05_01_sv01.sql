

-- a_03_05_01_sv01

USE Geld_her_v4;

/*
a)	Es sollen alle Kunden (ID, Vorname, Nachname) ausgegeben werden, die den gleichen Nachnamen wie Kunde 3 haben. 
*/

select Nachname from kunde where kunde_id = 3;	-- das ist der subselect

select
	kunde_id,
    Vorname,
    Nachname
from kunde
where Nachname = (select Nachname from kunde where kunde_id = 3);



-- b)	Identische Ausgabe wie in a), nun aber mit Ausnahme von Kunde 3.

select
	kunde_id,
    Vorname,
    Nachname
from kunde
where 	Nachname = (select Nachname from kunde where kunde_id = 3) and
		not Kunde_ID = 3;		-- alternativ: kunde_ID != 3


/*
c)	Es sollen alle „teuersten Produkte“ (ID, Produktname und Preis) ausgegeben werden. 
Hinweise: 
(1)	Bekanntlich kann es mehrere Produkte geben, die sich gemeinsam den Titel „teuerste Produkt“ teilen, da sie untereinander den identischen Preis haben, aber teurer als alle anderen Produkte sind.
(2)	Diese Aufgabe konnten wir bisher weder mittels GROUP BY lösen (denn wir konnten dem maximalen Preis nicht „den“ entsprechenden Produktnamen zuordnen) …
… noch mittels ORDER BY Euro_Preis DESC LIMIT x (denn wir kannten x nicht).
*/

select * from produkt;

select 
	Produkt_id,
    Produkt_Name,
    Euro_Preis
from produkt
where Euro_Preis = (select max(euro_preis) from produkt);
-- hier kann im WHERE der Gleichheitsoperator verwendet werden, da der subselect IMMER nur genau 1 Wert zurückliefert, auf den verglichen wird


/*
c.2	Es sollen alle „teuersten Produkte“ und alle billigsten (ID, Produktname und Preis) ausgegeben werden. 
*/

select 
	Produkt_id,
    Produkt_Name,
    Euro_Preis
from produkt
where 	Euro_Preis in ((select max(euro_preis) from produkt),(select min(euro_preis) from produkt));
/*
dasselbe klassisch:
where 	Euro_Preis = (select max(euro_preis) from produkt) or
		Euro_Preis = (select min(euro_preis) from produkt);
*/

-- d)	Es sollen alle Kunden (Vorname, Nachname) ausgegeben werden, die bisher weniger Produkte bestellten, als alleine auf der Abrechnung 3 bestellt worden sind.

select * from abrechnung_produkt
where Abrechnung_ID = 3;

select count(Produkt_ID) from abrechnung_produkt
where Abrechnung_ID = 3;

select 
	vorname,
    Nachname
from kunde as k
		join abrechnung as a on k.Kunde_ID = a.Kunde_id
        join abrechnung_produkt as ap on a.Abrechnung_ID = ap.Abrechnung_ID;
        
select 
	k.Vorname, 
    k.Nachname,
	count(Produkt_ID) 'anzahl'
from kunde as k
		join abrechnung as a on k.Kunde_ID = a.Kunde_id
        join abrechnung_produkt as ap on a.Abrechnung_ID = ap.Abrechnung_ID
group by k.Kunde_id, k.Vorname, k.Nachname
having anzahl < (select count(Produkt_ID) from abrechnung_produkt as ap where Abrechnung_ID = 3);


-- e)	Es soll die Anzahl der Produkte ermittelt werden, die billiger sind als die Gesamtbestellsumme von Kunde 5.


select
	sum(Euro_Preis)
from produkt as p
		join abrechnung_produkt as ap on p.Produkt_id = ap.Produkt_ID
        join abrechnung as a on ap.Abrechnung_ID = a.Abrechnung_ID
group by Kunde_id
having Kunde_id = 5;

select
	sum(Euro_Preis) 'Summe'
from produkt as p
		join abrechnung_produkt as ap on p.Produkt_id = ap.Produkt_ID
        join abrechnung as a on ap.Abrechnung_ID = a.Abrechnung_ID
group by Kunde_id
having Kunde_id = 5;


-- Lösung:


select 
	count(Produkt_id)
from produkt
where Euro_Preis < (select
						sum(Euro_Preis) 'Summe'
					from produkt as p
							join abrechnung_produkt as ap on p.Produkt_id = ap.Produkt_ID
							join abrechnung as a on ap.Abrechnung_ID = a.Abrechnung_ID
					where Kunde_id = 5);
                    /*group by Kunde_id
					having Kunde_id = 5)*/


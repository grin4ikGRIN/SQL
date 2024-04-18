
use geld_her_v4;


-- a)	Es sollen *(fast) alle Produkte *(ID, Produktname und Preis) ausgegeben werden. *Ausnahme soll jedoch das Produkt mit der *größten ID sein. Ausgabe *numerisch sortiert nach *Produkt-ID. 

select max(produkt_id) from produkt;

select
	produkt_id,
    produkt_name,
    euro_preis
from produkt
where produkt_id != (select max(produkt_id) from produkt)
order by produkt_id asc;




-- b)	Es sollen alle Kunden *(ID, Vorname, Nachname) ausgegeben werden, die nach der *letzten Abrechnung von *Kunden 4 noch die Seite von „Geld_her“ *besucht haben.

select 
	max(datum) 
from abrechnung
where kunde_id = 4;

select
	k.kunde_id,
    vorname,
    nachname
from kunde as k
	join abrechnung as a on k.kunde_id = a.kunde_id
    join abrechnung_produkt as ap on a.abrechnung_id = ap.abrechnung_id
where datum > (select max(datum) from abrechnung where kunde_id = 4);

-- c)	Es sollen *alle Kunden +(Vorname, Nachname) ausgegeben werden, die *vor dem November 2021 *mindestens eines jener Produkte gekauft haben, die dann auch *während des Novembers gekauft worden sind.

select distinct
	vorname,
    nachname
from kunde as k
	join abrechnung as a on k.kunde_id = a.kunde_id
    join abrechnung_produkt as ap on a.abrechnung_id = ap.abrechnung_id
where datum < '2021-11-01' and produkt_id in (select produkt_id from abrechnung as a
									join abrechnung_produkt as ap on a.abrechnung_id = ap.abrechnung_id
								where datum between '2021-11-01' and '2021-11-30');

select produkt_id from abrechnung as a
			join abrechnung_produkt as ap on a.abrechnung_id = ap.abrechnung_id
where datum between '2021-11-01' and '2021-11-30';



-- d)	Es sollen alle Produkte (ID und Name) jener Hersteller ausgegeben werden, von denen mindestens ein Produkt stammt, das auf der Abrechnung 1 bestellt wurde.

SELECT Hersteller.Hersteller_ID
          					FROM Abrechnung_Produkt,Produkt,Hersteller
                            WHERE Abrechnung_Produkt.Produkt_ID=Produkt.Produkt_id
                                  AND Produkt.Hersteller_ID=Hersteller.Hersteller_ID
                                  AND Abrechnung_ID=1;
 
-- Reduzierte Version
SELECT Hersteller_ID
          					FROM Abrechnung_Produkt,Produkt
                            WHERE Abrechnung_Produkt.Produkt_ID=Produkt.Produkt_id
                                                              AND Abrechnung_ID=1;

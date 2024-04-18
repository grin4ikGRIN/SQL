
-- a_04_02_01_sV01
use geld_her_v4;

/*
a)	Alle Speditionen sollen den Zusatz „GmbH“ erhalten. Dies soll allerdings nur für Speditionen gelten, deren Bezeichnung nicht auf „AG“ oder gar „GmbH“ enden.
*/
select * from spedition;

select * from spedition
where not (spedition_name like '% AG%' or spedition_name like '% GmbH%');

select * from spedition
where not spedition_name like '% AG%' and not spedition_name like '% GmbH%';


select
	*,
    concat(spedition_name, ' GmbH')
from spedition
where not spedition_name like '% AG%' and not spedition_name like '% GmbH%';

-- b)	Gesucht werden die *drei längsten Herstellernamen (*Leerzeichen innerhalb der Bezeichnung werden mitgezählt). Ausgabe sortiert *nach Länge *abfallend.

select 
	*,
    char_length(hersteller_name) as 'Länge'
from hersteller
order by Länge desc
limit 3;
-- diese Lösung ist nicht optimal = nicht allgemeingültig, da z.B. weitere Hersteller mit einem 9stelligen Nachnamen nicht angezeigt würden


-- c)	Es sollen alle *Email-Adressen von *Kunden ausgegeben werden, die mindestens *einmal das Produkt *„solver premium“ gekauft haben. Es sollen aber *nur Einkäufe berücksichtigt werden, die auf Abrechnungen mit einer ID zwischen (beiderseits *ausschließlich) *1 und 9 bestellt wurden.

-- Hinweise: 
-- -	Die Lösung sollte mittels *NATURAL JOIN geschehen
-- -	Die Lösung sollte ausnutzen, dass gleichnamige Spalten zu einer zusammengefasst werden. (Man sagt: Die *Dublette wird *„ausgeblendet“) 

select
	email
from Kunde as k
		join abrechnung as a on k.kunde_id = a.kunde_id
        join abrechnung_produkt as ap on a.abrechnung_id = ap.Abrechnung_id
        join produkt as p on p.produkt_id = ap.Produkt_id
where 	produkt_name = 'solver premium' and
		a.abrechnung_id > 1 and
        a.abrechnung_id < 9;

-- d)	Von Kunden 3 wurde am 2. Mai 2022 eine neue Abrechnung eingereicht. Auf dieser wurde 2-mal das Produkt mit der ID 3, und 1-mal das Produkt mit der ID 4 bestellt. 

select * from kunde;
select * from abrechnung;
select * from abrechnung_produkt;

insert into abrechnung(kunde_id, datum) values
	(3,'2022-05-02');
insert into abrechnung_produkt(abrechnung_id, produkt_id) values
	(12,3),
	(12,3),
	(12,4);






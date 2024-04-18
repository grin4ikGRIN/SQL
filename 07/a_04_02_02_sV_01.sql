
-- a_04_02_02_sV_01
use geld_her_v4;

-- a)	Geben Sie bitte *alle Preise zusammen mit der *Ergänzung „ €“ unter der *Überschrift „Produkt-Preis“ aus. Die Ausgabe soll *numerisch sortiert nach der *Größe des *Preises geschehen.

select 
	concat(euro_preis, ' €') as 'Produkt-Preis'
from produkt
order by Euro_Preis desc;

-- b)	Geben Sie bitte für alle Kunden den Text: *Frau + *Vorname + *Nachname aus, sofern der Vorname mit einem *„a“ endet.

select
	concat('Frau',' ', vorname,' ', nachname)
from kunde
where Vorname like '%a';


/*
-- c)	Lösen Sie die folgenden Aufgaben bitte mittels NATURAL [LEFT,RIGHT] JOIN
(1)	Name aller Produkte, die mindestens 1-mal gekauft wurden.
(2)	Pro *Hersteller: *Name und *Anzahl seiner verkauften Produkte. (Es sollen auch Hersteller berücksichtigt werden, die bisher *kein Produkt verkauften)
*/


/*
d)	Erstellen Sie bitte für folgende Aufgaben jeweils eine SQL-Anweisung:
(1)	Es soll der neue Hersteller *„Asterix AG“ eingepflegt werden. Von ihm stammen die Produkte *„Astra I“ (*200 Euro) und *„Astra II“ (*350 Euro). Dieser Hersteller arbeitet zusammen mit der Spedition *„Obelix GmbH & Co. KG“.
(2)	In einem *ersten Durchlauf sollen alle Produkt-Preise *um 10% erhöht werden. Anschließend sollen all jene Produkte auf den Preis *100 Euro gesetzt werden, deren Preis nach der Erhöhung nun *über 100 Euro liegen würde.
*/

select * from spedition; 
select * from hersteller; 
select * from produkt; 

insert into spedition(spedition_name) value
	('Obelix GmbH & Co. KG');

insert into hersteller(spedition_id, hersteller_name) values
	(7, 'Asterix AG');

insert into produkt(hersteller_id, produkt_name, euro_preis) values
	(6,'Astra I',200),
	(6,'Astra II',350);
    
    
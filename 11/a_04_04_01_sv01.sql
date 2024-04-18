

create database a_04_04_01_sv01;

use a_04_04_01_sv01;

create table tbl_pfleger
(
	pfleger_ID int auto_increment primary key,
    vorname varchar(50) null,
    nachname varchar(50) null
);

insert into tbl_pfleger(vorname, nachname) values
	('Hans','Müller'),
	('Klaus','Mayer'),
	('Peter','Schmidt');
    
select * from tbl_pfleger;

create table tbl_stall
(
	kennziffer int auto_increment primary key,
    pfleger_ID int not null,
    foreign key(pfleger_ID) references tbl_pfleger(pfleger_ID) on delete no action on update no action
);

insert into tbl_stall(pfleger_ID) values
	(1),
	(1),
	(2),
	(3),
	(2);
    
select * from tbl_stall;

create table tbl_tier
(
	tier_ID int auto_increment primary key,
    tierart varchar(50) null,
    tiername varchar(50) null,
    futterBezeichnung varchar(100) not null,
    kennziffer int,
    foreign key(kennziffer) references tbl_stall(kennziffer) on delete no action
);

insert into tbl_tier(tierart, tiername,futterBezeichnung,kennziffer) values
	('Löwe','Leo','Fleisch',1),
	('Löwe','Lui','Fleisch',1),
	('Zebra','Streifi','Heu, Möhre',2),
	('Zebra','Strufi','Heu, Möhre',3),
	('Zebra','Strafi','Heu, Möhre',3),
	('Hase','Löffel','Möhre',3),
	('Hase','Luffel','Möhre',4),
	('Hase','Laffel','Möhre',5);

select * from tbl_tier;

-- c)	Die Namen aller Futtersorten, die an Zebras verfüttert werden können.

select futterBezeichnung from tbl_tier
where tierart = 'Zebra';

-- d)	Für alle Tiere aus Stall 3 wird Name und Tierart gesucht.
select 
	tiername, 
    tierart
from tbl_tier
where kennziffer = 3;

-- e)	Alle Tiernamen der von „Müller“ betreuten Tiere.

select
	tiername
from tbl_tier as t
	join tbl_stall as s on t.kennziffer = s.kennziffer
    join tbl_pfleger as p on s.pfleger_ID =p.pfleger_ID
where nachname = 'Müller';

-- f)	Alle Ställe, in denen sich Hasen befinden.

select
	s.kennziffer
from tbl_stall as s
	join tbl_tier as t on s.kennziffer = t.kennziffer
where tierart = 'Hase';

-- g)	Alle Futtersorten, die von „Müller“ (aktuell) verfüttert werden.

select
	futterBezeichnung
from tbl_tier as t
	join tbl_stall as s on t.kennziffer = s.kennziffer
    join tbl_pfleger as p on s.pfleger_ID =p.pfleger_ID
where nachname = 'Müller';

-- h)	Alle (im Zoo aktuell oder zukünftig vorkommende) Tierarten, die sich mit Zebras vertragen.



-- i)	Dem Zoodirektor ist entfallen, welcher Pfleger für Stall 2 verantwortlich ist. Nennen Sie aber bitte dennoch alle Tierarten, die von diesem Pfleger (aktuell) betreut werden. (Hinweis: Gesucht wird NICHT der Name des Pflegers, sondern NUR die von ihm betreuten Tierarten – Unkenntnis des Zoodirektors macht Abfrage komplizierter)

-- subselect
select pfleger_ID from tbl_stall where kennziffer = 2;

select
	tierart
from tbl_pfleger as p
	join tbl_stall as s on p.pfleger_ID =s.pfleger_ID
    join tbl_tier as t on s.kennziffer = t.kennziffer
where s.pfleger_ID in (select pfleger_ID from tbl_stall where kennziffer = 2);



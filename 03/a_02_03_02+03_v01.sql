
create database geld_her;
use geld_her;

create table kunde
	(kunde_id int(11) auto_increment,
    vorname varchar(255) NULL,
    nachname varchar(255) NOT NULL, 
    email varchar(255) NOT NULL,
    primary key(kunde_id));

insert into kunde (kunde_id, vorname, nachname, email) values
	(1, 'Elli', 'Rot', 'rot@xyz.de');
    
insert into kunde (vorname, nachname, email) values
	('Vera', 'Deise', 'deise@xyz.de'),
	('Witali', 'Myrnow', 'myr@xyz.de'),
	('Rita', 'Myrnow', 'myr@xyz.de'),
	('Eva', 'Hahn', 'ehahn@xyz.de'),
	('Gala', 'Nieda', 'gala@xyz.de'),
	('Peter', 'Kaufnix', '@xyz.de');

create table abrechnung
	(abrechnung_id int(11) auto_increment,
    kunde_id int(11) NULL,
    datum date,
    primary key(abrechnung_id),
    foreign key(kunde_id) references kunde(kunde_id));


create table spedition
	(spedition_id int auto_increment primary key,
    spedition_name char(255));

create table hersteller
	(hersteller_id int auto_increment primary key,
    hersteller_name char(255),
    spedition_id int,
    foreign key(spedition_id) references spedition(spedition_id));

create table produkt
	(produkt_id int(11) auto_increment,
    hersteller_id int(11) NOT NULL,
    produkt_name char(255) NOT NULL,
    euro_preis float(7,2),
    primary key(produkt_id),
    foreign key(hersteller_id) references hersteller(hersteller_id));

create table abrechnung_produkt
	(abrechnung_id int(11),
    produkt_id int(11),
    foreign key(abrechnung_id) references abrechnung(abrechnung_id),
    foreign key(produkt_id) references produkt(produkt_id));
    
    
insert into abrechnung (kunde_id, datum) values
	(1,'2021-05-05'),
	(3,'2021-10-07'),
	(2,'2021-10-11'),
	(3,'2021-10-16'),
	(5,'2021-10-25'),
	(4,'2021-11-03'),
	(3,'2021-11-05'),
	(2,'2021-11-09'),
	(1,'2021-11-17'),
	(7,'2022-02-14');

insert into spedition (spedition_name) values
	('Speedvan Gmbh'),
	('RocketLogistic AG'),
	('Turbo Transport'),
	('Parktnur'),
	('Kriegtnix'),
	('Ganzal Lein');

insert into hersteller(hersteller_id, spedition_id, hersteller_name) values
		(1,2,'Contrabit');

insert into hersteller(hersteller_id, spedition_id, hersteller_name) values
	(default,1,'AntiByte'),
	(default,3,'UltraBug'),
	(default,5,'Hatnix 1992'),
	(default,4,'Ladenhut AG');

select * from kunde;
select * from abrechnung;
select * from spedition;
select * from hersteller;

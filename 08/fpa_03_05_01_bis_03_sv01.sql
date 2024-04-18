

create database fpa_03_05_01_bis_03_sv01;
use fpa_03_05_01_bis_03_sv01;

create table pilot
(
	pilot_ID int primary key auto_increment,
    vorname varchar(50) not null,
    nachname varchar(50) not null
);
-- drop table pilot;

insert into pilot(vorname,nachname) values
		('Quax','Bruch'),
		('Mathias','Rust');

create table flugzeugtyp 
(
	flugzeugtyp_id int auto_increment primary key,
    bezeichnung varchar(250) not null,
    anzahl_sitzplaetze int not null,
    reichweite_km int not null
);
-- drop table flugzeugtyp;

insert into flugzeugtyp(bezeichnung, anzahl_sitzplaetze, reichweite_km) values
			('Bingo',100,10000),
			('Chessnarr',10,800);

create table flughafen
(
	flughafen_id int auto_increment primary key,
    flughafen_bezeichnung varchar(250) not null,
    strassenname varchar(250) not null,
    hausnummer varchar(50) not null,
    plz varchar(10) not null,
    ort varchar(50) not null
);

insert into flughafen(flughafen_bezeichnung, strassenname, hausnummer, plz, ort) values
	('Aachen Süd','Alm','22-35','12345','Aachen'),
	('Berlin Ost','Bahn','15-44','23456','Berlin');

create table pilot_flugzeugtyp
(
	pilot_id int not null,
    flugzeugtyp_id int not null,
    primary key(pilot_id, flugzeugtyp_id),
    foreign key(pilot_id) references pilot(pilot_id),
    foreign key(flugzeugtyp_id) references flugzeugtyp(flugzeugtyp_id)
);

insert into pilot_flugzeugtyp(pilot_id,flugzeugtyp_id) values
		(1,1),
		(1,2);

create table flughafen_flugzeugtyp
(
	flugzeugtyp_id int not null,
    flughafen_id int not null,
    primary key(flugzeugtyp_id, flughafen_id),
    foreign key(flugzeugtyp_id) references flugzeugtyp(flugzeugtyp_id),
    foreign key(flughafen_id) references flughafen(flughafen_id)
);

insert into flughafen_flugzeugtyp(flugzeugtyp_id,flughafen_id) values
		(2,1),
		(1,2);

select * from pilot;
update pilot set nachname = 'Flöte'
where nachname = 'Bruch';

select * from flugzeugtyp;
update flugzeugtyp set reichweite_km = 1000
where flugzeugtyp_id = 2;


alter table pilot change vorname vorname varchar(50) null;


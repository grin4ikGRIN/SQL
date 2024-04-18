
create database fap_02_04_01_bis_03;
use fap_02_04_01_bis_03;

create table person
(
	person_id int,
    vorname varchar(50),
    nachname varchar(50),
    alter_person int,
    ort varchar(50),
    strasse varchar(100),
    hausnr varchar(10),
    primary key(person_id)
);

create table lied
(
	lied_id int,
    titel varchar(50),
    erscheinungsjahr varchar(4),
    person_id int,
    primary key(lied_id),
    foreign key(person_id) references person(person_id)
);

create table beherrscht
(
	person_id int,
    lied_id int,
    primary key(person_id, lied_id),
    foreign key(person_id) references person(person_id),
    foreign key(lied_id) references lied(lied_id)
);

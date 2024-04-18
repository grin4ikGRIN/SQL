
create database a_01_04_04_v01;
use a_01_04_04_v01;

create table tbl_projekt
	(projektID int,
    projektBezeichnung char(30),
    primary key(projektID));
    
create table tbl_teil_projekt
	(teil_projektID int,
    teil_projektBezeichnung char(30),
    projektID int,
    primary key(teil_projektID),
    foreign key(projektID) references tbl_projekt(projektID));
    
create table tbl_aufgabe
	(aufgabeID int,
    aufgabeBezeichnung char(30),
    teil_projektID int,
    primary key(aufgabeID),
    foreign key(teil_projektID) references tbl_teil_projekt(teil_projektID));
    
create table tbl_arbeitspaket
	(arbeitspaketID int,
    arbeitspaketBezeichnung char(30),
    arbeitspaketBeschreibung char(255),
    arbeitspaketDauer_in_stunden int,
    arbeitspaketKosten_in_euro int,
    aufgabeID int,
    primary key(arbeitspaketID),
    foreign key(aufgabeID) references tbl_aufgabe(aufgabeID));
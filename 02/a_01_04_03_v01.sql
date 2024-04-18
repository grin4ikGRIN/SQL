
create database a_01_04_03_v01;
use a_01_04_03_v01;

create table tbl_user
	(userID int,
    userVorname char(30),
    userNachname char(30),
    userOrt char(20),
    userStrasse char(30),
    userHausnr char(5),
    primary key(userID));
    
create table tbl_datenbank
	(datenbankID int,
    datenbankBezeichnung varchar(255),
    primary key(datenbankID));
    
create table tbl_tabelle
	(tabellenID int,
    tabellenName char(30),
    datenbankID int,
    primary key(tabellenID),
    foreign key(datenbankID) references tbl_datenbank(datenbankID));
    
create table tbl_attribut
	(attributID int,
    attributName varchar(30),
    attributTyp char(20),
    tabellenID int,
    primary key(attributID),
    foreign key(tabellenID) references tbl_tabelle(tabellenID));
    
create table tbl_user_zu_datenbank
	(userID int,
    datenbankID int,
    primary key(userID, datenbankID),
    foreign key(userID) references tbl_user(userID),
    foreign key(datenbankID) references tbl_datenbank(datenbankID));
    
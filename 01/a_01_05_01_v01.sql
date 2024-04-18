
create database a_01_05_01_v01;
use a_01_05_01_v01;

create table tbl_filiale
	(ID_filiale int,
    adresse char(200),
    email char(50),
    kundenparkplatz bit,
    primary key(ID_filiale));

create table tbl_filialleitung
	(ID_filialleitung int,
    name char(50),
    ID_filiale int,
    primary key(ID_filialleitung),
    foreign key(ID_filiale) references tbl_filiale(ID_filiale));
    
create table tbl_verkauefer
	(ID_verkauefer int,
    name char(50),
    primary key(ID_verkauefer));
    
create table tbl_warenuebergabe
	(ID_warenuebergabe int,
    bezeichnung char(50),
    primary key(ID_warenuebergabe));
    
create table tbl_hersteller
	(ID_hersteller int,
    name char(50),
    adresse char(200),
    telefonnummer char(20),
    primary key(ID_hersteller));
    
create table tbl_kunde
	(ID_kunde int,
    name char(50),
    adresse char(200),
    primary key(ID_kunde));
    
create table tbl_produkt
	(ID_produkt int,
    name char(50),
    preis decimal(10,2),
    ID_hersteller int,
    primary key(ID_produkt ),
    foreign key(ID_hersteller) references tbl_hersteller(ID_hersteller));
    
create table tbl_auftrag
	(ID_auftrag int,
    datum char(20),
    bemerkung char(255),
    ID_filiale int,
    ID_verkauefer int,
    ID_warenuebergabe int,
    ID_kunde int,
    ID_produkt int,
    primary key(ID_auftrag),
    foreign key(ID_filiale) references tbl_filiale(ID_filiale),
    foreign key(ID_verkauefer) references tbl_verkauefer(ID_verkauefer),
    foreign key(ID_warenuebergabe) references tbl_warenuebergabe(ID_warenuebergabe),
    foreign key(ID_kunde) references tbl_kunde(ID_kunde),
    foreign key(ID_produkt) references tbl_produkt(ID_produkt));
    
-- drop database a_01_05_01_v01;

insert into tbl_filiale(ID_filiale, adresse, email, kundenparkplatz) values 
	(1,'df','adfasf',1);
    
select * from tbl_filiale;
    
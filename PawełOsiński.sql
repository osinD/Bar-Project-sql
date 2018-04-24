CREATE TABLE Faktura_Detale
  (
    ID_Faktury           NUMBER (5) NOT NULL ,
    Pozycja_Faktury      NUMBER (4) NOT NULL ,
    ID_Produktu          NUMBER (5) NOT NULL ,     Cena_Zakupu_Posi³ków NUMBER (5,2) NOT NULL ,
    iloœæ                NUMBER (5) NOT NULL
  ) ;
ALTER TABLE Faktura_Detale ADD CONSTRAINT Faktura_Detale_PK PRIMARY KEY ( Pozycja_Faktury, ID_Faktury ) ;
CREATE TABLE Faktura_Naglowek
  (
    ID_Faktury                NUMBER (5) NOT NULL ,
    Data_Faktury              DATE NOT NULL ,
    Wrtosc_Faktury            NUMBER (5,2) NOT NULL ,
    Wartosc_Faktury_Po_znizce NUMBER (5,2) NOT NULL ,
    Id_Klienta                NUMBER (5) NOT NULL
  ) ;
ALTER TABLE Faktura_Naglowek ADD CONSTRAINT Faktura_Naglowek_PK PRIMARY KEY ( ID_Faktury ) ;
CREATE TABLE Klient
  (
    Id_Klienta     NUMBER (5) NOT NULL ,
    Imie           VARCHAR2 (20) NOT NULL ,
    Nazwisko       VARCHAR2 (20) NOT NULL ,
    Data_Urodzenia DATE ,
    Znizka         NUMBER (3,2) NOT NULL
  ) ;
ALTER TABLE Klient ADD CONSTRAINT Klient_PK PRIMARY KEY ( Id_Klienta ) ;
CREATE TABLE Kucharz
  (
    ID_Kucharza NUMBER (5) NOT NULL ,
    Imie        VARCHAR2 (20) NOT NULL ,
    Nazwisko    VARCHAR2 (20) NOT NULL ,
    Etat        NUMBER (3,2)
  ) ;
ALTER TABLE Kucharz ADD CONSTRAINT Kucharz_PK PRIMARY KEY ( ID_Kucharza ) ;
CREATE TABLE Produkt
  (
    ID_Produktu NUMBER (5) NOT NULL ,
    Nazwa       VARCHAR2 (20) NOT NULL ,
    Typ         VARCHAR2 (50) NOT NULL ,
    Cena        NUMBER (5,2) NOT NULL ,
    ILOSC_W_BARZE NUMBER (5) NOT NULL,
    ID_Kucharza NUMBER (5) NOT NULL
  ) ;
ALTER TABLE Produkt ADD CONSTRAINT Produkt_PK PRIMARY KEY ( ID_Produktu ) ;
ALTER TABLE Faktura_Detale ADD CONSTRAINT Faktura_Naglowek_FK FOREIGN KEY ( ID_Faktury ) REFERENCES Faktura_Naglowek ( ID_Faktury ) ;
ALTER TABLE Faktura_Naglowek ADD CONSTRAINT Klient_FK FOREIGN KEY ( Id_Klienta ) REFERENCES Klient 
( Id_Klienta ) ;
ALTER TABLE Produkt ADD CONSTRAINT Kucharz_FK FOREIGN KEY ( ID_Kucharza ) REFERENCES Kucharz 
( ID_Kucharza ) ;
ALTER TABLE Faktura_Detale ADD CONSTRAINT Produkt_FK FOREIGN KEY ( ID_Produktu ) REFERENCES Produkt 
( ID_Produktu ) ;
-----------------------------------------------------------------------------SEKWENCJE
CREATE SEQUENCE SEQUENCE_DETALE  INCREMENT BY 1 START WITH 1 MAXVALUE 99999999999999 MINVALUE 1 NOCACHE;
CREATE SEQUENCE SEQUENCE_ID_FAKTURY  INCREMENT BY 1 START WITH 1 MAXVALUE 99999999999999 
MINVALUE 1 NOCACHE;
CREATE SEQUENCE SEQUENCE_FUNKCJA INCREMENT BY 1 START WITH 1 MAXVALUE 99999999999999 MINVALUE 1 NOCACHE;
CREATE SEQUENCE SEQUENCE_KLIENT_ID INCREMENT BY 1 START WITH 1 MAXVALUE 99999999999999 MINVALUE 1 NOCACHE;
CREATE SEQUENCE SEQUENCE_POSIEK_ID INCREMENT BY 1 START WITH 1 MAXVALUE 99999999999999 MINVALUE 1 NOCACHE;
CREATE SEQUENCE SEQUENCE_KUCHARZ_ID INCREMENT BY 1 START WITH 1 MAXVALUE 99999999999999 MINVALUE 1 NOCACHE;
-------------------------------------------------------Wprowadzanie danych
insert into Klient (ID_KLIENTA, IMIE, NAZWISKO, DATA_URODZENIA,ZNIZKA) values(SEQUENCE_KLIENT_ID.NEXTVAL , 'Barbara','Babacka',TO_DATE('05/05/1989',
'dd/mm/yyyy'),0.0);
insert into Klient (ID_KLIENTA, IMIE, NAZWISKO, DATA_URODZENIA,ZNIZKA) values(SEQUENCE_KLIENT_ID.NEXTVAL ,'Czeslaw','Cabacki',TO_DATE('06/07/1999',
'dd/mm/yyyy'),0.1);
insert into Klient (ID_KLIENTA, IMIE, NAZWISKO, DATA_URODZENIA,ZNIZKA) values(SEQUENCE_KLIENT_ID.NEXTVAL , 'Dawid','Dabacki',TO_DATE('05/06/1988',
'dd/mm/yyyy'),0.5);
insert into Klient (ID_KLIENTA, IMIE, NAZWISKO, DATA_URODZENIA,ZNIZKA) values(SEQUENCE_KLIENT_ID.NEXTVAL , 'Edyta','Ebacka',TO_DATE('07/05/1979',
'dd/mm/yyyy'),0.3);
insert into Klient (ID_KLIENTA, IMIE, NAZWISKO, DATA_URODZENIA,ZNIZKA) values(SEQUENCE_KLIENT_ID.NEXTVAL , 'Ferdynand','Fabacki',TO_DATE('05/07/1995',
'dd/mm/yyyy'),0.0);
insert into Klient (ID_KLIENTA, IMIE, NAZWISKO, DATA_URODZENIA,ZNIZKA) values(SEQUENCE_KLIENT_ID.NEXTVAL , 'Grazyna','Gabacka',TO_DATE('05/12/1982',
'dd/mm/yyyy'),0.1);
insert into Klient (ID_KLIENTA, IMIE, NAZWISKO, DATA_URODZENIA,ZNIZKA) values(SEQUENCE_KLIENT_ID.NEXTVAL , 'Henryk','Habacki',TO_DATE('06/06/1991',
'dd/mm/yyyy'),0.2);
insert into Klient (ID_KLIENTA, IMIE, NAZWISKO, DATA_URODZENIA,ZNIZKA) values(SEQUENCE_KLIENT_ID.NEXTVAL , 'Iwona','Ibacka',TO_DATE('02/02/1999',
'dd/mm/yyyy'),0.1);
insert into Klient (ID_KLIENTA, IMIE, NAZWISKO, DATA_URODZENIA,ZNIZKA) values(SEQUENCE_KLIENT_ID.NEXTVAL , 'Janusz','Jabacki',TO_DATE('04/05/1979',
'dd/mm/yyyy'),0.0);
insert into Klient (ID_KLIENTA, IMIE, NAZWISKO, DATA_URODZENIA,ZNIZKA) values(SEQUENCE_KLIENT_ID.NEXTVAL , 'Kamil','Kabacki',TO_DATE('05/09/1988', 'dd/mm/yyyy'),0.3);
INSERT INTO Kucharz (ID_KUCHARZA, IMIE, NAZWISKO, ETAT) 
VALUES(SEQUENCE_KUCHARZ_ID.NEXTVAL,'Bartkowski','Waldemar',1);
INSERT INTO Kucharz (ID_KUCHARZA, IMIE, NAZWISKO, ETAT) 
VALUES(SEQUENCE_KUCHARZ_ID.NEXTVAL,'Czechowska','Marta',0.5);
INSERT INTO Kucharz (ID_KUCHARZA, IMIE, NAZWISKO, ETAT) 
VALUES(SEQUENCE_KUCHARZ_ID.NEXTVAL,'Dudek','Jan',0.25);
INSERT INTO Kucharz (ID_KUCHARZA, IMIE, NAZWISKO, ETAT) 
VALUES(SEQUENCE_KUCHARZ_ID.NEXTVAL,'Furman','Andrzej',1);
INSERT INTO PRODUKT (ID_PRODUKTU, NAZWA, TYP, CENA,ILOSC_W_BARZE, ID_KUCHARZA) 
VALUES(SEQUENCE_POSIEK_ID.NEXTVAL,'ZAPIEKANKA','danie',5.50,1000,1);
INSERT INTO PRODUKT (ID_PRODUKTU, NAZWA, TYP, CENA,ILOSC_W_BARZE, ID_KUCHARZA) 
VALUES(SEQUENCE_POSIEK_ID.NEXTVAL,'HAMBURGER','danie',5,1000,2);
INSERT INTO PRODUKT (ID_PRODUKTU, NAZWA, TYP, CENA,ILOSC_W_BARZE, ID_KUCHARZA) 
VALUES(SEQUENCE_POSIEK_ID.NEXTVAL,'HOT-DOG','danie',4.50,1000,2);
INSERT INTO PRODUKT (ID_PRODUKTU, NAZWA, TYP, CENA,ILOSC_W_BARZE, ID_KUCHARZA) 
VALUES(SEQUENCE_POSIEK_ID.NEXTVAL,'CHEESEBURGER','danie',5.50,1000,1);
INSERT INTO PRODUKT (ID_PRODUKTU, NAZWA, TYP, CENA,ILOSC_W_BARZE, ID_KUCHARZA) 
VALUES(SEQUENCE_POSIEK_ID.NEXTVAL,'TORTILLA','danie',9.50,1000,1);
INSERT INTO PRODUKT (ID_PRODUKTU, NAZWA, TYP, CENA,ILOSC_W_BARZE, ID_KUCHARZA) 
VALUES(SEQUENCE_POSIEK_ID.NEXTVAL,'MINI-PIZZA','danie',8.50,1000,3);
INSERT INTO PRODUKT (ID_PRODUKTU, NAZWA, TYP, CENA,ILOSC_W_BARZE, ID_KUCHARZA) 
VALUES(SEQUENCE_POSIEK_ID.NEXTVAL,'LÓD WANILIOWY','deser',3.50,1000,3);
INSERT INTO PRODUKT (ID_PRODUKTU, NAZWA, TYP, CENA,ILOSC_W_BARZE, ID_KUCHARZA) 
VALUES(SEQUENCE_POSIEK_ID.NEXTVAL,'LÓD_TRUSKAWKOWY','deser',3.50,1000,4);
INSERT INTO PRODUKT (ID_PRODUKTU, NAZWA, TYP, CENA,ILOSC_W_BARZE, ID_KUCHARZA) 
VALUES(SEQUENCE_POSIEK_ID.NEXTVAL,'SPRITE','napój',2.50,1000,4);
INSERT INTO PRODUKT (ID_PRODUKTU, NAZWA, TYP, CENA,ILOSC_W_BARZE, ID_KUCHARZA) 
VALUES(SEQUENCE_POSIEK_ID.NEXTVAL,'COLA','napój',2.50,1000,1);
INSERT INTO PRODUKT (ID_PRODUKTU, NAZWA, TYP, CENA,ILOSC_W_BARZE, ID_KUCHARZA) 
VALUES(SEQUENCE_POSIEK_ID.NEXTVAL,'FANTA','napój',2.50,1000,1);
INSERT INTO PRODUKT (ID_PRODUKTU, NAZWA, TYP, CENA,ILOSC_W_BARZE, ID_KUCHARZA) 
VALUES(SEQUENCE_POSIEK_ID.NEXTVAL,'SOK','napój',3.50,1000,2);
-----------------FUNKCJE POTRZEBNE DO GENEROWANIA TRANSAKCJI
create or replace FUNCTION LOSOWANIE_RANDOMOWE 
(v_min IN integer, v_max IN integer)
RETURN INTEGER
IS WYNIK INTEGER; BEGIN
wynik := Round(dbms_random.value(v_min, v_max));
return wynik;
end LOSOWANIE_RANDOMOWE;
/
CREATE OR REPLACE FUNCTION F_ID_PRODUKTU RETURN NUMBER AS
V_A NUMBER; V_B NUMBER;
BEGIN
SELECT MIN(ID_PRODUKTU) INTO V_A
FROM PRODUKT;
SELECT MAX(ID_PRODUKTU) INTO V_B
FROM PRODUKT;
RETURN LOSOWANIE_RANDOMOWE(V_A, V_B);
END F_ID_PRODUKTU; /
create or replace FUNCTION F_ID_KLIENTA RETURN NUMBER AS
V_A NUMBER; V_B NUMBER;
BEGIN
SELECT MIN(ID_KLIENTA) INTO V_A
FROM KLIENT;
SELECT MAX(ID_KLIENTA) INTO V_B
FROM KLIENT;
RETURN LOSOWANIE_RANDOMOWE(V_A, V_B);
END F_ID_KLIENTA;
/
-----------------------WIDOKI
create or replace view  Jedzenie_podane_przez as select Imie ||' '|| Nazwisko as "Kucharz" , Nazwa as "Jedzenie"
from Produkt P join Kucharz K on P.ID_Kucharza=K.ID_Kucharza;
create or replace view ranking_klientów as
select Imie ||' '|| Nazwisko as "Imie i Nazwisko", sum(Wartosc_Faktury_Po_Znizce) as "Kwota" from Klient k join Faktura_Naglowek f on k.Id_Klienta=f.Id_Klienta group by k.Nazwisko,Imie order by sum(WARTOSC_FAKTURY_PO_ZNIZCE) desc ;
CREATE OR REPLACE VIEW NAJCHETNIEJ_KUPOWANE AS
SELECT DISTINCT NAZWA ,(1000-ILOSC_W_BARZE) AS ILOSC_KUPIONYCH
FROM PRODUKT
ORDER BY  ILOSC_KUPIONYCH DESC ;
CREATE OR REPLACE    VIEW  WARTOŒÆ_MAGAZYNU AS   select nazwa as PRODUKT ,(ILOSC_W_BARZE*CENA) AS WARTOŒÆ
FROM PRODUKT;
--------------------------------------------------------GENEROWANIE DANYCH CO 10 GODZIN
BEGIN
    DBMS_SCHEDULER.CREATE_SCHEDULE (        schedule_name => 'INTERVAL_EVERY_10_hours',         repeat_interval  => 'FREQ=HOURLY;INTERVAL=10',     
        start_date => TO_TIMESTAMP_TZ('2017-02-06 13:00:16.000000000 EUROPE/BELGRADE','YYYY-MM-DD HH24:MI:SS.FF TZR'),         schedule_name  => '"IN_EVERY_10_HOURS"');
END;
/
--------------------GENERATOR TRANSAKCJI
--Procedura Generator_TR ma za zadanie generowaæ dane transakcji. Po deklaracji --zmiennych, za pomoc¹ funkcji  F_ID_KLIENTA, losowany jest klient, którego dotyczyæ bêdzie --faktura. Do tabeli faktura_naglowek wprowadzana jest nowa faktura, której klucz g³ówny 
---(ID_faktury) tworzony jest za pomoc¹ sekwencji SEQUENCE_ID_faktury, do pola 
--data_faktury wprowadzana jest aktualna data, natomiast w polach wartosc_faktury oraz --wartosc_faktury_po_znizce wprowadzane --s¹ tymczasowo 1. Pole klucza obcego tabeli --klient (ID_klienta) uzupe³niane jest wylosowanym wczeœniej numerem klienta. 
--nastêpnie losujemy produkty za pomoc¹ funkcji  F_ID_PRODUKTU ORAZ ICH ILOŒÆ  --SPRZEDA¯Y,
--je¿eli produkt ju¿ siê pojawi³ na fakturze nie wprowadzamy go ponownie nastêpnie 
--pobieramy cenê produktu dla danego id_produktu mno¿ymy iloœæ produktu * cena i 
--dostajemy wartosc jednego posi³ku na fakturze. Nastêpnie pobieramy zni¿kê --dla danego 
--id_klienta która jest nam potrzebna przy wprowadzaniu nowych danych zamiast 1(wartosc 
--faktury, wartosc faktury poi --znizce) w tabeli faktura_naglowek 
create or replace PROCEDURE GENERATOR_TR AS
V_ID_PRODUKTU numeric;
V_ILOSC numeric;
V_CENA_ZAKUPU NUMBER;
V_CENA_ZAKUPU1 NUMBER;
V_WARTOSC_PO_ZNIZCE NUMBER;
V_ID_KLIENTA NUMERIC;
V_ZNIZKA NUMBER;
V_PO_ZNIZCE NUMBER;
V_RAND numeric;
V_IDFAKTURY NUMERIC;
ZMIENNA NUMERIC;
LICZNIK NUMERIC;
BEGIN
V_ID_KLIENTA :=F_ID_KLIENTA;
INSERT INTO 
FAKTURA_NAGLOWEK(ID_FAKTURY,DATA_FAKTURY,WRTOSC_FAKTURY,WARTOSC_FAKTURY_PO_ZNIZCE,ID_KL IENTA) 
VALUES (SEQUENCE_ID_FAKTURY.NEXTVAL,SYSDATE,1,1,V_ID_KLIENTA);  LICZNIK :=0;
V_IDFAKTURY :=SEQUENCE_ID_FAKTURY.CURRVAL;
FOR V_I IN 1..5 LOOP
LICZNIK  :=LICZNIK+1;
V_RAND:=LOSOWANIE_RANDOMOWE(1,10);
V_ID_PRODUKTU:=F_ID_PRODUKTU();
V_ILOSC :=LOSOWANIE_RANDOMOWE(1, 5);
SELECT CENA INTO V_CENA_ZAKUPU
FROM PRODUKT
WHERE ID_PRODUKTU=V_ID_PRODUKTU;
select count(id_produktu) into ZMIENNA from FAKTURA_DETALE where id_faktury=V_IDFAKTURY and id_produktu=V_ID_PRODUKTU;
IF ZMIENNA=0
THEN
V_CENA_ZAKUPU1 := V_CENA_ZAKUPU *V_ILOSC;
INSERT INTO 
FAKTURA_DETALE(ID_FAKTURY,POZYCJA_FAKTURY,ID_PRODUKTU,CENA_ZAKUPU_POSI£KÓW,ILOŒÆ)
VALUES  ( SEQUENCE_ID_FAKTURY.CURRVAL,LICZNIK,V_ID_PRODUKTU,V_CENA_ZAKUPU , V_ILOSC);
SELECT ZNIZKA INTO V_ZNIZKA
FROM KLIENT
WHERE ID_KLIENTA=V_ID_KLIENTA;
V_PO_ZNIZCE :=V_CENA_ZAKUPU1*(1-V_ZNIZKA);
UPDATE FAKTURA_NAGLOWEK
SET WRTOSC_FAKTURY=WRTOSC_FAKTURY+V_CENA_ZAKUPU1, 
WARTOSC_FAKTURY_PO_ZNIZCE=WARTOSC_FAKTURY_PO_ZNIZCE+V_PO_ZNIZCE WHERE ID_FAKTURY=V_IDFAKTURY;
END IF;
END LOOP;
END;
/
------------------------------WYZWALACZE
--Reaguj¹ wtedy gdy klient kupuje b¹dŸ wstrzymuje siê z kupnem danego towar 
--  (zmniejszamy b¹dŸ --zwiêkszamy iloœæ w magazynie) zachowuj¹c spójnoœæ w tabelach 
--FAKTURA_detale, --FAKTURA_NAGLOWEK,  Produkt 
create or replace TRIGGER "TR_IN_DETALE" after insert on fAKTURA_detale for each row begin update Produkt 
set ILOSC_W_BARZE= ILOSC_W_BARZE- :new.iloŒÆ where :new.id_produktu = Produkt.Id_produktu ; end;
/
create or replace TRIGGER TR_DEL_Detale After DELETE on FAKTURA_Detale for each row
begin update Produkt 
set Produkt.Ilosc_w_Barze=Produkt.Ilosc_w_Barze+ :old.Iloœæ where :OLD.id_produktu = Produkt.Id_Produktu ; end;
/
create or replace TRIGGER TR_DEL_FAKTURA BEFORE DELETE on FAKTURA_nAGLOWEK for each row
begin
DELETE FAKTURA_DETALE 
where :OLD.id_FAKTURY = FAKTURA_DETALE.Id_FAKTURY ;
end;
/
--------------------------------------JOBS --Poni¿sze funkcje s³u¿¹ do generowania transakcji (wywo³ywania procedury 
--Generator_tr) co 10 godzin
BEGIN
    DBMS_SCHEDULER.create_program(         program_name => 'GENEROTOR_TR_PROGRAM',          program_type => 'STORED_PROCEDURE',         program_action =>  'GENERATOR_TR',  
        enabled => TRUE,         comments=>'');
END;
/ begin        
dbms_scheduler.create_job      
(job_name => 'DANE_CO_10_GODZIN',      program_name=> 'GENEROTOR_TR_PROGRAM',       schedule_name=>'IN_EVERY_10_HOURS',    
enabled=>true,          comments=>'');  
    end;   /
BEGIN DBMS_SCHEDULER.RUN_JOB('DANE_CO_10_GODZIN'); END;

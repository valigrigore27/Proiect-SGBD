DROP TABLE useri;
/
CREATE TABLE useri(
id_user number(5) PRIMARY KEY not null,
username varchar2(30),
password varchar(20),
name varchar2(20) not null,
email varchar2(30),
city varchar2(50),
id_car NUMBER(5),
date_rented VARCHAR2(30),
to_pay NUMBER(6) 
);
/

select * from useri;

insert into useri values(1,'mihai','parola1','Pop Mihai','mihai1212@gmail.com', 'Bacau',3,'18-04-2022', 200);
insert into useri values(2,'eduard','newpass','Ion Eduard','edi12@yahoo.com','Vaslui',1,'15-05-2022', 150);
insert into useri values(3,'mihai','luceafarul','Mihaita Mihai','mihai@gmail.com','Iasi',5, '12-04-2022', 200);
insert into useri values(4,'ionel','copilarie','Burca Ion','burca@yahoo.com', 'Iasi',4, '21-05-2022',300);
insert into useri values(5,'george','opera','Catalin George','george@gmail.com','Botosani',8,'19-03-2022',100);

--------------------
drop procedure car_discount;    
/
create or replace procedure car_discount AS
cursor discount_cursor IS
    select id_user, username from useri where useri.id_car=3;
    v_user discount_cursor%rowtype;
BEGIN
    for v_user in discount_cursor loop
        update useri SET useri.to_pay=useri.to_pay-50
        where v_user.id_user = id_user;
    end loop;
end car_discount;
/
begin
car_discount;
end;
/
drop procedure change_city;
/
create or replace procedure change_city(user_id in number, new_city in VARCHAR2)as
cursor change_cursor is
select id_user, name, city from useri where id_user = user_id;
v_user change_cursor%rowtype;
begin
for v_user in change_cursor loop
    update useri set useri.city = new_city where v_user.id_user = id_user;
    end loop;
end change_city;

/
begin
change_city(4, 'Pascani');
end;
/

-------------------
-- tabela cars
DROP TABLE cars;
/
CREATE TABLE cars
(
id_car NUMBER(3) primary key not null,
name varchar2(30),
year NUMBER(5),
combustion VARCHAR2(30),
transmission VARCHAR2(30),
color VARCHAR2(20),
pollution_taxes NUMBER(5) 
)
/
insert into cars values(1, 'Toyota', 2009, 'Petrol', 'Automatic', 'red', 400);
insert into cars values(2, 'Porsche', 2020, 'Diesel', 'Manual', 'blue', 100);
insert into cars values(3, 'Nissan', 2005, 'GPL', 'Automatic', 'black',450);
insert into cars values(4, 'BMW', 2002, 'GPL', 'Manual', 'green',500);
insert into cars values(5, 'Ford', 1998, 'Petrol', 'Manual', 'black',600);
insert into cars values(6, 'Audi', 2005, 'Diesel', 'Automatic', 'white', 450);
insert into cars values(7, 'Citroen', 2018, 'Diesel', 'Manual', 'brown', 100);
insert into cars values(8, 'Seat', 2016, 'Petrol', 'Automatic', 'red', 150);
insert into cars values(9, 'Volkswagen', 2010, 'Diesel', 'Automatic', 'blue', 250);
insert into cars values(10, 'Volkswaasdasdgen', 20140, 'Dieffvsel', 'Autosdfmatic', 'blufsde', 250);

select * from cars;

--pentru masinile fabricate inainte de 2010 se mareste taxa pentru poluare

drop procedure pollution_taxes_increase;
    create or replace procedure pollution_taxes_increase as
    cursor taxes_cursor is
        select id_car, name, year, pollution_taxes from cars where year <= 2010;
        v_car taxes_cursor%rowtype;
    begin
        for v_car in taxes_cursor loop
        update cars set cars.pollution_taxes = cars.pollution_taxes + 100
        where v_car.id_car = id_car;
        end loop;
    end pollution_taxes_increase;
    
/
begin
pollution_taxes_increase;
end;
/
select * from cars;


drop procedure delete_car;

CREATE OR REPLACE PROCEDURE delete_car(car_id in number) AS
CURSOR delete_cursor IS 
    SELECT id_car FROM cars where id_car=car_id;
    v_car delete_cursor%rowtype;
BEGIN
    FOR v_car IN delete_cursor LOOP
        DELETE FROM cars WHERE id_car=v_car.id_car;
    END LOOP;
END delete_car;

/
begin 
delete_car(10);
end;
/


drop trigger trigger_username;

CREATE OR REPLACE TRIGGER trigger_username
BEFORE INSERT ON useri
FOR EACH ROW
DECLARE
v_useri NUMBER;
BEGIN 
    SELECT COUNT(*) INTO v_useri FROM useri WHERE username=:NEW.username;
    IF(v_useri = 0) THEN
        DBMS_OUTPUT.PUT_LINE('Inserare reusita');
    ELSE 
        RAISE_APPLICATION_ERROR(-20000,'Eroare: Username-ul exista deja');
    END IF;
END;


GRANT CREATE SESSION, CREATE TABLE, CREATE TRIGGER TO sys;
GRANT SELECT, INSERT, UPDATE, DELETE ON cars TO sys;


/

drop trigger trigger_delete_car;

    create or replace trigger trigger_delete_car
    before delete on cars
    for each row
    declare
    v_cars number;
    begin
        select count(*) into v_cars from cars where id_car=:OLD.id_car;
        if(v_cars > 1) then
            DBMS_OUTPUT.PUT_LINE('Stergere realizata cu succes!');
            else RAISE_APPLICATION_ERROR(-20000, 'Nu ai voie sa stergi din tabela!');
        end if;
    end;

select * from useri;
select * from cars;



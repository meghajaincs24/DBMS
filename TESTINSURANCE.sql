USE MYSQL;
show databases;
CREATE DATABASE IF NOT EXISTS test;
USE TEST;
create table person (
    driver_id varchar(10),
    name varchar(20),
    address varchar(30),
    primary key(driver_id)
);
create table car(
    reg_num varchar(10),
    model varchar(10),
    year int,
    primary key(reg_num)
);
create table accident(
    report_num int,
    accident_date date,
    location varchar(20),
    primary key(report_num)
);
create table owns(
    driver_id varchar(10),
    reg_num varchar(10),
    primary key(driver_id, reg_num),
    foreign key(driver_id) references person(driver_id),
    foreign key(reg_num) references car(reg_num)
);

CREATE TABLE participated(
    driver_id varchar(10),
    reg_num varchar(10),
    report_num int,
    damage_amount int,
    PRIMARY KEY(driver_id, reg_num, report_num),
    FOREIGN KEY(driver_id) REFERENCES Person(driver_id),
    FOREIGN KEY(reg_num) REFERENCES Car(reg_num),
    FOREIGN KEY(report_num) REFERENCES Accident(report_num)
);
insert into person values('A01','Richard','Srinivas Nagar');
insert into person values('A02','Pradeep','Rajajinagar');
insert into person values('A03','Smith','Ashoknagar');
insert into person values('A04','Venu','N.R.Colony');
insert into person values('A05','Harsh','ranchi');
insert into car values('KA052250','Indica', 1990);
insert into car values('KA031181','Lancer', 1957);
insert into car values('KA095477','Toyota', 1998);
insert into car values('KA053408','Honda', 2008);
insert into car values('JH01EV0884','Hyundai', 2020);
insert into accident values(11,'2003-01-01','Mysore Road');
insert into accident values(12,'2004-02-02','Southend Circle');
insert into accident values(13,'2003-01-21','Bulltemple Road');
insert into accident values(14,'2008-02-17','Mysore Road');
insert into accident values(15,'2025-03-20','ranchi');
insert into owns values('A01','KA052250');
insert into owns values('A02','KA053408');
insert into owns values('A04','KA031181');
insert into owns values('A03','KA095477');
insert into owns values('A05','JH01EV0884');
insert into participated values('A01','KA052250',11,10000);
insert into participated values('A02','KA053408',12,50000);
insert into participated values('A03','KA095477',13,25000);
insert into participated values('A04','KA031181',14,3000);
insert into participated values('A05','JH01EV0884',15,5000);
select accident_date, location
from ACCIDENT;
select driver_id
from PARTICIPATED
where damage_amount >= 25000;
update participated
set damage_amount = 25000
where reg_num = 'KA053408' and report_num = 12;
insert into accident values(16, '2008-03-15', 'Domlur');
select * from car;
select * from person;
select * from accident;
select * from owns;
select * from participated;
select accident_date, location
from ACCIDENT;
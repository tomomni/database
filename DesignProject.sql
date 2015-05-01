-- Creating people entity and sub-entities as well as inserting data --
CREATE TABLE people (
  pid		 char(6) not null unique,
  firstname	 text not null,
  lastname 	 text not null,
  DateOfBirth	 date not null,
 primary key(pid)
);

CREATE TABLE stormtroopers (
 pid		char(6) not null unique references people(pid),
 rank		text not null,
 squadrole	text not null,
primary key(pid)
);

CREATE TABLE pilots (
 pid		char(6) not null unique references people(pid),
 firstflight	date not null,
primary key(pid)
);

CREATE TABLE managers (
 pid		 char(6) not null unique references people(pid),
 TitlePrefix	 text not null,
 TitleSuffix	 text not null,
primary key(pid)
);

CREATE TABLE Bases (
 BaseID			char(5) not null unique,
 Name			text not null,
 Region			text not null,
 Sector			text not null,
 SSystem		text not null,
 BaseLocal		text not null,
 ShipCapacity		integer not null,
primary key(BaseID)
);


CREATE TABLE SpaceStations (
 StationNum		char(5) not null unique,
 StationType		text not null,
 CrewCapacity		integer not null,
 BaseID			char(5) not null unique references Bases(BaseID),
primary key(StationNum), 
foreign key(BaseID) references Bases(BaseID)
);


CREATE TABLE Ships (
 ShipNum		char(5) not null unique,
 ShipName		text not null,
 costCREDITS		integer not null,
 CrewCapacity 		integer not null,
 EngineType		text not null,
 QuantityOH		integer,
primary key(ShipNum)
);

CREATE TABLE ShipsDocked (
 ShipNum		char(5) not null references Ships(ShipNum),
 BaseID			char(5) not null references Bases(BaseID),
 QuantityOB		integer not null,
primary key(BaseID,ShipNum)
);

CREATE TABLE BaseCrew (
 pid			char(6) not null references people(pid),
 BaseID			char(5) not null references Bases(BaseID),
 ArrivalDate		date not null,
 DepartureDate		date,
primary key(pid,BaseID, ArrivalDate)
);

CREATE TABLE Armaments (
 WepID			char(4) not null unique,
 WName			text not null,
 QuantityOH		integer not null,
 CostCredits		integer not null,
 primary key(WepID)
);

CREATE TABLE PersonnelWeapons (
 pid			char(6) not null references people(pid),
 WepID			char(4) not null references Armaments (WepID),
 QuantityHeld		integer not null,
 primary key(pid, WepID)
);


CREATE TABLE StationWeapons (
 StationNum		char(5) not null references SpaceStations(StationNum),
 WepID			char(4) not null references Armaments (WepID),
 QuantityOnBoard	integer not null,
 primary key(StationNum, WepID)
);

CREATE TABLE QualifiedToFly (
 pid			char(6) not null references people(pid),
 ShipNum		char(5) not null references Ships(ShipNum),
 primary key(pid, ShipNum)
);

/* 
shows the age of every person 

Select date_part('year', age(DateOfBirth))as age, *
from people;

query that delivers the full name of all stormtroopers who are commanders or corporals --

select firstname, lastname
from people 
inner join stormtroopers 
on people.pid = stormtroopers.pid
where stormtroopers.rank = 'commander' or stormtroopers.rank = 'corporal';

-- QUERY NOT WORKING, I WANT TO SHOW THE PILOTS WHO HAVE BEEN FLYING FOR MORE THAN 20 YEARS --

Select firstname, lastname
from people
inner join pilots
on people.pid = pilots.pid 
where ((select date_part('year', age(firstflight)) as yrs
       from pilots
	group by yrs 
	order by yrs DESC) > 20)

-- END OF BROKEN QUERY --

 -- query used to determine who is what --
select*
from people
left outer join stormtroopers
on people.pid = stormtroopers.pid
left outer join pilots 
on people.pid = pilots.pid
left outer join managers
on people.pid = managers.pid
order by people.pid desc;
-- i used this to figure out which pids were not assigned to be stormtroopers or pilots--

-- query that displays who has how many of each weapon, and what that weapon is --
select firstname, lastname, WName, QuantityHeld
from People, Armaments, PersonnelWeapons
where people.pid = PersonnelWeapons.pid
and PersonnelWeapons.WepID = Armaments.WepID
-- tested working at 10:14 4/26 --

*/

show datestyle;
set datestyle = 'sql, ymd'

-- Insert Statements for People -- 

Insert into people(pid, firstname, lastname, DateOfBirth)
values ('p00001', 'Anakin', 'Skywalker', '1977-05-25');

Insert into people(pid, firstname, lastname, DateOfBirth)
values ('p00002', 'Anson', 'Trask', '1983-01-08');

Insert into people(pid, firstname, lastname, DateOfBirth)
values ('p00003', 'Boba', 'Fett', '1991-08-09');

Insert into people(pid, firstname, lastname, DateOfBirth)
values ('p00004', 'Sheev', 'Palpatine', '1977-05-25');

Insert into people(pid, firstname, lastname, DateOfBirth)
values ('p00005', 'Cassio', 'Tagge', '1980-07-15');

Insert into people(pid, firstname, lastname, DateOfBirth)
values ('p00006', 'Trech', 'Molock', '1974-03-23');

Insert into people(pid, firstname, lastname, DateOfBirth)
values ('p00007', 'Cassio', 'Tagge', '1973-07-15');

Insert into people(pid, firstname, lastname, DateOfBirth)
values ('p00008', 'William', 'Touno', '1969-05-12');

Insert into people(pid, firstname, lastname, DateOfBirth)
values ('p00009', 'Trel', 'Skutu', '1989-11-02');

Insert into people(pid, firstname, lastname, DateOfBirth)
values ('p00010', 'Biggs', 'Darklighter', '1970-11-17');

Insert into people(pid, firstname, lastname, DateOfBirth)
values ('p00011', 'Tycho', 'Celchu', '1971-03-09');

Insert into people(pid, firstname, lastname, DateOfBirth)
values ('p00012', 'Maarek', 'Stele', '1970-10-04');

Insert into people(pid, firstname, lastname, DateOfBirth)
values ('p00013', 'Juno', 'Eclipse', '1972-06-30');

Insert into people(pid, firstname, lastname, DateOfBirth)
values ('p00014', 'CC', '2224', '1970-11-17');

Insert into people(pid, firstname, lastname, DateOfBirth)
values ('p00015', 'CT', '7567', '1971-01-01');

Insert into people(pid, firstname, lastname, DateOfBirth)
values ('p00016', 'CT', '3110', '1971-01-01');

Insert into people(pid, firstname, lastname, DateOfBirth)
values ('p00017', 'CT', '3002', '1971-01-01');

Insert into people(pid, firstname, lastname, DateOfBirth)
values ('p00018', 'Ran', 'Harkas', '1981-07-17');

-- Insert Statements for Stormtroopers -- 

Insert into stormtroopers(pid, rank, squadrole)
values ('p00002', 'corporal', 'leader');

Insert into stormtroopers(pid, rank, squadrole)
values ('p00014', 'commander', 'tactician');

Insert into stormtroopers(pid, rank, squadrole)
values ('p00015', 'commander', 'engineer');

Insert into stormtroopers(pid, rank, squadrole)
values ('p00016', 'Private1', 'sharpshooter');

Insert into stormtroopers(pid, rank, squadrole)
values ('p00017', 'Private1', 'grenadier');

Insert into stormtroopers(pid, rank, squadrole)
values ('p00018', 'sergeant', 'rifleman');

-- Insert data for pilots -- 

Insert into pilots(pid, firstflight)
values ('p00007', '1995-09-03');

Insert into pilots(pid, firstflight)
values ('p00009', '2009-04-26');

Insert into pilots(pid, firstflight)
values ('p00010', '1989-12-25');

Insert into pilots(pid, firstflight)
values ('p00011', '1994-02-14');

Insert into pilots(pid, firstflight)
values ('p00012', '2000-03-01');

Insert into pilots(pid, firstflight)
values ('p00013', '1992-06-30');

-- Insert Data for managers --

Insert into managers (pid, TitlePrefix, TitleSuffix)
values ('p00001', 'Darth', 'Vader');

Insert into managers (pid, TitlePrefix, TitleSuffix)
values ('p00003', 'Bounty', 'Hunter');

Insert into managers (pid, TitlePrefix, TitleSuffix)
values ('p00004', 'Galactic', 'Emperor');

Insert into managers (pid, TitlePrefix, TitleSuffix)
values ('p00005', 'Imperial', 'General');

Insert into managers (pid, TitlePrefix, TitleSuffix)
values ('p00006', 'Imperial', 'General');

Insert into managers (pid, TitlePrefix, TitleSuffix)
values ('p00008', 'Imperial', 'General');

-- Insert data for Bases -- 

Insert into Bases (BaseID, Name, Region, Sector, SSystem, BaseLocal, ShipCapacity)
values ('B0001','Prakith', 'Deep Core', 'Sector 5','Prakith','Planet', 20);

Insert into Bases (BaseID, Name, Region, Sector, SSystem, Baselocal, ShipCapacity)
values ('B0002', 'Adim', 'Inner Rim', 'Adari Sector','Adim','Planet', 100);

Insert into Bases (BaseID, Name, Region, Sector, SSystem, Baselocal, ShipCapacity)
values ('B0003', 'Garos IV', 'Mid Rim', 'Msst Sector','Garos IV','Planet', 225);

Insert into Bases (BaseID, Name, Region, Sector, SSystem, Baselocal, ShipCapacity)
values ('B0004', 'Jerne', 'Outer Rim Territories', 'Kanz Sector','Jerne','Planet',30);

Insert into Bases (BaseID, Name, Region, Sector, SSystem, Baselocal, ShipCapacity)
values ('B0005', 'Black Fifteen', 'Galactic Core', 'Farlax Sector','Nzoth','SpaceStation',125);

Insert into Bases (BaseID, Name, Region, Sector, SSystem, Baselocal, ShipCapacity)
values ('B0006','Coruscant', 'Galactic Core', 'Corusca Sector','Coruscant','Planet',75);

Insert into Bases (BaseID, Name, Region, Sector, SSystem, Baselocal, ShipCapacity)
values ('B0007','Grimm', 'Expansion Region', 'Brak Sector','Genesia','Moon',20);

Insert into Bases (BaseID, Name, Region, Sector, SSystem, Baselocal, ShipCapacity)
values ('B0008','The Death Star', 'Outer Rim Territories', 'Atrivis Sector','Horuz','SpaceStation',20);

Insert into Bases (BaseID, Name, Region, Sector, SSystem, Baselocal, ShipCapacity)
values ('B0009','Endor', 'Outer Rim Territories', 'Moddell Sector','Endor','Moon',40);

Insert into Bases (BaseID, Name, Region, Sector, SSystem, Baselocal, ShipCapacity)
values ('B0010','Hoth','Outer Rim Territories', 'Anoat Sector','Hoth','Planet',50);

-- Insert data for SpaceStations -- 

Insert into SpaceStations (StationNum,StationType,CrewCapacity,BaseID)
values ('00015','Repair Yard',200,'B0005');

Insert into SpaceStations (StationNum,StationType,CrewCapacity,BaseID)
values ('10000','Battle Station',12000,'B0008');

-- Insert data for ships --

Insert into Ships (ShipNum, ShipName, costCREDITS, CrewCapacity, EngineType, QuantityOH)
values ('s0001', 'TIE/LN starfighter', '60000', 2, 'SFS P-s4 twin ion', 212);

Insert into Ships (ShipNum, ShipName, costCREDITS, CrewCapacity, EngineType, QuantityOH)
values ('s0002', 'TIE/SA bomber', '65000', 1, 'SFS P-s4 twin ion', 141);

Insert into Ships (ShipNum, ShipName, costCREDITS, CrewCapacity, EngineType, QuantityOH)
values ('s0003', 'TIE/IN interceptor', '72000', 1, 'SFS P-s5.6 twin ion', 71);

Insert into Ships (ShipNum, ShipName, costCREDITS, CrewCapacity, EngineType, QuantityOH)
values ('s0004', 'TIE/X1 advanced', '90000', 1, 'SFS P-s5.6 twin ion', 70);

Insert into Ships (ShipNum, ShipName, costCREDITS, CrewCapacity, EngineType, QuantityOH)
values ('s0005', 'Scimitar assualt bomber', '71500', 2, 'Single SFS P-s4 ion', 35);

Insert into Ships (ShipNum, ShipName, costCREDITS, CrewCapacity, EngineType, QuantityOH)
values ('s0006', 'Neutralizer-class bomber', '83000', 1, 'single E-16/x ion', 35);

Insert into Ships (ShipNum, ShipName, costCREDITS, CrewCapacity, EngineType, QuantityOH)
values ('s0007', 'TIE/D automated fighter', '170000', 0, 'SFS P-s4 twin ion', 35);

Insert into Ships (ShipNum, ShipName, costCREDITS, CrewCapacity, EngineType, QuantityOH)
values ('s0008', 'Starhunter', '100000', 1, 'SFS P-s7.2 twin ion', 35);

-- Insert data for bases sorted by base --

--Base1--
Insert into ShipsDocked (ShipNum, BaseID, QuantityOB)
values ('s0001','B0001',12);

Insert into ShipsDocked (ShipNum, BaseID, QuantityOB)
values ('s0002','B0001',4);

Insert into ShipsDocked (ShipNum, BaseID, QuantityOB)
values ('s0003','B0001',2);

Insert into ShipsDocked (ShipNum, BaseID, QuantityOB)
values ('s0004','B0001',0);

Insert into ShipsDocked (ShipNum, BaseID, QuantityOB)
values ('s0005','B0001',0);

Insert into ShipsDocked (ShipNum, BaseID, QuantityOB)
values ('s0006','B0001',0);

Insert into ShipsDocked (ShipNum, BaseID, QuantityOB)
values ('s0007','B0001',0);

Insert into ShipsDocked (ShipNum, BaseID, QuantityOB)
values ('s0008','B0001',0);

--Base2--
Insert into ShipsDocked (ShipNum, BaseID, QuantityOB)
values ('s0001','B0002',50);

Insert into ShipsDocked (ShipNum, BaseID, QuantityOB)
values ('s0002','B0002',18);

Insert into ShipsDocked (ShipNum, BaseID, QuantityOB)
values ('s0003','B0002',9);

Insert into ShipsDocked (ShipNum, BaseID, QuantityOB)
values ('s0004','B0002',8);

Insert into ShipsDocked (ShipNum, BaseID, QuantityOB)
values ('s0005','B0002', 6);

Insert into ShipsDocked (ShipNum, BaseID, QuantityOB)
values ('s0006','B0002', 6);

Insert into ShipsDocked (ShipNum, BaseID, QuantityOB)
values ('s0007','B0002', 2);

Insert into ShipsDocked (ShipNum, BaseID, QuantityOB)
values ('s0008','B0002', 1);

--Base3--
Insert into ShipsDocked (ShipNum, BaseID, QuantityOB)
values ('s0001','B0003',80);

Insert into ShipsDocked (ShipNum, BaseID, QuantityOB)
values ('s0002','B0003',40);

Insert into ShipsDocked (ShipNum, BaseID, QuantityOB)
values ('s0003','B0003',20);

Insert into ShipsDocked (ShipNum, BaseID, QuantityOB)
values ('s0004','B0003',20);

Insert into ShipsDocked (ShipNum, BaseID, QuantityOB)
values ('s0005','B0003',8);

Insert into ShipsDocked (ShipNum, BaseID, QuantityOB)
values ('s0006','B0003',8);

Insert into ShipsDocked (ShipNum, BaseID, QuantityOB)
values ('s0007','B0003',10);

Insert into ShipsDocked (ShipNum, BaseID, QuantityOB)
values ('s0008','B0003',5);

--Base4--
Insert into ShipsDocked (ShipNum, BaseID, QuantityOB)
values ('s0001','B0004',15);

Insert into ShipsDocked (ShipNum, BaseID, QuantityOB)
values ('s0002','B0004',5);

Insert into ShipsDocked (ShipNum, BaseID, QuantityOB)
values ('s0003','B0004',4);

Insert into ShipsDocked (ShipNum, BaseID, QuantityOB)
values ('s0004','B0004',0);

Insert into ShipsDocked (ShipNum, BaseID, QuantityOB)
values ('s0005','B0004',0);

Insert into ShipsDocked (ShipNum, BaseID, QuantityOB)
values ('s0006','B0004',0);

Insert into ShipsDocked (ShipNum, BaseID, QuantityOB)
values ('s0007','B0004',0);

Insert into ShipsDocked (ShipNum, BaseID, QuantityOB)
values ('s0008','B0004',2);

--Base5 everything before this adds up properlly--
Insert into ShipsDocked (ShipNum, BaseID, QuantityOB)
values ('s0001','B0005',20);

Insert into ShipsDocked (ShipNum, BaseID, QuantityOB)
values ('s0002','B0005',30);

Insert into ShipsDocked (ShipNum, BaseID, QuantityOB)
values ('s0003','B0005',5);

Insert into ShipsDocked (ShipNum, BaseID, QuantityOB)
values ('s0004','B0005',22);

Insert into ShipsDocked (ShipNum, BaseID, QuantityOB)
values ('s0005','B0005',4);

Insert into ShipsDocked (ShipNum, BaseID, QuantityOB)
values ('s0006','B0005',6);

Insert into ShipsDocked (ShipNum, BaseID, QuantityOB)
values ('s0007','B0005',8);

Insert into ShipsDocked (ShipNum, BaseID, QuantityOB)
values ('s0008','B0005',0);

--Base6 everything up to an including this adds up properlly----
Insert into ShipsDocked (ShipNum, BaseID, QuantityOB)
values ('s0001','B0006',16);

Insert into ShipsDocked (ShipNum, BaseID, QuantityOB)
values ('s0002','B0006',11);

Insert into ShipsDocked (ShipNum, BaseID, QuantityOB)
values ('s0003','B0006',20);

Insert into ShipsDocked (ShipNum, BaseID, QuantityOB)
values ('s0004','B0006',11);

Insert into ShipsDocked (ShipNum, BaseID, QuantityOB)
values ('s0005','B0006',5);

Insert into ShipsDocked (ShipNum, BaseID, QuantityOB)
values ('s0006','B0006',3);

Insert into ShipsDocked (ShipNum, BaseID, QuantityOB)
values ('s0007','B0006',3);

Insert into ShipsDocked (ShipNum, BaseID, QuantityOB)
values ('s0008','B0006',5);

--Base7--
Insert into ShipsDocked (ShipNum, BaseID, QuantityOB)
values ('s0001','B0007',4);

Insert into ShipsDocked (ShipNum, BaseID, QuantityOB)
values ('s0002','B0007',9);

Insert into ShipsDocked (ShipNum, BaseID, QuantityOB)
values ('s0003','B0007',2);

Insert into ShipsDocked (ShipNum, BaseID, QuantityOB)
values ('s0004','B0007',0);

Insert into ShipsDocked (ShipNum, BaseID, QuantityOB)
values ('s0005','B0007',0);

Insert into ShipsDocked (ShipNum, BaseID, QuantityOB)
values ('s0006','B0007',0);

Insert into ShipsDocked (ShipNum, BaseID, QuantityOB)
values ('s0007','B0007',0);

Insert into ShipsDocked (ShipNum, BaseID, QuantityOB)
values ('s0008','B0007',5);

--Base8--
Insert into ShipsDocked (ShipNum, BaseID, QuantityOB)
values ('s0001','B0008',2);

Insert into ShipsDocked (ShipNum, BaseID, QuantityOB)
values ('s0002','B0008',3);

Insert into ShipsDocked (ShipNum, BaseID, QuantityOB)
values ('s0003','B0008',0);

Insert into ShipsDocked (ShipNum, BaseID, QuantityOB)
values ('s0004','B0008',2);

Insert into ShipsDocked (ShipNum, BaseID, QuantityOB)
values ('s0005','B0008',4);

Insert into ShipsDocked (ShipNum, BaseID, QuantityOB)
values ('s0006','B0008',3);

Insert into ShipsDocked (ShipNum, BaseID, QuantityOB)
values ('s0007','B0008',2);

Insert into ShipsDocked (ShipNum, BaseID, QuantityOB)
values ('s0008','B0008',4);

--Base9--
Insert into ShipsDocked (ShipNum, BaseID, QuantityOB)
values ('s0001','B0009',3);

Insert into ShipsDocked (ShipNum, BaseID, QuantityOB)
values ('s0002','B0009',5);

Insert into ShipsDocked (ShipNum, BaseID, QuantityOB)
values ('s0003','B0009',4);

Insert into ShipsDocked (ShipNum, BaseID, QuantityOB)
values ('s0004','B0009',5);

Insert into ShipsDocked (ShipNum, BaseID, QuantityOB)
values ('s0005','B0009',6);

Insert into ShipsDocked (ShipNum, BaseID, QuantityOB)
values ('s0006','B0009',8);

Insert into ShipsDocked (ShipNum, BaseID, QuantityOB)
values ('s0007','B0009',7);

Insert into ShipsDocked (ShipNum, BaseID, QuantityOB)
values ('s0008','B0009',2);

--Base10--
Insert into ShipsDocked (ShipNum, BaseID, QuantityOB)
values ('s0001','B0010',10);

Insert into ShipsDocked (ShipNum, BaseID, QuantityOB)
values ('s0002','B0010',16);

Insert into ShipsDocked (ShipNum, BaseID, QuantityOB)
values ('s0003','B0010',5);

Insert into ShipsDocked (ShipNum, BaseID, QuantityOB)
values ('s0004','B0010',2);

Insert into ShipsDocked (ShipNum, BaseID, QuantityOB)
values ('s0005','B0010',2);

Insert into ShipsDocked (ShipNum, BaseID, QuantityOB)
values ('s0006','B0010',1);

Insert into ShipsDocked (ShipNum, BaseID, QuantityOB)
values ('s0007','B0010',3);

Insert into ShipsDocked (ShipNum, BaseID, QuantityOB)
values ('s0008','B0010',11);

-- Insert data for BaseCrew--

Insert into BaseCrew (pid, BaseID, ArrivalDate, DepartureDate)
values ('p00001','B0008','2001-10-31', NULL);

Insert into BaseCrew (pid, BaseID, ArrivalDate, DepartureDate)
values ('p00002','B0010','2000-06-17', NULL);

Insert into BaseCrew (pid, BaseID, ArrivalDate, DepartureDate)
values ('p00003','B0009','2003-05-05', '2004-04-23');

Insert into BaseCrew (pid, BaseID, ArrivalDate, DepartureDate)
values ('p00003','B0008','2004-04-23', NULL);

Insert into BaseCrew (pid, BaseID, ArrivalDate, DepartureDate)
values ('p00004','B0008','2001-10-31', NULL);

Insert into BaseCrew (pid, BaseID, ArrivalDate, DepartureDate)
values ('p00005','B0005','1999-01-01', '2005-11-03');

Insert into BaseCrew (pid, BaseID, ArrivalDate, DepartureDate)
values ('p00005','B0001','2005-11-10', NULL);

Insert into BaseCrew (pid, BaseID, ArrivalDate, DepartureDate)
values ('p00006','B0004','1994-08-09', '2010-07-10');

Insert into BaseCrew (pid, BaseID, ArrivalDate, DepartureDate)
values ('p00006','B0008','2010-07-17', NULL);

Insert into BaseCrew (pid, BaseID, ArrivalDate, DepartureDate)
values ('p00007','B0007','1995-05-01', '2000-05-31');

Insert into BaseCrew (pid, BaseID, ArrivalDate, DepartureDate)
values ('p00007','B0001','2000-06-03', NULL);

Insert into BaseCrew (pid, BaseID, ArrivalDate, DepartureDate)
values ('p00008','B0001','1989-05-04', NULL);

Insert into BaseCrew (pid, BaseID, ArrivalDate, DepartureDate)
values ('p00009','B0002','1995-09-03', NULL);

Insert into BaseCrew (pid, BaseID, ArrivalDate, DepartureDate)
values ('p00010','B0009','2002-12-12', NULL);

Insert into BaseCrew (pid, BaseID, ArrivalDate, DepartureDate)
values ('p00011','B0003','1990-12-31', NULL);

Insert into BaseCrew (pid, BaseID, ArrivalDate, DepartureDate)
values ('p00012','B0002','1988-04-04', '2003-01-01');

Insert into BaseCrew (pid, BaseID, ArrivalDate, DepartureDate)
values ('p00012','B0003','2003-01-02', NULL);

Insert into BaseCrew (pid, BaseID, ArrivalDate, DepartureDate)
values ('p00013','B0004','1989-10-04', NULL);

Insert into BaseCrew (pid, BaseID, ArrivalDate, DepartureDate)
values ('p00014','B0008','1988-09-01', NULL);

Insert into BaseCrew (pid, BaseID, ArrivalDate, DepartureDate)
values ('p00015','B0008','1989-09-01', NULL);

Insert into BaseCrew (pid, BaseID, ArrivalDate, DepartureDate)
values ('p00016','B0006','1989-09-04', NULL);

Insert into BaseCrew (pid, BaseID, ArrivalDate, DepartureDate)
values ('p00017','B0008','1989-09-01', NULL);

Insert into BaseCrew (pid, BaseID, ArrivalDate, DepartureDate)
values ('p00018','B0010','1999-02-13', NULL);

-- Insert data for amrmaments --

Insert into Armaments (WepID, WName, QuantityOH, CostCredits)
values ('w001','E-11 blaster rifle', 100, 1000);

insert into Armaments (WepID, WName, QuantityOH, CostCredits)
values ('w002','SE-14r repeating blaster', 100, 400);

Insert into Armaments (WepID, WName, QuantityOH, CostCredits)
values ('w003','DLT-19 heavy blaster rifle', 40, 2000);

Insert into Armaments (WepID, WName, QuantityOH, CostCredits)
values ('w004','E-11s sniper rifle', 20, 1600);

Insert into Armaments (WepID, WName, QuantityOH, CostCredits)
values ('w005','DLT-20a blaster rifle', 15, 1300);

Insert into Armaments (WepID, WName, QuantityOH, CostCredits)
values ('w006','T-21 light repeating blaster', 10, 2000);

Insert into Armaments (WepID, WName, QuantityOH, CostCredits)
values ('w007','L-s1 laser cannon', 100, 10000);

Insert into Armaments (WepID, WName, QuantityOH, CostCredits)
values ('w008','Taim&Bak XX-9 heavy turbolasers', 120, 5000);

Insert into Armaments (WepID, WName, QuantityOH, CostCredits)
values ('w009','Borstel NK-7 ion cannon', 120, 1000);

Insert into Armaments (WepID, WName, QuantityOH, CostCredits)
values ('w010','interplanatary laser XS-1', 1, 5000000);

-- Insert data for PersonnelWeapons -- 

Insert into PersonnelWeapons(pid, WepID,  QuantityHeld)
values ('p00002','w001', 1);

Insert into PersonnelWeapons(pid, WepID,  QuantityHeld)
values ('p00002','w002', 1);

Insert into PersonnelWeapons(pid, WepID,  QuantityHeld)
values ('p00003','w001', 1);

Insert into PersonnelWeapons(pid, WepID,  QuantityHeld)
values ('p00003','w002', 2);

Insert into PersonnelWeapons(pid, WepID,  QuantityHeld)
values ('p00003','w006', 1);

Insert into PersonnelWeapons(pid, WepID,  QuantityHeld)
values ('p00005','w002', 1);

Insert into PersonnelWeapons(pid, WepID,  QuantityHeld)
values ('p00006','w002', 1);

Insert into PersonnelWeapons(pid, WepID,  QuantityHeld)
values ('p00007','w001', 1);

Insert into PersonnelWeapons(pid, WepID,  QuantityHeld)
values ('p00007','w002', 1);

Insert into PersonnelWeapons(pid, WepID,  QuantityHeld)
values ('p00008','w002', 1);

Insert into PersonnelWeapons(pid, WepID,  QuantityHeld)
values ('p00009','w002', 1);

Insert into PersonnelWeapons(pid, WepID,  QuantityHeld)
values ('p00010','w002', 1);

Insert into PersonnelWeapons(pid, WepID,  QuantityHeld)
values ('p00011','w002', 1);

Insert into PersonnelWeapons(pid, WepID,  QuantityHeld)
values ('p00012','w002', 1);

Insert into PersonnelWeapons(pid, WepID,  QuantityHeld)
values ('p00013','w002', 1);

Insert into PersonnelWeapons(pid, WepID,  QuantityHeld)
values ('p00014','w003', 1);

Insert into PersonnelWeapons(pid, WepID,  QuantityHeld)
values ('p00014','w002', 1);

Insert into PersonnelWeapons(pid, WepID,  QuantityHeld)
values ('p00015','w005', 1);

Insert into PersonnelWeapons(pid, WepID,  QuantityHeld)
values ('p00015','w001', 1);

Insert into PersonnelWeapons(pid, WepID,  QuantityHeld)
values ('p00015','w002', 1);

Insert into PersonnelWeapons(pid, WepID,  QuantityHeld)
values ('p00016','w004', 1);

Insert into PersonnelWeapons(pid, WepID,  QuantityHeld)
values ('p00016','w002', 1);

Insert into PersonnelWeapons(pid, WepID,  QuantityHeld)
values ('p00017','w003', 1);

Insert into PersonnelWeapons(pid, WepID,  QuantityHeld)
values ('p00017','w002', 1);

Insert into PersonnelWeapons(pid, WepID,  QuantityHeld)
values ('p00018','w005', 1);

Insert into PersonnelWeapons(pid, WepID,  QuantityHeld)
values ('p00018','w002', 1);

-- Insert Data for stationweapons -- 

Insert into StationWeapons(StationNum, WepID, QuantityOnBoard)
values ('00015','w007', 60);

Insert into StationWeapons(StationNum, WepID, QuantityOnBoard)
values ('00015','w008', 40);

Insert into StationWeapons(StationNum, WepID, QuantityOnBoard)
values ('00015','w009', 50);

Insert into StationWeapons(StationNum, WepID, QuantityOnBoard)
values ('10000','w007', 40);

Insert into StationWeapons(StationNum, WepID, QuantityOnBoard)
values ('10000','w008', 80);

Insert into StationWeapons(StationNum, WepID, QuantityOnBoard)
values ('10000','w009', 70);

Insert into StationWeapons(StationNum, WepID, QuantityOnBoard)
values ('10000','w010', 1);

Insert into QualifiedToFly (pid, ShipNum)
	Values('p00007','s0001');

Insert into QualifiedToFly (pid, ShipNum)
	Values('p00007','s0003');

Insert into QualifiedToFly (pid, ShipNum)
	Values('p00007','s0004');

Insert into QualifiedToFly (pid, ShipNum)
	Values('p00007','s0008');

Insert into QualifiedToFly (pid, ShipNum)
	Values('p00009','s0001');

Insert into QualifiedToFly (pid, ShipNum)
	Values('p00009','s0002');

Insert into QualifiedToFly (pid, ShipNum)
	Values('p00009','s0005');

Insert into QualifiedToFly (pid, ShipNum)
	Values('p00010','s0001');

Insert into QualifiedToFly (pid, ShipNum)
	Values('p00010','s0003');

Insert into QualifiedToFly (pid, ShipNum)
	Values('p00010','s0004');

Insert into QualifiedToFly (pid, ShipNum)
	Values('p00010','s0008');

Insert into QualifiedToFly (pid, ShipNum)
	Values('p00011','s0001');

Insert into QualifiedToFly (pid, ShipNum)
	Values('p00011','s0002');

Insert into QualifiedToFly (pid, ShipNum)
	Values('p00011','s0006');

Insert into QualifiedToFly (pid, ShipNum)
	Values('p00011','s0007');

Insert into QualifiedToFly (pid, ShipNum)
	Values('p00012','s0001');

Insert into QualifiedToFly (pid, ShipNum)
	Values('p00012','s0002');

Insert into QualifiedToFly (pid, ShipNum)
	Values('p00012','s0006');

Insert into QualifiedToFly (pid, ShipNum)
	Values('p00012','s0007');

Insert into QualifiedToFly (pid, ShipNum)
	Values('p00013','s0001');

Insert into QualifiedToFly (pid, ShipNum)
	Values('p00013','s0002');

Insert into QualifiedToFly (pid, ShipNum)
	Values('p00013','s0003');

Insert into QualifiedToFly (pid, ShipNum)
	Values('p00013','s0004');

Insert into QualifiedToFly (pid, ShipNum)
	Values('p00013','s0005');

Insert into QualifiedToFly (pid, ShipNum)
	Values('p00013','s0006');

-- VIEWS --

-- PersonnelLocation --

CREATE VIEW PersonnelLocation AS
	SELECT firstname, lastname, name, region, ssystem, sector
	FROM people, BaseCrew, Bases
	WHERE people.pid = BaseCrew.pid
	AND BaseCrew.BaseID = Bases.BaseID
	AND BaseCrew.departuredate is NULL
	ORDER BY region;

-- PersonnelWeaponsInventory --

CREATE VIEW PersonellWeaponsInventory AS
	SELECT Wname, QuantityOH - sum(PersonnelWeapons.quantityheld) as InStock
	FROM Armaments, PersonnelWeapons
	WHERE Armaments.WepID = PersonnelWeapons.WepID
	GROUP BY armaments.Wname, QuantityOH, Armaments.WepID
	ORDER BY Armaments.WepID;

-- WeaponTracker --

CREATE VIEW WeaponTracker AS
	SELECT firstname, lastname, WName, QuantityHeld 
	FROM people
	INNER JOIN PersonnelWeapons
	ON people.pid = PersonnelWeapons.pid
	INNER JOIN Armaments
	ON PersonnelWeapons.WepID = Armaments.WepID;


-- INTERESTING QUERIES --

-- 1. Query to return the number of stormtroopers within the same sector --  

SELECT sector, count(s.pid)
FROM stormtroopers s
INNER JOIN BaseCrew bc
ON s.pid = bc.pid
INNER JOIN bases b
ON bc.baseid = b.baseid
GROUP BY sector

-- 2. Query to return  the number of each weapon  held by stormtroopers --

SELECT Wname, count(s.pid)
FROM PersonnelWeapons PW
INNER JOIN Armaments A
ON A.WepID = PW.WepID
INNER JOIN stormtroopers s
ON s.pid = PW.pid
group by a.wname

-- 3. Query to return  total cost of ships docked (in credits) --

SELECT sum(costCREDITS*QuantityOB)
from Ships, ShipsDocked
where Ships.ShipNum = ShipsDocked.ShipNum

-- 4. Query to return % of pilots who have been flying for more than 20 years --

SELECT TRUNC (
	   CAST(
		       ( select count(pilots.pid)
		         from people, pilots
		         where people.pid = pilots.pid
		         and (date_part('year', age(firstflight)))>20
		       )as decimal
		      )
	              /
	            ( select count(pilots.pid)
		      from pilots
		      )
		    *100
		  ) as Percent_Over20

-- stored procedures --

-- 1. Function gives stormtroopers who are riflemen one EF-11 Blaster and one  SE14-r repeating blaster --


CREATE OR REPLACE FUNCTION add_PersonnelWeapons() RETURNS trigger AS
	$BODY$
			BEGIN
					IF NEW.squadrole = 'rifleman' THEN
						INSERT INTO PersonnelWeapons (pid, WepID, QuantityHeld) 
						VALUES (NEW.pid, 'w001', 1);
						INSERT INTO PersonnelWeapons (pid, WepID, QuantityHeld) 
						VALUES (NEW.pid, 'w002', 1);
					END IF;
				RETURN NEW;
			END;
	$BODY$
LANGUAGE plpgsql;

-- 2. Function returns galactic address given a BaseID --


CREATE OR REPLACE FUNCTION BaseLocation (IN BaseID varchar(5))
RETURNS TABLE ("region" text,"sector" text,"ssystem" text, "name" text) AS
$BODY$
		BEGIN
				RETURN QUERY SELECT Bases.region as region, Bases.sector as sector, 
										Bases.ssystem as ssystem, Bases.name as name
								FROM Bases
								WHERE Bases.BaseID = BaseLocation.BaseID;
		END;
$BODY$
LANGUAGE plpgsql;

-- Triggers --

CREATE TRIGGER add_PersonnelWeapons
AFTER INSERT ON Stormtroopers
FOR EACH ROW 
EXECUTE PROCEDURE add_PersonnelWeapons();

-- Security --

--admin--

CREATE ROLE admin;
GRANT ALL ON ALL TABLES
IN SCHEMA PUBLIC
TO admin;

--ArmoryClerks--

CREATE ROLE Armory;
GRANT SELECT ON ALL TABLES
IN SCHEMA PUBLIC
TO Armory;
GRANT INSERT ON Armaments
TO Armory;
GRANT UPDATE ON Armaments, PersonnelWeapons, StationWeapons
TO Armory;












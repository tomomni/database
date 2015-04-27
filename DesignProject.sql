-- Create Table Statements -- 

CREATE TABLE people (
  pid		 char(6) not null unique,
  firstname	 text not null,
  lastname 	 text not null,
  DateOfBirth	 date not null,
 primary key(pid)
);

-- function dependencies pid -> firstname, lastname, DateOfBirth
CREATE TABLE stormtroopers (
 pid		char(6) not null unique references people(pid),
 rank		text not null,
 squadrole	text not null,
primary key(pid)
);

CREATE TABLE pilots (
 pid		char(6) not null unique references people(pid),
 Dshiptype	text not null,
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
 Region			text not null,
 Sector			text not null,
 SSystem		text not null,
 ShipCapacity		integer not null,
primary key(BaseID)
);

CREATE TABLE Planets (
 BaseID			char(5) not null unique references Bases(BaseID),
 PName			text not null,
primary key(BaseID)
);

CREATE TABLE Moons (
 BaseID			char(5) not null unique references Bases(BaseID),
 MName			text not null,
primary key(BaseID)
);

CREATE TABLE SpaceStations (
 StationNum		char(5) not null unique,
 SSName			text not null, 
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
primary key(ShipNum)
);

CREATE TABLE Fighters (
 ShipNum		char(5) not null unique references Ships(ShipNum),
 CrewCapacity		integer not null,
 EngineType		text not null,
 QuantityOH		integer not null, 
primary key(ShipNum)
);

CREATE TABLE Bombers (
 ShipNum		char(5) not null unique references Ships(ShipNum),
 CrewCapacity		integer not null,
 CargoCapTons		integer not null,
 EngineType		text not null,
 QuantityOH		integer not null, 
primary key(ShipNum)
);


CREATE TABLE ShipsDocked (
 ShipNum		char(5) not null references Ships(ShipNum),
 BaseID			char(5) not null references Bases(BaseID),
 QuantityOB		integer not null,
primary key(BaseID,ShipNum)
);

CREATE TABLE BaseCrew (
 pid			char(6) not null unique references people(pid),
 BaseID			char(5) not null references Bases(BaseID),
primary key(pid,BaseID)
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

-- setting adjustments --

set datestyle = 'sql, ymd'

-- insert statements --

--people--
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


Insert into pilots(pid, Dshiptype, firstflight)
values ('p00007', 'Bomber', '1995-09-03');

Insert into pilots(pid, Dshiptype, firstflight)
values ('p00009', 'Fighter', '2009-04-26');

Insert into pilots(pid, Dshiptype, firstflight)
values ('p00010', 'Fighter', '1989-12-25');

Insert into pilots(pid, Dshiptype, firstflight)
values ('p00011', 'Bomber', '1994-02-14');

Insert into pilots(pid, Dshiptype, firstflight)
values ('p00012', 'Fighter', '2000-03-01');

Insert into pilots(pid, Dshiptype, firstflight)
values ('p00013', 'Fighter', '1992-06-30');


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

--Bases--
Insert into Bases (BaseID, Region, Sector, SSystem, ShipCapacity)
values ('B0001', 'Deep Core', 'Sector 5','Prakith',20);

Insert into Bases (BaseID, Region, Sector, SSystem, ShipCapacity)
values ('B0002', 'Inner Rim', 'Adari Sector','Adim', 100);

Insert into Bases (BaseID, Region, Sector, SSystem, ShipCapacity)
values ('B0003', 'Mid Rim', 'Msst Sector','Garos IV', 225);

Insert into Bases (BaseID, Region, Sector, SSystem, ShipCapacity)
values ('B0004', 'Outer Rim Territories', 'Kanz Sector','Jerne',30);

Insert into Bases (BaseID, Region, Sector, SSystem, ShipCapacity)
values ('B0005', 'Galactic Core', 'Farlax Sector','Nzoth',125);

Insert into Bases (BaseID, Region, Sector, SSystem, ShipCapacity)
values ('B0006', 'Galactic Core', 'Corusca Sector','Coruscant',75);

Insert into Bases (BaseID, Region, Sector, SSystem, ShipCapacity)
values ('B0007', 'Expansion Region', 'Brak Sector','Genesia',20);

Insert into Bases (BaseID, Region, Sector, SSystem, ShipCapacity)
values ('B0008', 'Outer Rim Territories', 'Atrivis Sector','Horuz',20);

Insert into Bases (BaseID, Region, Sector, SSystem, ShipCapacity)
values ('B0009', 'Outer Rim Territories', 'Moddell Sector','Endor',40);

Insert into Bases (BaseID, Region, Sector, SSystem, ShipCapacity)
values ('B0010', 'Outer Rim Territories', 'Anoat Sector','Hoth',50);

Insert into Planets (BaseID, PName)
values ('B0001','Prakith');

Insert into Planets (BaseID, PName)
values ('B0002','Adim');

Insert into Planets (BaseID, PName)
values ('B0003','Garos IV');

Insert into Planets (BaseID, PName)
values ('B0004','Jerne');

Insert into Planets (BaseID, PName)
values ('B0006','Coruscant');

Insert into Planets (BaseID, PName)
values ('B0010','Hoth');

Insert into Moons (BaseID, MName)
values ('B0007','Grimm');

Insert into Moons (BaseID, MName)
values ('B0009','Endor');

Insert into SpaceStations (StationNum,SSName,StationType,CrewCapacity,BaseID)
values ('00015','Black Fifteen','Repair Yard',200,'B0005');

Insert into SpaceStations (StationNum,SSName,StationType,CrewCapacity,BaseID)
values ('10000','The Death Star','Battle Station',12000,'B0008');

--ships--
Insert into Ships (ShipNum, ShipName, costCREDITS)
values ('s0001', 'TIE/LN starfighter', '60000');

Insert into Ships (ShipNum, ShipName, costCREDITS)
values ('s0002', 'TIE/SA bomber', '65000');

Insert into Ships (ShipNum, ShipName, costCREDITS)
values ('s0003', 'TIE/IN interceptor', '72000');

Insert into Ships (ShipNum, ShipName, costCREDITS)
values ('s0004', 'TIE/X1 advanced', '90000');

Insert into Ships (ShipNum, ShipName, costCREDITS)
values ('s0005', 'Scimitar assualt bomber', '71500');

Insert into Ships (ShipNum, ShipName, costCREDITS)
values ('s0006', 'Neutralizer-class bomber', '83000');

Insert into Ships (ShipNum, ShipName, costCREDITS)
values ('s0007', 'TIE/D automated fighter', '170000');

Insert into Ships (ShipNum, ShipName, costCREDITS)
values ('s0008', 'Starhunter', '100000');

Insert into Fighters (ShipNum, CrewCapacity, EngineType, QuantityOH)
values ('s0001', 2, 'SFS P-s4 twin ion', 212);

Insert into Fighters (ShipNum, CrewCapacity, EngineType, QuantityOH)
values ('s0003', 1, 'SFS P-s5.6 twin ion', 71);

Insert into Fighters (ShipNum, CrewCapacity, EngineType, QuantityOH)
values ('s0004', 1, 'SFS P-s5.6 twin ion', 70);

Insert into Fighters (ShipNum, CrewCapacity, EngineType, QuantityOH)
values ('s0007', 0, 'SFS P-s4 twin ion', 35);

Insert into Fighters (ShipNum, CrewCapacity, EngineType, QuantityOH)
values ('s0008', 1, 'SFS P-s7.2 twin ion', 35);

Insert into Bombers (ShipNum, CrewCapacity, CargoCapTons, EngineType, QuantityOH)
values ('s0002', 1, 15, 'SFS P-s4 twin ion', 141);

Insert into Bombers (ShipNum, CrewCapacity, CargoCapTons, EngineType, QuantityOH)
values ('s0005', 2, 3, 'Single SFS P-s4 ion', 35);

Insert into Bombers (ShipNum, CrewCapacity, CargoCapTons, EngineType, QuantityOH)
values ('s0006', 1, 2, 'single E-16/x ion', 35);


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

--Base6--
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

-BaseCrew--
Insert into BaseCrew (pid, BaseID)
values ('p00001','B0008');

Insert into BaseCrew (pid, BaseID)
values ('p00002','B0010');

Insert into BaseCrew (pid, BaseID)
values ('p00003','B0009');

Insert into BaseCrew (pid, BaseID)
values ('p00004','B0008');

Insert into BaseCrew (pid, BaseID)
values ('p00005','B0005');

Insert into BaseCrew (pid, BaseID)
values ('p00006','B0004');

Insert into BaseCrew (pid, BaseID)
values ('p00007','B0007');

Insert into BaseCrew (pid, BaseID)
values ('p00008','B0001');

Insert into BaseCrew (pid, BaseID)
values ('p00009','B0002');

Insert into BaseCrew (pid, BaseID)
values ('p00010','B0009');

Insert into BaseCrew (pid, BaseID)
values ('p00011','B0003');

Insert into BaseCrew (pid, BaseID)
values ('p00012','B0002');

Insert into BaseCrew (pid, BaseID)
values ('p00013','B0004');

Insert into BaseCrew (pid, BaseID)
values ('p00014','B0008');

Insert into BaseCrew (pid, BaseID)
values ('p00015','B0008');

Insert into BaseCrew (pid, BaseID)
values ('p00016','B0006');

Insert into BaseCrew (pid, BaseID)
values ('p00017','B0008');

Insert into BaseCrew (pid, BaseID)
values ('p00018','B0010');

--Armaments--
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

--PersonnelWeapons--
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

--StationWeapons--
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

-- Known Errors 
-- People can't transfer bases, can be fixed by adding a date of arrival, 
-- will be done in a future update.


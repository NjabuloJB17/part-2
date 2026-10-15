create database raceday;
use raceday;

create table organisers(
organiser_id int primary key identity (1,1),
organiser_name varchar(30),
organiser_surname varchar(30),
organiser_email varchar(50),
organiser_number varchar(10)
);

create table participant(
participant_id int primary key identity (1,1),
participant_name varchar(30),
participant_surname varchar(30),
participant_email varchar(50),
participant_number varchar(10)
);
select * from participant;

create table raceday(
raceday_id int primary key identity (1,1),
raceday_weather varchar(20),
raceday_route_information varchar(100),
participant_id int,
foreign key (participant_id) references participant(participant_id)
);

create table events(
events_id int primary key identity (1,1),
events_name varchar(30),
events_date date,
raceday_id int,
foreign key (raceday_id) references raceday(raceday_id)
);
SELECT * FROM events;

create table categories(
categories_id int primary key identity (1,1),
categories_name varchar(30),
events_id int,
foreign key (events_id) references events(events_id)
);
SELECT * FROM categories;

create table performance(
performance_id int primary key identity (1,1),
performance_history varchar(30),
participant_id int,
foreign key (participant_id) references participant(participant_id)
);

create table enrollment(
enrolment_id int primary key identity (1,1),
participant_id int,
events_id int,
categories_id int,
foreign key (participant_id) references participant(participant_id),
foreign key (events_id) references events(events_id),
foreign key (categories_id) references categories(categories_id)
);
select * from enrollment;

CREATE TABLE accounts(
    account_id INT PRIMARY KEY IDENTITY(1,1),
    email VARCHAR(50) UNIQUE NOT NULL,
    password VARCHAR(255) NOT NULL,
    role VARCHAR(20) NOT NULL
);

select * from accounts; 

insert into organisers(organiser_name,organiser_surname,organiser_email,organiser_number)
values 
('Njabulo', 'Ncala', 'Njbauloncala@gmail.com','0833893800'),
('Jack', 'Bonga', 'Jackbonga@gmail.com', '0845140184');


insert into participant(participant_name,participant_surname,participant_email,participant_number)
values 
('Carol','Smith','carolsmith@gmail.com','0795111789'),
('Ayanda','Abu','abuaya@gmail.com','0731595523'),
('JB','Sikoe','sikoe@gmail.com','0821234567'),
('Faith','Mthembu','faith@gmail.com','0834567890'),
('Sipho','Dlamini','sipho@gmail.com','0712345678'),
('Thandi','Zulu','thandi@gmail.com','0723456789');


insert into raceday(raceday_weather,raceday_route_information,participant_id)
values
('Sunny','Soweto Route',1),
('Cloudy','Cape Town Route',2),
('Clear','Durban Route',3);


INSERT INTO events(events_name,events_date,raceday_id)
VALUES
('Soweto Marathon','2026-11-01',1),
('Cape Town Cycle Tour','2026-03-08',2),
('Durban Fun Run','2026-07-18',3);


INSERT INTO categories(categories_name,events_id)
VALUES
-- Soweto Marathon
('10km',1),
('21km Half Marathon',1),
('42.2km Marathon',1),

-- Cape Town Cycle Tour
('40km Cycle',2),
('80km Cycle',2),
('109km Cycle Tour',2),

-- Durban Fun Run
('5km Fun Run',3),
('10km Fun Run',3),
('15km Challenge',3);


insert into performance(performance_history,participant_id)
values
('Completed in 60 minutes',1),
('Completed in 75 minutes',2),
('Completed in 55 minutes',3),
('Completed in 90 minutes',4),
('Completed in 65 minutes',5),
('Completed in 80 minutes',6);


insert into enrollment(participant_id,events_id,categories_id)
values
(1,1,1),
(2,1,2),
(3,1,3),
(4,2,4),
(5,2,5),
(6,3,7);


SELECT COLUMN_NAME
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME = 'categories';
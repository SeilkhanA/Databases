CREATE DATABASE Lab6
  OWNER postgres;

drop table if exists Movie;
drop table if exists Reviewer;
drop table if exists Rating;

/* Create the schema for our tables */
create table Movie(
  mID int PRIMARY KEY NOT NULL,
  title text UNIQUE NOT NULL,
  year int UNIQUE NOT NULL CHECK(year > 1900),
  director text
);

create table Reviewer(
  rID int PRIMARY KEY NOT NULL ,
  name text NOT NULL
);
create table Rating(
  rID int REFERENCES Reviewer(rID) CHECK(sum(rID) = 853),
  mID int REFERENCES Movie(mID) ,
  stars int NOT NULL CHECK(stars BETWEEN 1 AND 5),
  ratingDate date PRIMARY KEY CHECK( ratingDate > '2000-12-31')
);

/* Populate the tables with our data */
insert into Movie values(101, 'Gone with the Wind', 1939, 'Victor Fleming');
insert into Movie values(102, 'Star Wars', 1977, 'George Lucas');
insert into Movie values(103, 'The Sound of Music', 1965, 'Robert Wise');
insert into Movie values(104, 'E.T.', 1982, 'Steven Spielberg');
insert into Movie values(105, 'Titanic', 1997, 'James Cameron');
insert into Movie values(106, 'Snow White', 1937, null);
insert into Movie values(107, 'Avatar', 2009, 'James Cameron');
insert into Movie values(108, 'Raiders of the Lost Ark', 1981, 'Steven Spielberg');

insert into Reviewer values(201, 'Sarah Martinez');
insert into Reviewer values(202, 'Daniel Lewis');
insert into Reviewer values(203, 'Brittany Harris');
insert into Reviewer values(204, 'Mike Anderson');
insert into Reviewer values(205, 'Chris Jackson');
insert into Reviewer values(206, 'Elizabeth Thomas');
insert into Reviewer values(207, 'James Cameron');
insert into Reviewer values(208, 'Ashley White');

insert into Rating values(201, 101, 2, '2011-01-22');
insert into Rating values(201, 101, 4, '2011-01-27');
insert into Rating values(202, 106, 4, null);
insert into Rating values(203, 103, 2, '2011-01-20');
insert into Rating values(203, 108, 4, '2011-01-12');
insert into Rating values(203, 108, 2, '2011-01-30');
insert into Rating values(204, 101, 3, '2011-01-09');
insert into Rating values(205, 103, 3, '2011-01-27');
insert into Rating values(205, 104, 2, '2011-01-22');
insert into Rating values(205, 108, 4, null);
insert into Rating values(206, 107, 3, '2011-01-15');
insert into Rating values(206, 106, 5, '2011-01-19');
insert into Rating values(207, 107, 5, '2011-01-20');
insert into Rating values(208, 104, 3, '2011-01-02');

--SELECT * FROM Movie;
--11
UPDATE Movie
SET mID = mID + 1;

--12
INSERT INTO Movie VALUES (109,'Titanic', 1997, 'JC');

--13
INSERT INTO Reviewer VALUES (201, 'Ted Codd');

--14
UPDATE Rating
SET rID  = 205 AND mID = 104;

--15
INSERT INTO Reviewer VALUES (209, NULL);

--16
UPDATE Rating
SET stars = NULL
    WHERE rID = 208;

--17
UPDATE Movie
SET year = year - 40;

--18
UPDATE Rating
SET stars = stars + 1;

--19
INSERT INTO Rating VALUES (201, 101, 1, '1999-01-01');

--20
INSERT INTO Movie VALUES (109, 'Jurassic Park', 1993, 'Steven Spielberg');

--21
UPDATE Movie
SET year = year - 10
WHERE title = 'Titanic';

--22
INSERT INTO Movie VALUES (109, 'Titanic', 2001, null);


--SELECT * FROm Movie;

--23
UPDATE Rating
SET mID = 109;

--24
UPDATE Movie
SET year =  1901
WHERE director <> 'James Cameron';

--25
UPDATE Rating
SET stars = stars - 1;

--26

ALTER TABLE Rating
    ADD FOREIGN KEY(rID) REFERENCES Reviewer(rID) ON
    UPDATE CASCADE ON DELETE
    SET NULL;

ALTER TABLE Rating
    ADD FOREIGN KEY(mID) REFERENCES Movie(mID)ON
    DELETE CASCADE;


--27
INSERT INTO Rating VALUES (209, 109, 3, '2001-01-01');

--28
UPDATE Rating
SET rID = 209
WHERE rID = 208;


--29
UPDATE Rating
SET mID  = mID + 1;

--30
UPDATE Movie
SET mID = 109
WHERE mID = 108;

--31
UPDATE Movie
SET mID = 109
WHERE mID = 102;

--32
UPDATE Reviewer
SET rID = rID + 10;

--33
DELETE FROM Reviewer
WHERE rID > 215;

--34
DELETE FROM Movie
WHERE mID < 105;


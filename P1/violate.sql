-- 1. Constraint: PRIMARY KEY(id) from Movie
INSERT INTO Movie VALUES(2, 'movie name', 2020, 'PG-13', 'company name');
-- ERROR 1062 (23000): Duplicate entry '2' for key 'PRIMARY'

-- 2. Constraint: CHECK(year > 1000)
INSERT INTO Movie VALUES(6000, 'movie name', 100, 'PG-13', 'company name');
-- it violates the check which is not actually working in mysql

-- 3. Constraint: PRIMARY KEY(id) from Actor
INSERT INTO Actor VALUES(68642, 'last name', 'first name', 'sex', 'dob', 'dod');
-- ERROR 1062 (23000): Duplicate entry '68642' for key 'PRIMARY'

-- 4. Constraint: CHECK(dob < dod) from Actor
INSERT INTO Actor VALUES(80000, 'last name', 'first name', 'sex', '2020-01-01', '1980-01-01');
-- it violates the check which is not acutally working in mysql

-- 5. Constraint: FOREIGN KEY(mid) REFERENCES Movie(id) from Sales
INSERT INTO Sales VALUES(8002, '1', '10');
-- ERROR 1452 (23000): Cannot add or update a child row: a foreign key constraint fails (`CS143`.`Sales`, CONSTRAINT `Sales_ibfk_1` FOREIGN KEY (`mid`) REFERENCES `Movie` (`id`))

-- 6. Constraint: CHECK(ticketsSold > -1) from Sales
INSERT INTO Sales VALUES(8002, '-100', '10');
-- it violates the check which is not actually working in mysql

-- 7. Constraint: PRIMARY KEY(ID) from Director
INSERT INTO Director VALUES(68618 , 'last name', 'first name', 'dob', 'dod');
-- ERROR 1062 (23000): Duplicate entry '68618' for key 'PRIMARY'

-- 8. Constraint: CHECK(dob < dod) from Director
INSERT INTO Director  VALUES(90000, 'last name', 'first name', 'sex', '2020-01-01', '1980-01-01');
-- it violates the check which is not acutally working in mysql

-- 9. Constraint: FOREIGN KEY(mid) REFERENCES Movie(id) from MovieGenre
INSERT INTO MovieGenre VALUES(7000, 'Comedy');
-- ERROR 1452 (23000): Cannot add or update a child row: a foreign key constraint fails (`CS143`.`MovieGenre`, CONSTRAINT `MovieGenre_ibfk_1` FOREIGN KEY (`mid`) REFERENCES `Movie` (`id`))

-- 10. Constraint: FOREIGN KEY(mid) REFERENCES Movie(id) from MovieDirector
INSERT INTO MovieDirector VALUES(7000, 68642);
  -- ERROR 1452 (23000): Cannot add or update a child row: a foreign key constraint fails (`CS143`.`MovieDirector`, CONSTRAINT `MovieDirector_ibfk_1` FOREIGN KEY (`mid`) REFERENCES `Movie` (`id`))

-- 11. Constraint: FOREIGN KEY(did) REFERENCES Director(id) from MovieDirector
INSERT INTO MovieDirector VALUES(2, 80000);
-- ERROR 1452 (23000): Cannot add or update a child row: a foreign key constraint fails (`CS143`.`MovieDirector`, CONSTRAINT `MovieDirector_ibfk_2` FOREIGN KEY (`did`) REFERENCES `Director` (`id`))

-- 12. Constraint: FOREIGN KEY(mid) REFERENCES Movie(id) from MovieActor
INSERT INTO MovieActor VALUES(8000, 68642, 'role name');
-- ERROR 1452 (23000): Cannot add or update a child row: a foreign key constraint fails (`CS143`.`MovieActor`, CONSTRAINT `MovieActor_ibfk_1` FOREIGN KEY (`mid`) REFERENCES `Movie` (`id`))

-- 13. Constraint: FOREIGN KEY(aid) REFERENCES Actor(id) from MovieActor
INSERT INTO MovieActor VALUES(2, 80000, 'role name');
-- ERROR 1452 (23000): Cannot add or update a child row: a foreign key constraint fails (`CS143`.`MovieActor`, CONSTRAINT `MovieActor_ibfk_2` FOREIGN KEY (`aid`) REFERENCES `Actor` (`id`))

-- 14. Constraint: FOREIGN KEY(mid) REFERENCES Movie(id) from MovieRating
INSERT INTO MovieRating VALUES(8000, 90, 90);
-- ERROR 1452 (23000): Cannot add or update a child row: a foreign key constraint fails (`CS143`.`MovieRating`, CONSTRAINT `MovieRating_ibfk_1` FOREIGN KEY (`mid`) REFERENCES `Movie` (`id`))

-- 15. Constraint: FOREIGN KEY(mid) REFERENCES Movie(id) from Review
INSERT INTO Review VALUES('name', 'date', 8000, 99, 'nice!');
-- ERROR 1452 (23000): Cannot add or update a child row: a foreign key constraint fails (`CS143`.`Review`, CONSTRAINT `Review_ibfk_1` FOREIGN KEY (`mid`) REFERENCES `Movie` (`id`))

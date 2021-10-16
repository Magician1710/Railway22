CREATE DATABASE IF NOT EXISTS testing_system_assignment_4;
USE testing_system_assignment_4;

DROP TABLE IF EXISTS 	Reviewers,
						Reviews,
                        Series
;


CREATE TABLE Reviewers
(
	Reviewer_id  			TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY ,
    first_name 				VARCHAR(100) NOT NULL,
    last_name 				VARCHAR(100) NOT NULL
);

CREATE TABLE Series
(
	Series_id  			TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY ,
    title 				VARCHAR(100) NOT NULL,
    released_year 		INT,
    genre				ENUM("Animation","Drama","Comedy") DEFAULT "Animation"

);


CREATE TABLE Reviews
(
	Review_id  			TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY ,
    rating 				DECIMAL(3,2) ,
    Series_id 			TINYINT	UNSIGNED,
    Reviewer_id			TINYINT	UNSIGNED,
    -- PRIMARY KEY		(Series_id,Reviewer_id),
    FOREIGN KEY		(Series_id)		REFERENCES	Series(Series_id),
    FOREIGN KEY 	(Reviewer_id)	REFERENCES	Reviewers(Reviewer_id)    
);









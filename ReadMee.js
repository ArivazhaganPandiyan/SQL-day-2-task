/*
create database guvi;
====================
use guvi;
========

— — —------ users — — — — — — — — — — — — — — — -

CREATE TABLE Users(
  `user_id`  BIGINT NOT NULL AUTO_INCREMENT,
  `full_name` VARCHAR(45) NOT NULL,
  `email` VARCHAR(45) NOT NULL,
  `mobile` INT(10) NOT NULL,
  `college` VARCHAR(45) NOT NULL,
  `current_city` VARCHAR(45) NOT NULL,
  `user_type` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`user_id`));

— — —------ class — — — — — — — — — — — — — — — -

  CREATE TABLE Class 
( 
    DAY INTEGER, 
    TOPIC TEXT, 
    TASK TEXT ,
    
);
— — — — — — — — — course — — — — — — — — — — — -

CREATE TABLE courses(
  `course_id` INT NOT NULL AUTO_INCREMENT,
  `course_name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`course_id`));

  — — — — — — — — — topics — — — — — — — — — — — -

  CREATE TABLE topics( `topic_id` INT NOT NULL AUTO_INCREMENT,
	`topic_name` VARCHAR(45) NOT NULL, 
	`course_id` INT NOT NULL, 
	PRIMARY KEY (`topic_id`), 
	INDEX `courseIdKey_idx` (`course_id` ASC), 
	CONSTRAINT `courseIdKey` FOREIGN KEY (`course_id`) 
	REFERENCES `courses` (`course_id`) 
	ON DELETE NO ACTION
	ON UPDATE NO ACTION);

— — — — — — — — -admissions — — — — — — — — — — — — — — -
create table admissions(
userid int,
course_id int,
admission_fees varchar(25),
foreign key(userid) references user(userid),
foreign key(course_id) references course(course_id)
);

— — — — — — — codekata — — — — — — — — — — — — — — —
CREATE TABLE codekata(
  `id` INT NOT NULL AUTO_INCREMENT,
  `user_id` INT NOT NULL,
  `total_submissions` INT NOT NULL,
  `geek_coins` INT NOT NULL,
  `rank` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `userIdKeyCodeKata_idx` (`user_id` ASC),
  CONSTRAINT `userIdKeyCodeKata`
    FOREIGN KEY (`user_id`)
    REFERENCES Users(`user_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);

— — — — — — — — — mentor — — — — — — — — — — — — — — — — -

CREATE TABLE mentor(
  `row_id` INT NOT NULL AUTO_INCREMENT,
  `mentor_id` INT NOT NULL,
  `student_id` INT NOT NULL,
  PRIMARY KEY (`row_id`))

— — — — — — — — — — — — —attendance — — — — — — — — — — — —
CREATE TABLE attendance(
  `entry_id` INT NOT NULL AUTO_INCREMENT,
  `date` DATE NOT NULL,
  `user_id` INT NOT NULL,
  `status` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`entry_id`),
  INDEX `userIdKey_idx` (`user_id` ASC),
  CONSTRAINT `userIdKey`
    FOREIGN KEY (`user_id`)
    REFERENCES Users(`user_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);
    
— — — — — — — — — — — — —tasks — — — — — — — — — — — —
CREATE TABLE tasks(
  `row_id` INT NOT NULL AUTO_INCREMENT,
  `task_name` VARCHAR(45) NOT NULL,
  `task_url` VARCHAR(45) NOT NULL,
  `task_date` DATE NOT NULL,
  `task_deadline` DATE NOT NULL,
  `student_id` INT NULL,
  PRIMARY KEY (`row_id`),
  INDEX `studentIdKey_idx` (`student_id` ASC),
  CONSTRAINT `studentIdKey`
    FOREIGN KEY (`student_id`)
    REFERENCES Users (`user_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);

— — — — — — — — — — — — —company_drives — — — — — — — — — — — —
    CREATE TABLE company_drives( `row_id` INT NOT NULL AUTO_INCREMENT, 
	`drive_name` VARCHAR(45) NOT NULL, 
	`company_name` VARCHAR(45) NOT NULL, 
	`ctc` INT NOT NULL, 
	`student_id` INT NULL, 
	PRIMARY KEY (`row_id`), 
	INDEX `studentIdKey_idx` (`student_id` ASC), 
	CONSTRAINT `studentIdKey2` 
	FOREIGN KEY (`student_id`) 
	REFERENCES Users(`user_id`) 
	ON DELETE NO ACTION 
	ON UPDATE NO ACTION);

    

— — — — — — — leaderboard — — — — — — — — — — — — — — —

create table leaderboard(
userid int,
course_id int,
batch varchar(25) not null,
submited_task varchar(25) not null,
foreign key(userid) references user(userid),
foreign key(course_id) references course(course_id)
);

— — — — — — — — — queries — — — — — — — — — — -
create table queries (
userid int,
topics varchar(2000),
reasons_queries varchar(2550),
foreign key (userid) references user(userid)
);
*/
CREATE DATABASE guvi;
USE guvi;

CREATE TABLE Users(
  `user_id` BIGINT NOT NULL AUTO_INCREMENT,
  `full_name` VARCHAR(45) NOT NULL,
  `email` VARCHAR(45) NOT NULL,
  `mobile` INT(10) NOT NULL,
  `college` VARCHAR(45) NOT NULL,
  `current_city` VARCHAR(45) NOT NULL,
  `user_type` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`user_id`)
);

INSERT INTO Users VALUES 
(NULL, 'Arivazhagan', 'arivu@gmail.com', '7530001748', 'pavai', 'Chennai', 'Student'),
(NULL, 'Anbarasan', 'anbu@gmail.com', '9626780402', 'prec', 'saudi', 'Student'),
(NULL, 'Abichindan', 'abi@gmail.com', '8489151000', 'aaust', 'Chennai', 'Student'),
(NULL, 'Bruce wyne', 'batman@gmail.com', '1234567890', 'cambridge', 'gotham', 'Mentor'),
(NULL, 'Lois lane', 'lois@gmail.com', '0987654321', 'IITM', 'metro police', 'Mentor');

CREATE TABLE Class (
    `DAY` INTEGER, 
    `TOPIC` TEXT, 
    `TASK` TEXT
);

-- Inserting Data into Class table
INSERT INTO Class (DAY, TOPIC, TASK) VALUES
(1, "JavaScript - Day -1: Introduction to Browser & web", "Introduction to Browser & web Blog"),
(2, "JavaScript - Day -2: Datatypes", "diff between document and object Blog"),
(3, "JavaScript - Day -3: JS array & objects", "RestCountries Task"),
(4, "JavaScript - Day -4: Functions", "program with different types of functions"),
(5, "JavaScript - Day -5: ES5 vs ES6", "create resume in JSON format"),
(6, "JavaScript - Day -6: OOP in JS", "Uber price calculation"),
(7, "JavaScript - Day -7: Array methods", "codekata practice"),
(8, "HTML- Day -1: HTML", "NIL"),
(9, "HTML & CSS- Day -2: HTML & CSS", "NIL"),
(10, "HTML & CSS- Day -3: HTML & CSS", "NIL"),
(11, "HTML & CSS- Day -4: HTML & CSS", "NIL"),
(12, "HTML & CSS- Day -5: HTML & CSS", "Github page design"),
(13, "DOM- Day -1: DOM", "NIL"),
(14, "DOM- Day -3: Recap of Topics", "NIL"),
(15, "DOM- Day -3: Recap of Topics", "pagination and calculator"),
(16, "Async programming- Day -1: Callback", "callback hell task"),
(17, "Async programming- Day -2: Promise", "promise task"),
(18, "Async programming- Day -3: Promise & async-await", "NIL"),
(19, "Async programming- Day -4: Promise fetch - request info & request init", "NIL"),
(20, "Async programming- Day -5: Recap of topics", "async task"),
(21, "React- Day -1: ES5 vs ES6", "NIL"),
(22, "React- Day -2: React", "price card"),
(23, "React- Day -3: React hooks & states", "shopping cart"),
(24, "React- Day -4: React components", "NIL"),
(25, "React- Day -5: React Hooks", "TO-DO App"),
(26, "React- Day -6: Router", "guvi courses page task using react-router"),
(27, "React- Day -7: Recap With Previous Day Topics", "NIL"),
(28, "React- Day -8: Context API", "NIL"),
(29, "React- Day -9: useRef & useReducer", "NIL"),
(30, "React- Day -10: Axios", "CRUD using axios"),
(31, "React- Day -11: practice with formik & recap", "library dashboard"),
(32, "React-redux- Day -12", "price calculation page using redux tool-kit"),
(33, "Database- Day -1: MySQL", "SQL task"),
(34, "Database- Day -2: MySQL", "design db for zen class"),
(35, "Database- Day -3: MongoDB", "mongo db task"),
(36, "Database- Day -4: MongoDB", "mongoDB task"),
(37, "Nodejs- Day -1: Nodejs", "node js task"),
(38, "Nodejs- Day -2: Nodejs & Express.js", "NIL"),
(39, "MongoDB", "database-design-zen-class"),
(40, "Nodejs", "Nodejs file system"),
(41, "Nodejs & Expressjs", "Hall Booking Application"),
(42, "Node & mongo DB connectivity", "Mentor and Student Assigning with Database");

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
    ON UPDATE NO ACTION
);

INSERT INTO codekata VALUES
(NULL, '1', '120', '7000', '1024'),
(NULL, '2', '200', '17000', '724'),
(NULL, '3', '100', '6000', '1724'),
(NULL, '4', '80', '4000', '2724'),
(NULL, '5', '60', '2000', '3724');

CREATE TABLE courses(
  `course_id` INT NOT NULL AUTO_INCREMENT,
  `course_name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`course_id`)
);

INSERT INTO courses VALUES
(NULL, 'Python'),
(NULL, 'AI'),
(NULL, 'Data Structures'),
(NULL, 'Algorithms'),
(NULL, 'Operating Systems');

CREATE TABLE topics(
  `topic_id` INT NOT NULL AUTO_INCREMENT,
  `topic_name` VARCHAR(45) NOT NULL, 
  `course_id` INT NOT NULL, 
  PRIMARY KEY (`topic_id`), 
  INDEX `courseIdKey_idx` (`course_id` ASC), 
  CONSTRAINT `courseIdKey` FOREIGN KEY (`course_id`) 
    REFERENCES `courses` (`course_id`) 
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
);

INSERT INTO topics VALUES
(NULL, 'data types', '1'),
(NULL, 'oops', '1'),
(NULL, 'functions', '1'),
(NULL, 'decorators', '1'),
(NULL, 'iterators', '1');

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
    ON UPDATE NO ACTION
);

INSERT INTO attendance VALUES 
(NULL, '2020-10-05', '1', 'present'),
(NULL, '2020-10-05', '2', 'present'),
(NULL, '2020-10-05', '3', 'present'),
(NULL, '2020-10-05', '4', 'present'),
(NULL, '2020-10-05', '5', 'present');

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
    ON UPDATE NO ACTION
);

INSERT INTO tasks VALUES 
(NULL, 'CallBack', 'http:sample', '2020-10-06', '2020-10-10', '1'),
(NULL, 'CallBack', 'http:sample', '2020-10-06', '2020-10-10', '2'),
(NULL, 'CallBack', 'http:sample', '2020-10-06', '2020-10-10', '3'),
(NULL, 'CallBack', 'http:sample', '2020-10-06', '2020-10-10', '4'),
(NULL, 'CallBack', 'http:sample', '2020-10-06', '2020-10-10', '5');

CREATE TABLE company_drives( 
  `row_id` INT NOT NULL AUTO_INCREMENT, 
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
  ON UPDATE NO ACTION
);

INSERT INTO company_drives VALUES 
(NULL, 'HCLDrive', 'HCL', '16', '1'),
(NULL, 'Google', 'Google', '20', '1'),
(NULL, 'Wipro', 'Wipro', '16', '1'),
(NULL, 'Drop box Drive', 'Drop Box', '36', '1'),
(NULL, 'Guvi drive', 'GUVI', '16', '1');

CREATE TABLE mentor(
  `row_id` INT NOT NULL AUTO_INCREMENT,
  `mentor_id` INT NOT NULL,
  `student_id` INT NOT NULL,
  PRIMARY KEY (`row_id`)
);

INSERT INTO mentor VALUES 
(NULL, '1', '4'),
(NULL, '2', '4'),
(NULL, '3', '5'),
(NULL, '6', '5'),
(NULL, '7', '5');

CREATE TABLE leaderboard(
  `userid` INT,
  `course_id` INT,
  `batch` VARCHAR(25) NOT NULL,
  `submited_task` VARCHAR(25) NOT NULL,
  FOREIGN KEY(`userid`) REFERENCES Users(`user_id`),
  FOREIGN KEY(`course_id`) REFERENCES courses(`course_id`)
);

-- Inserting random values for the leaderboard table
INSERT INTO leaderboard (userid, course_id, batch, submited_task)
VALUES 
    ('1', '54','FSD54WDT-2', '23'),
    ('2', '54','FSD54WDT-2', '22'),
    ('3', '54','FSD54WDT-2', '20'),
    ('4', '54','FSD54WDT-2', '5'),
    ('5', '54','FSD54WDT-2', '18');

CREATE TABLE queries (
  `userid` INT,
  `topics` VARCHAR(2000),
  `reasons_queries` VARCHAR(2550),
  FOREIGN KEY (`userid`) REFERENCES Users(`user_id`)
);

-- Inserting random values for the queries table
INSERT INTO queries (userid, topics, reasons_queries)
VALUES 
    (FLOOR(1 + RAND() * 5),'github','github issue'),
    (FLOOR(1 + RAND() * 5),'html & css','task doubt'),
    (FLOOR(1 + RAND() * 5),'visual studio','vs code doubt'),
    (FLOOR(1 + RAND() * 5),'javascript','task doubt'),
    (FLOOR(1 + RAND() * 5),'react','coding doubt');

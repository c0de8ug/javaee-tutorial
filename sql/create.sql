########################
# Drop all table
########################

DROP TABLE IF EXISTS book, class, course, department, order_book, resource, role, section, speciality, staff, student, takes, timetable, user;

CREATE TABLE book
(
  book_title       VARCHAR(30),
  isbn             VARCHAR(20),
  date_of_printing VARCHAR(20),
  author           VARCHAR(15),
  press            VARCHAR(15),
  category         CHAR,
  unit_price       FLOAT,
  PRIMARY KEY (book_title, isbn)
)
  DEFAULT CHARSET = utf8,
  ENGINE = InnoDB;

CREATE TABLE class
(
  class_id   VARCHAR(30),
  class_name VARCHAR(10),
  year       VARCHAR(20),
  spec_name  VARCHAR(15),
  PRIMARY KEY (class_id)
)
  DEFAULT CHARSET = utf8,
  ENGINE = InnoDB;

CREATE TABLE course
(
  course_title VARCHAR(30),
  type         VARCHAR(10),
  credits      FLOAT,
  speciality   VARCHAR(15),
  PRIMARY KEY (course_title)
)
  DEFAULT CHARSET = utf8,
  ENGINE = InnoDB;

CREATE TABLE department
(
  dept_id   INT AUTO_INCREMENT,
  dept_name VARCHAR(15),
  PRIMARY KEY (dept_id)
)
  DEFAULT CHARSET = utf8,
  ENGINE = InnoDB;

CREATE TABLE order_book
(
  staff_id   VARCHAR(30),
  sec_id     INT,
  book_title VARCHAR(30),
  isbn       VARCHAR(20),
  remark     VARCHAR(30),
  approval   TINYINT(1),
  PRIMARY KEY (staff_id, sec_id, book_title, isbn)
)
  DEFAULT CHARSET = utf8,
  ENGINE = InnoDB;

CREATE TABLE resource (
  id         BIGINT AUTO_INCREMENT,
  name       VARCHAR(100),
  type       VARCHAR(50),
  url        VARCHAR(200),
  parent_id  BIGINT,
  parent_ids VARCHAR(100),
  permission VARCHAR(100),
  available  BOOL   DEFAULT FALSE,
  PRIMARY KEY (id)
)
  CHARSET = utf8
  ENGINE = InnoDB;
CREATE INDEX idx_resource_parent_id ON resource (parent_id);
CREATE INDEX idx_resource_parent_ids ON resource (parent_ids);

CREATE TABLE role (
  id           BIGINT AUTO_INCREMENT,
  role         VARCHAR(100),
  description  VARCHAR(100),
  resource_ids VARCHAR(100),
  available    BOOL   DEFAULT FALSE,
  PRIMARY KEY (id)
)
  CHARSET = utf8
  ENGINE = InnoDB;
CREATE INDEX idx_sys_role_resource_ids ON role (resource_ids);

CREATE TABLE section
(
  sec_id       INT AUTO_INCREMENT,
  course_title VARCHAR(15),
  year         VARCHAR(5),
  limitCount   INT,
  staff_id     VARCHAR(20),
  PRIMARY KEY (sec_id)
)
  DEFAULT CHARSET = utf8,
  ENGINE = InnoDB;

CREATE TABLE speciality
(
  spec_id   INT AUTO_INCREMENT,
  dept_name VARCHAR(10),
  spec_name VARCHAR(15),
  year      VARCHAR(5),
  PRIMARY KEY (spec_id)
)
  DEFAULT CHARSET = utf8,
  ENGINE = InnoDB;

CREATE TABLE staff
(
  staff_id   VARCHAR(30),
  staff_name VARCHAR(20),
  PRIMARY KEY (staff_id)
)
  DEFAULT CHARSET = utf8,
  ENGINE = InnoDB;

CREATE TABLE student
(
  student_id          VARCHAR(30),
  student_name        VARCHAR(20),
  id_card             VARCHAR(20),
  year                VARCHAR(5),
  class_id            VARCHAR(10),
  telephone_number    VARCHAR(20),
  student_origin_base VARCHAR(10),
  gender              VARCHAR(4),
  pic_path            VARCHAR(45),
  leave_of_absence    BOOL,
  leave_school        BOOL,
    PRIMARY KEY (student_id)
)
  DEFAULT CHARSET = utf8,
  ENGINE = InnoDB;

CREATE TABLE takes
(
  student_id VARCHAR(30),
  sec_id     VARCHAR(30),
  score      FLOAT,
  PRIMARY KEY (student_id, sec_id)
)
  DEFAULT CHARSET = utf8,
  ENGINE = InnoDB;

CREATE TABLE timetable
(
  sec_id    INT,
  time      VARCHAR(20),
  weeks     VARCHAR(20),
  week      VARCHAR(20),
  classroom VARCHAR(10)
)
  DEFAULT CHARSET = utf8,
  ENGINE = InnoDB;

CREATE TABLE user
(
  user_id  VARCHAR(30),
  password VARCHAR(50),
  salt     VARCHAR(100),
  role_ids VARCHAR(100),
  locked   BOOL DEFAULT FALSE,
  PRIMARY KEY (user_id)
)
  DEFAULT CHARSET = utf8,
  ENGINE = InnoDB;
CREATE UNIQUE INDEX idx_user_username ON user (user_id);

#ALTER TABLE staff ADD CONSTRAINT fk_user_staff FOREIGN KEY (staff_id) REFERENCES orders (user_id);
#ALTER TABLE order_book ADD CONSTRAINT fk_courses_user_books_classe FOREIGN KEY (staffs_id) REFERENCES staffs (staff_id),
#FOREIGN KEY (book_title,isbn) REFERENCES book (book_title,isbn),
#FOREIGN KEY (grade,professional,department) REFERENCES class (grade,professional,department),
#FOREIGN KEY (course_id) REFERENCES course (courses_id);


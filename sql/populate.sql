
INSERT INTO user (user_id, password, salt, role_ids, locked)
VALUES ('admin', '3ab82b226b3b60f4eab8cd0a88887ba0', 'cd0faf6f821809044e35e35fd23cf44a', '1', 0);

INSERT INTO user (user_id, password, salt, role_ids, locked)
VALUES ('student', '5476883b25e9c7bb0528b6fdfa0f5de7', '20d98880380112ff6404bdcaa4ba9c10', '2', 0);

INSERT INTO user (user_id, password, salt, role_ids, locked)
VALUES ('student2', '5476883b25e9c7bb0528b6fdfa0f5de7', '20d98880380112ff6404bdcaa4ba9c10', '2', 0);


INSERT INTO user (user_id, password, salt, role_ids, locked)
VALUES ('teacher', 'f7e7844cad9aadb0c7f1722f2c9be050', 'a7bbf832a7472759146b0967a78e6ce5', '3', 0);

INSERT INTO user (user_id, password, salt, role_ids, locked)
VALUES ('supplier', '19a885f6627571598621fe5f5e9cbbc5', '9c64193184d34fa04a205d06b93ca3d6', '4', 0);

INSERT INTO role (role, description, resource_ids, available) VALUES ('admin', '管理员', '', 1);
INSERT INTO role (role, description, resource_ids, available) VALUES ('student', '学生', '', 1);
INSERT INTO role (role, description, resource_ids, available) VALUES ('teacher', '老师', '', 1);
INSERT INTO role (role, description, resource_ids, available) VALUES ('supplier', '供应商', '', 1);

INSERT INTO staff (staff_id, staff_name) VALUES ('teacher', 'teacher');


INSERT INTO book (book_title, isbn, date_of_printing, author, press, category, unit_price)
VALUES ('Effective JAVA', '1561315135213', '2008', 'Joshua Bloch', '工业出版社', 'A', 88);

INSERT INTO department (dept_name) VALUES ('管理系');
INSERT INTO department (dept_name) VALUES ('信息工程系');
INSERT INTO department (dept_name) VALUES ('机电系');

INSERT INTO speciality (dept_name, spec_name) VALUES ('信息工程系', '网络工程');

INSERT INTO section (course_title, year, limitCount, staff_id) VALUES ('网络技术', 20161, 8, 'teacher');

INSERT INTO order_book (staff_id, sec_id, book_title, isbn, remark, approval)
VALUES ('teacher', 1, 'Effective JAVA', '1561315135213', '不要二手', 1);

INSERT INTO course (course_title, type, credits, speciality)
VALUES ('网络技术', '必修课/公共课', 4, '网络工程');

INSERT INTO class (class_id, year, spec_name)
VALUES ('161111', 20161, '网络工程');

INSERT INTO takes (student_id, sec_id, score)
VALUES ('student', 1, 5);

INSERT INTO takes (student_id, sec_id, score)
VALUES ('student2', 1, 5);
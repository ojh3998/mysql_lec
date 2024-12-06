DROP DATABASE IF EXISTS db_app06;
CREATE DATABASE IF NOT EXISTS db_app06;

USE db_app06;

DROP TABLE IF EXISTS tbl_contact;
CREATE TABLE IF NOT EXISTS tbl_contact
(
    contact_id INT AUTO_INCREMENT COMMENT '연락처아이디',
    last_name  VARCHAR(100) COMMENT '성',
    first_name VARCHAR(100) COMMENT '이름',
    email      VARCHAR(100) COMMENT '이메일',
    mobile     VARCHAR(20) COMMENT '모바일',
    create_dt  DATE COMMENT '등록일',
    CONSTRAINT pk_contact PRIMARY KEY (contact_id)
) ENGINE=InnoDB COMMENT '연락처';

INSERT INTO tbl_contact VALUES (null, 'james', 'dean', 'jamesdean@gmail.com', '010-1111-1111', '2024-12-01');
INSERT INTO tbl_contact VALUES (null, 'john', 'park', 'johnpark@gmail.com', '010-2222-2222', '2024-12-02');
INSERT INTO tbl_contact VALUES (null, 'michael', 'jordan', 'michaeljordan@gmail.com', '010-3333-3333', '2024-12-03');
COMMIT;
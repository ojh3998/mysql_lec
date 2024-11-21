-- 스키마 선택하기
USE testdb;

/*
 테이블은 부모테이블(PK를 가진)을 먼저 만들고, 자식테이블(FK를 가진)을 나중에 만든다.
 테이블 삭제와 생성의 순서는 항상 역순으로 작업한다.
*/

-- 테이블 삭제하기(항상 삭제먼저) 
DROP TABLE IF EXISTS tbl_order CASCADE;  -- 참조중인 테이블이 존재하면 함께 삭제 - CASCADE    
DROP TABLE IF EXISTS tbl_product CASCADE;

-- 테이블 만들기

CREATE TABLE IF NOT EXISTS tbl_product
(
    prod_id   INT         NOT NULL AUTO_INCREMENT PRIMARY KEY COMMENT '제품코드',
    prod_name VARCHAR(20) NULL                                COMMENT '제품이름',            -- NULL 생략가능
    price     INT(5)                                          COMMENT '제품가격',            -- INT(자릿수)  
    stock     SMALLINT    DEFAULT 0                           COMMENT '제품재고'
) ENGINE=INNODB COMMENT '제품';

CREATE TABLE IF NOT EXISTS tbl_order
(
    order_id INT      NOT NULL AUTO_INCREMENT PRIMARY KEY COMMENT '주문번호',
    order_user VARCHAR(20)                                COMMENT '주문자',
    prod_id INT                                           COMMENT '제품번호',
    order_dt DATETIME DEFAULT NOW()                       COMMENT '주문일자',  -- DEFAULT NOW() -> 오늘
    FOREIGN KEY(prod_id) REFERENCES tbl_product(prod_id)                       -- 외래키 
) ENGINE=INNODB COMMENT '주문';

ALTER TABLE tbl_order AUTO_INCREMENT = 1000;                                   -- AUTO_INCREMENT(자동증가) 시작값을 1000으로 바꿈
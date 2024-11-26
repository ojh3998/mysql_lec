USE db_company;


/* 클러스터 인덱스 : PK에 부여된 인덱스 */


-- 1. (인덱스 태우기) 부서번호가 1인 부서 조회하기
SELECT dept_id, dept_name, location
FROM tbl_department
WHERE dept_id = 1;        -- 인덱스가 설정된 칼럼(pk)으로 조회  

SELECT dept_id, dept_name, location
FROM tbl_department
WHERE dept_id * 2  = 2;        -- 인덱스가 설정된 칼럼(pk)울 조작하면(연산,함수) 더이상 인덱스를 타지 않는다 ~!~!~!~!~!  왼쪽은 건드리지 말아라.이!       

-- 2. (인덱스 안태우기) 부서명이 '영업부'인 부서 조회하기 
SELECT dept_id, dept_name, location
  FROM tbl_department
  WHERE dept_name = '영업부';
  
-- 3. 부서번호가 1이상인 부서 조회하기
SELECT dept_id, dept_name, location
 FROM tbl_department
 WHERE dept_id >= 1;  -- 인덱스의 범위조건은 상황에 따라 인덱스를 태우거나 안태우거나, 판단은 검색엔진이 알아서 내가 하는것 아님.
 
 
 
 /* 보조 인덱스 만들기 */
 CREATE INDEX ix_name
           ON tbl_employee(emp_name ASC);
           
-- 일반적인 index 처리           
SELECT emp_id, dept_id, emp_name, position, hire_date, salary
FROM tbl_employee
WHERE emp_name = '이은영';

-- index range scan
SELECT emp_id, dept_id, emp_name, position, hire_date, salary
FROM tbl_employee
WHERE emp_name LIKE '이%';

-- full table scan - 결과는 위와 같으나 함수를 썼기 때문
SELECT emp_id, dept_id, emp_name, position, hire_date, salary
FROM tbl_employee
WHERE SUBSTRING(emp_name, 1, 1) = '이';  -- SUBSTRING(emp_name, 1, 1) 1번째 글자부터 1글자만 추출



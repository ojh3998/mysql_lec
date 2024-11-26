USE db_company;


-- 복잡한 쿼리문을 자주쓸 때,  뷰에 저장해 두고 셀렉으로 가져다가 쓰는 것

-- 사원정보와 부서 정보를 자주 조회하는 경우
-- 조인 쿼리문을 하나의 뷰로 저장해 두면, 쉽게 조인을 사용할 수 있다.

-- 뷰 생성하기 (쿼리문을 저장해 두는 방식)
CREATE VIEW v_emp AS
  SELECT emp_id, d.dept_id, dept_name, emp_name, location, position, gender, hire_date, salary
    FROM tbl_department d INNER JOIN tbl_employee e
      ON d.dept_id = e.dept_id;
      
-- 뷰 치환하기 (쿼리문을 저장해 두는 방식)
CREATE OR REPLACE VIEW v_emp AS
  SELECT emp_id, d.dept_id, dept_name, emp_name, location, position, gender, hire_date, salary
    FROM tbl_department d INNER JOIN tbl_employee e
      ON d.dept_id = e.dept_id;
      
-- 뷰 조회하기
SELECT * FROM v_emp;

SELECT * FROM v_emp WHERE dept_name = '영업부';

SELECT * FROM v_emp a LEFT JOIN tbl_proj_emp b ON a.emp_id = b. emp_id;  -- join 된걸 또 다른 애랑 조인해서 3개가 합쳐진 것임.

-- insert 결과가 view에 반영이 되는가? YES!~!~!~!~!~ (UPDATE / DELETE 다가능
INSERT INTO tbl_employee VALUES(NULL, 3, '김성율', '회장', 'M', '2024-11-26', 1000000000); 





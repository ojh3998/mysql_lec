USE db_company;





/* CROSS JOIN
조인 조건이 없는 조인 방식. CROSS JOIN 키워드 자용.
조인 조건이 잘못 작성된 경우에도 CROSS JOIN을 수행.
*/
-- 1. 모든 사원의 부서번호, 부서명, 사원번호, 사원명 조회하기
SELECT d.dept_id, e.dept_id, dept_name, emp_id, emp_name         -- 어느테이블의 칼럼인지 적어줘야함 - - 둘다 가지고 있기 때문
  FROM tbl_department d 
  CROSS JOIN tbl_employee e;
  
  
  /* INNER JOIN
  두 테이블이 모두 가지고 있는 테이터를 조회 할때 사용.
  반드시 올바른 조인 조건을 작성해야 함.
  
  - 테이블작성 -
FRON "DIRVE TABLE" JOIN "DRIVEN TABLE"  --> DIRVE 테이블이 PK를 가진 놈 
DIRVE TABLE = 조인을 주동으로하는 테이블.
ON 절에 서도 DRIVE TABLE 의 칼럼을 먼저 작성. 
  */
  
  -- 2. 모든 사원의 부서번호, 부서명, 사원번호, 사원명 조회하기
  SELECT d.dept_id, e.dept_id, dept_name, emp_id, emp_name         
  FROM tbl_department d 
  INNER JOIN tbl_employee e
  ON d.dept_id = e.dept_id;
  
  
 SELECT d.dept_id, e.dept_id, dept_name, emp_id, emp_name         -- 어느테이블의 칼럼인지 적어줘야함 - - 둘다 가지고 있기 때문
  FROM tbl_department d  
  JOIN tbl_employee e;           -- join 의 디폴크는 cross 4개다비교
 
 
 -- 3. 대구에 근무하는 사원 조회하기 -- table이 두개 존재한다고 판단되면 무조건 join을 써야함
 SELECT emp_id, e.dept_id, emp_name, position, gender, hire_date, salary
 FROM tbl_department d 
 INNER JOIN tbl_employee e
 ON d.dept_id = e.dept_id
 WHERE location = '대구';
 
 -- 04. 지역별 근무하는 사원의 수 조회하기
 SELECT location, COUNT(*)
 FROM tbl_department d 
 INNER JOIN tbl_employee e
 on d.dept_id = e.dept_id
 GROUP BY location;         -- count 함수를썼기 때문에 그뤂핑 필수!!!
 
 -- 5. (db_menu 스키마) 메뉴코드, 메뉴명, 가격, 카테고리이름,주문가능여부, 조회하기
 USE db_menu;
 SELECT menu_code, menu_name, menu_price, category_name, orderable_status
 FROM tbl_category c INNER JOIN tbl_menu m
 ON c.category_code = m.category_code;
 
  /* OUTOER JOIN
  어느 한 테이블만 가지고 있는 데이터를 조회할 때 사용.
  LEFT [OUTER] JOIN 첫 번째 테이블의 모든 데이터를 항상 조회
  RIGNT [OUTER] JOIN 두 번째 테이블 의 모든 데이터를 항상 조회
 */
 
 -- 06. 부서별 사원 수 조회하기. 근무중 인 사원이 없으면 0을 표시.
 USE db_company;
 SELECT dept_name, COUNT(emp_id)  -- tbl_employee 에만  있는 칼럼 어느걸 집어 넣어도 실행됨 그러나, emp_id 는 not null 이므로 COUNT 에 적합
 FROM tbl_department d LEFT JOIN tbl_employee e
 ON d.dept_id = e.dept_id
 GROUP BY d.dept_id, dept_name;
 
 
 -- 07 메뉴이름, 모든 카테고리 이름 조회하기
 USE db_menu;
SELECT menu_name, category_name
FROM tbl_menu m RIGHT JOIN tbl_category c
ON m.category_code = c.category_code;

/*SELF JOIN 
테이블 하나를 대상으로 행과 행 사이 관계를 찾는 조인
*/

-- 8. 카테고리이름, 상위카테고리이름 조회하기.
SELECT a.category_name AS 카테고리, b.category_name AS 상위카테고리
  FROM tbl_category a INNER JOIN tbl_category b
    ON a.ref_category_code = b.category_code
 WHERE a.ref_category_code IS NOT NULL;
 
 
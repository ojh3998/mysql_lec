USE db_company;

-- 1.부서 테이블의 모든 데이터 조회하기
SELECT *               -- * : 모든 칼럼을 의미한다. 실무에서는 사용금지. 성능이슈
  FROM tbl_department;

-- 2.부서 테이블에서 위치만 조회하기
SELECT location
  FROM tbl_department;
  
-- 3. 부서 테이블에서 위치의 중복을 제거하고 조회하기
SELECT DISTINCT location    -- DISTINCT : 중복제거
  FROM tbl_department;
  
-- 4. 칼럼에 별명 지정하기
SELECT
      dept_id AS 부서번호
     ,dept_name AS 부서명
    ,location AS "부서 위치"
  FROM
     tbl_department;
    
-- 5. 오너 명시(데이터베이스, 테이블)
SELECT
      tbl_department.dept_id
    , tbl_department.dept_name
    , tbl_department.location
  FROM
    db_company.tbl_department;
    
    
-- 06. 테이블의 별명 지정하기 (AS 별명 OR AS 생략 후 별명만
SELECT
     d.dept_id
   , d.dept_name
   , d.location
FROM
    tbl_department d; 
 
 -- 07. 대구에 있는 부서 조회하기
 SELECT dept_id, dept_name, location
   FROM tbl_department
  WHERE location = '대구';  -- 비교 연산자(=, !=, >, >=, <, <=)
  
  
  -- 08. 부서 번호가 1이고 연봉이 3000000 이상인 사원 조회하기
  SELECT emp_id, dept_id, emp_name, position, gender, hire_date, salary
    FROM tbl_employee
   WHERE dept_id = 1 AND salary >= 3000000;  -- 논리 연산자 (AND, OR, NOT)
   
   
-- 09. 연봉이 3000000 ~ 5000000 사이인 사원 조회하기
SELECT emp_id, dept_id, emp_name, position, gender, hire_date, salary
  FROM tbl_employee
 WHERE salary BETWEEN 3000000 AND 5000000;  -- salary >=3000000 AND salary <=5000000; BETWEEN AND를 훨씬 많이씀.
 
 -- 10. 직급이 '과장', '부장' 인 사원 조회하기
 SELECT emp_id, dept_id, emp_name, position, gender, hire_date, salary
   FROM tbl_employee
  WHERE position IN ('과장', '부장');   -- position = '과장' OR position = '부장';  
 
 -- 11. 직급이 '과장', '부장' 이 아닌 사원 조회하기
 SELECT emp_id, dept_id, emp_name, position, gender, hire_date, salary
   FROM tbl_employee
  WHERE position NOT IN ('과장', '부장');  -- position != '과장' AND != '부장';
 
 -- 12. 사원명이 '한' 으로 시작 하는 사람 조회하기
 SELECT emp_id, dept_id, emp_name, position, gender, hire_date, salary
   FROM tbl_employee
  WHERE emp_name LIKE '한%'; -- % : 와일드 카드 (만능문자 : 글자 수의 제한이 없는 모든 문자를 의미한다.)
                             -- LIKE 연산자 :  와일드카드 전용 연산자
-- 13. 사원명에 '민' 을 포함하는 사원 조회하기
SELECT emp_id, dept_id, emp_name, position, gender, hire_date, salary
   FROM tbl_employee
  WHERE emp_name LIKE CONCAT('%', '민', '%');
  
  -- 14. (db_menu 스키마) 상위카테고리코드가 없는 카테고리 조회하기
SELECT category_code, category_name, ref_category_code
  FROM db_menu.tbl_category
 WHERE ref_category_code IS NULL;      -- IS NULL : NULL 이다. 

-- 15. (db_menu 스키마) 상위카테고리코드가 있는 카테고리 조회하기
SELECT category_code, category_name, ref_category_code
  FROM db_menu.tbl_category
 WHERE ref_category_code IS NOT NULL;  -- IS NOT NULL : NOT NULL 이다.

/* GROUP BY - HAVING ~ */
/* 그룹핑은 애네를 쓸려고 하는 것 이다.

      SUM() : 합계
      AVG() : 평균
      MAX() : 최대
      MIN() : 최소
    COUNT() : 갯수
*/

-- 16. 직급별로 그룹화하여 연봉의 평균 조회하기
SELECT position, AVG(salary)  -- GROUP BY 절에 명시한 칼럼
 FROM tbl_employee
GROUP BY position;  -- 직급별로 그룹화 작업 -- 그룹바이가 가지고 있는 것을 셀렉트가 가질 수 있음.!!

-- 17. 부서별로 사원 수 조회
SELECT dept_id AS 부서번호, COUNT(*) -- 모든 칼럼을 조회해서 어느 한 칼럼이라도 값을 가지고 있으면 카운트에 포함한다.
FROM tbl_employee
GROUP BY dept_id;

-- 18. 직급별 급여의 평균이 5000000 이상인 직급 조회하기
SELECT position, AVG(salary)
 FROM tbl_employee
 GROUP BY position
HAVING AVG(salary) >= 5000000; -- HAVING 절에서 통계 함수를 이용한 조건식을 사용할 수 있다. 따라서 통계 함수가 쓰일 때 해빙쓰기;.

/* 통계 함수는 WHERE 절에서 사용할 수 없음.
SELECT position, AVG(salary)
 FROM tbl_employee
 WHERE AVG(salary) >= 5000000
 GROUP BY position; 
*/ 


-- 19. 직급별 사원 수 구하기. 직급이 '과장' 인 직급만 조회하기.
SELECT position, COUNT(*)
  FROM tbl_employee  
  WHERE position = '과장'
  GROUP BY position;     -- 그루핑 하기전에 WHERE절에서 조건을 쳐내놓고 줄여놔야 성능을 더 뽑아낼 수있음.
  
/*
SELECT position, COUNT(*)
  FROM tbl_employee              
  GROUP BY position           -- 돌아가긴 하나, 이렇게 그룹핑을 먼저 해버리면 positon을 먼저 모두 그룹화 해버리기때문에 데이터가 많을 경우 성능이 느려질 수 있음.
  HAVING position = '과장';              
 */


/*ORDER BY ~ */

-- 20.  사원 명 순으로 사원 조회하기
SELECT emp_id, dept_id, emp_name, position, gender, hire_date, salary
   FROM tbl_employee
   ORDER BY emp_name ASC; -- ASCending : 오름차순 정렬 (사전편찬 순) - default 생략가능 / DESCending : 내림차순 정렬
   
   
-- 21. 직급의 오름차순, 동일 직급은 고용일의 내림차순
SELECT emp_id, dept_id emp_name, position, gender, hire_date, salary
  FROM tbl_employee
  ORDER BY position, hire_date DESC; -- position 은 ASC 왜? 이폴트이니까 생략됨,, 먼저 position 정렬되고 그다음에 고용일자가 정렬 되는 구조임  -- 과장중에 최신일자정렬 
  
/*LIMIT ~ */
-- 일반적 패턴 : 원하는 기준으로 정렬한 뒤 일부만 조회

-- 22. 가정 먼저 입사한 사원 조회
SELECT emp_id, dept_id, emp_name, position, gender, hire_date, salary
   FROM tbl_employee
   ORDER BY hire_date -- ASC생략
 LIMIT 0,3; -- 첫 번째 행(0) 3개 행 조회.  LIMIT 1;

-- 23. 급여가 2~3 번째로 높은 사원 조회하기.
SELECT emp_id, dept_id, emp_name, position, gender, hire_date, salary
   FROM tbl_employee
   ORDER BY salary DESC
   LIMIT 1,2; -- 2행 부터 2개

 
 
 
 
    
     
     
     
     
     
     
     
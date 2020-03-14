--ON 절을 이용한 조인

--SELECT 테이블1.컬럼, ... 테이블2.컬럼...
--FROM 테이블1
--JOIN 테이블2 ON 조인_조건
--[JOIN 테이블3 ON 조인_조건]...
--WHERE 일반_조건;
--1) NATURAL JOIN, USING 절을 이용한 조인등을 모두 표현 가능하다
--2) ON 절에 조인 조건을 직접 기술함으로써 SQL 문장 해석이 쉽다
--3) 조인되는 컬럼의 이름이 다르거나 비등가조인인 경우 많이 이용한다.

--각 사원의 근무 부서를 검색한다

--조인 조건은 ON절에
--일반 조건은 WHERE절에
SELECT eno,ename,dept.dno,dname
FROM emp
JOIN dept ON emp.dno=dept.dno;

SELECT eno,ename,dept.dno,dname
FROM emp, dept
WHERE emp.dno=dept.dno;

SELECT eno,ename,d.dno,dname
FROM emp e, dept d
WHERE e.dno=d.dno;

SELECT eno,ename,dno,dname
FROM emp
NATURAL JOIN dept;

SELECT eno,ename,dno,dname
FROM emp
JOIN dept USING(dno);

SELECT eno,ename,d.dno,dname
FROM emp e
JOIN dept d ON e.dno=d.dno;

--지원 업무를 담당하는 사원의 급여 등급을 검색한다
--1) 등가 조인, 비등가조인도 모두 가능하다
--2) 조인조건과(ON) 일반조건(WHERE)을 구분한다
SELECT eno, ename,job,grade "급여 등급"
FROM emp
JOIN salgrade ON sal BETWEEN losal AND hisal
WHERE job='지원';

SELECT eno, ename,job,grade "급여 등급"
FROM emp
JOIN salgrade ON sal >= losal AND sal <=hisal
WHERE job='지원';

--아래처럼 ON 절에 일반조건까지 포함시키는 것은
--지양한다
SELECT eno, ename,job,grade "급여 등급"
FROM emp
JOIN salgrade ON sal BETWEEN losal AND hisal
AND job='지원';

--직원의 부서명과 급여 등급을 검색한다
--1) ON 절은 USING 절과 혼용이 가능하다
--2) 하지만 아무런 규칙없이 혼용하는 것은 SQL의 가독성과
--   유지보수성을 떨어뜨린다
--3) 그러므로 항상 ON 절만 이용하던가
--4) 아니면 등가 조인은 USING 절에
--   비등가 조인은 ON 절에 
--   라는 원칙을 정해서 사용하는 것이 바람직하다
SELECT eno,ename,dname,grade
FROM emp
JOIN dept USING(dno)  --등가조인
JOIN salgrade ON sal BETWEEN losal AND hisal; --비등가조인

SELECT eno,ename,dname,grade
FROM emp e
JOIN dept d ON e.dno=d.dno
JOIN salgrade ON sal BETWEEN losal AND hisal;

--직원의 이름과 관리자명을 검색한다
--자기참조조인도 ON절을 사용할 수 있다
SELECT e1.eno 사번,e1.ename 사원,
       e2.eno 관리자사번, e2.ename 관리자
FROM emp e1
JOIN emp e2 ON e1.mgr=e2.eno;

--좌우 외부 조인(Left Right Outer Join)
--SELECT 테이블1.컬럼, ... 테이블2.컬럼
--FROM 테이블1
--[LEFT|RIGHT|FULL][OUTER] JOIN 테이블2 [ON 조인조건|USING (조인컬럼)]
--WHERE 일반조건; 
--1) LEFT : 테이블1을 왼쪽 테이블이라 부르고
--          왼쪽 테이블에 조인 조건과 일치하지 않는 행도 검색
--2) RIGHT: 테이블2를 오른쪽 테이블이라 부르고
--          오른쪽 테이블에 조인 조건과 일치하지 않는 행도 검색
--3) FULL : 양쪽 테이블 모두에서 조인 조건에 일치하지 않은 행을
--          검색에 포함한다.
--          (+)로 표현할 수 없다.
--4) 조인 조건은 ON 절이나 USING 절을 모두 사용할 수 있다
--5) 자연 조인과는 혼용할 수 없다

--사원의 이름과 소속 부서를 검색한다
SELECT eno, ename, dno, dname
FROM emp
RIGHT JOIN dept USING (dno);

--OUTER 는 생략 가능
SELECT eno, ename, dno, dname
FROM emp
RIGHT OUTER JOIN dept USING (dno);

SELECT eno, ename, d.dno, dname
FROM emp e
RIGHT JOIN dept d ON e.dno=d.dno;

--교차조인
--; 조인 조건이 생략된 형태의 조인
--조인 조건이 생략될 경우 테이블의 각각의 행들이
--모두 매핑되어 검색되는데
--이것을 카테이션 곱(Cartesian Product)라 부른다
--일반적으로는 잘못된 검색이지만 
--DW(Data Warehouse)에서 의도적으로 수행하는 경우가
--있다.

SELECT eno, ename, dname
FROM emp
CROSS JOIN dept;

SELECT eno, ename, dname
FROM emp, dept;
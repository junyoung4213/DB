--자연 조인(Natural Join)
--; 자연 조인은 동일한 타입과 이름을 가진 컬럼을
--조인 조건으로 이용하는 조인 문장을 보다
--간단히 표현하는 방법으로 등가조인이다

--SELECT 컬럼, ...
--FROM 테이블1
--NATURAL JOIN 테이블2
--WHERE 일반_조건;
--1) 여러 테이블에 존재하는 동일 컬럼을 기술할 때
--  이전 조인 문장과 다르게 테이블이름을 생략하고
--  컬럼명만 표기한다
--2) 반드시 두 테이블간에 조인할 수 있는 동일한 이름, 타입을
--   가진 컬럼이 필요하다
--3) 조인에 이용되는 컬럼은 별도로 명시하지 않아도 자동으로
--   조인에 사용된다
--4) 동일한 이름을 가졌더라도 데이터타입이 다르면 에러가
--   발생한다
--5) 조인 조건을 쓸 필요가 없다
--   자동으로 이름과 데이터 타입으로 조인이 된다
   
SELECT eno, ename, dno, dname
FROM emp
NATURAL JOIN dept;

--자연 조인을 사용해서
--광주에서 근무하는 직원의 명단을 검색한다
--(부서번호와 부서명도 검색한다)
SELECT loc,dno,dname,eno,ename
FROM emp
NATURAL JOIN dept
WHERE loc='광주';

SELECT loc,dno,dname,eno,ename
FROM dept
NATURAL JOIN emp
WHERE loc='광주';

--Using 절을 사용한 Join
--; 두 테이블에 공통 2개이상인 경우
--
--emp1 : eno(사번), name(사원이름), dno(부서번호)
--dept1: dno(부서번호), name(부서명), loc(지역)
--
--SELECT eno, loc
--FROM dept1
--NATURAL JOIN emp1;
--
--SELECT eno, loc
--FROM dept1, emp1
--WHERE dept1.dno=emp1.dno
--AND dept1.name=emp1.name;
--
--=> 선택된 레코드가 없습니다.
--
--이럴 때 Using절을 이용한 Join을 사용하면 
--보다 명확하게 Join문을 구사할 수 있다

--SELECT 컬럼, ...
--FROM 테이블1
--JOIN 테이블2 USING (조인 컬럼)
--[JOIN 테이블3 USING (조인 컬럼)]
--WHERE 일반_조건;
--1) NATURAL 과 USING 은 함께 사용할 수 없다.
--2) 조인에 사용되지 않는 동일 명칭의 컬럼은
--   컬럼명 앞에 테이블 명을 기술한다

--Using 절로 각 사원의 근무 부서를 검색한다
SELECT eno, ename, dno, dname
FROM emp
NATURAL JOIN dept;

SELECT eno,ename,dno,dname
FROM emp
JOIN dept USING (dno);

--Using 절로 광주에서 근무하는 직원의 명단을 검색한다
--(부서번호와 부서명도 검색한다)
SELECT loc,dno,dname,eno,ename
FROM emp
NATURAL JOIN dept
WHERE loc='광주';

SELECT loc,eno,ename,dno,dname
FROM emp
JOIN dept USING (dno)
WHERE loc='광주';


--화학과 1학년 학생들의 유기화학 점수를 검색한다
SELECT major,syear,sno,sname,cno,cname,result
FROM student
JOIN score USING (sno)
JOIN course USING (cno)
WHERE cname='유기화학' AND syear=1 AND major='화학';

SELECT major,syear,sno,sname,cno,cname,result
FROM student
NATURAL JOIN score
NATURAL JOIN course
WHERE cname='유기화학' AND syear=1 AND major='화학';


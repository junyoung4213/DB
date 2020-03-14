--RDB(Relatinal Database)
--; 테이블과 테이블은 관계를 가지고 있다
--업무 - 업무 관련성

--10번부서의 사원정보와 부서정보를 검색해라.
--emp테이블과 dept테이블을 dno컬럼을 연결시켜서
--검색해야 한다.

--SELECT 테이블1.컬럼, ... 테이블2.컬럼
--FROM 테이블1, 테이블2, .....
--WHERE 조인_조건
--AND 일반_조건;

--각 사원의 근무 부서를 검색하라.
SELECT emp.eno,emp.ename,emp.dno,
      dept.dno,dept.dname
FROM emp,dept
WHERE emp.dno = dept.dno;

SELECT eno,ename,emp.dno,
      dept.dno,dname
FROM emp,dept
WHERE emp.dno = dept.dno;

--광주에서 근무하는 직원의 명단을 검색하라
--(부서번호와 부서명도 검색한다)
SELECT eno,ename,emp.eno,dname,loc
FROM emp,dept
WHERE emp.dno=dept.dno  --조인조건
AND loc='광주';          --일반조건

SELECT eno,ename,e.eno,dname,loc
FROM emp e,dept d
WHERE e.dno=d.dno  --조인조건
AND loc='광주';          --일반조건



--각 직원의 급여를 10% 인상한 경우 급여 등급을 검색하라.
SELECT eno, ename, sal*1.1 "10% 인상 급여", grade
FROM emp, salgrade
WHERE sal*1.1 BETWEEN losal and hisal;

--= 조인을 등가조인  - 공통 컬럼이 존재하는 경우
--부등호, BETWEEN문, 비등가조인 
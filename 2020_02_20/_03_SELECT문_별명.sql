/*
컬럼명을 별명으로 변경
SELECT 컬럼 as "별명", 컬럼 as "별명", ...
FROM 테이블;

SELECT 컬럼 "별명", 컬럼 "별명", ...
FROM 테이블;
*/

--SELECT eno 사번, ename 이름, job 업무
--FROM emp;

--각 사원의 급여와 1년간 수급하는 급여를 검색
--별명에 띄어쓰기가 있을 때는 ""를 붙여야 한다
SELECT eno 사번, ename 이름, sal 급여, sal*12 "연간 급여"
FROM emp;

--사원의 연봉을 검색한다
--연봉 = 급여(sal) * 12 + 보너스(comm)

SELECT eno 사번, ename 이름, sal*12+comm "연봉"
FROM emp;

--null과 연산을 하면 결과도 null이 된다
--DB에서 null의 의미는 정해지지 않았다/모른다
--                  없다(0)의 의미가 아니다
--통계에서 null값을 가진 레코드(행)을 의도적으로
--포함시키거나 뺌으로써 의도적 오류를 발생시키기도 한다


SELECT eno 사번, ename 이름, sal, comm, sal*12+comm "연봉"
FROM emp;

--null값이 있는 레코드가 있을 경우는
--null을 어떻게 처리할 지 원칙이 필요하다

SELECT eno 사번, ename 이름, sal*12+NVL(comm,0) "연봉"
FROM emp;
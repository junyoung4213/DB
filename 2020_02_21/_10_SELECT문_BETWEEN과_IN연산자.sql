--BETWEEN과 IN 연산자

--SELECT 컬럼
--FROM 테이블
--WHERE 컬럼 BETWEEN 값1 AND 값2;

--1) 컬럼 >= 값1 AND 컬럼 <= 값2 와 동일하다
--2) 컬럼의 값이 값1에서 값2사이의 값을 검색한다
--3) 값1은 반드시 값2보다 작아야 한다

--급여가 1000이상 2000이하인 사원
SELECT *
FROM emp
WHERE sal >= 1000 AND sal <=2000;

SELECT *
FROM emp
WHERE sal BETWEEN 1000 AND 2000;

--10번, 20번 부서 사원
SELECT * 
FROM emp
WHERE dno='10' OR dno='20';

SELECT * 
FROM emp
WHERE dno BETWEEN '10' AND '20';

--1992년에서 1996년 사이에 입사한 사원을 검색하라
SELECT *
FROM emp
WHERE hdate BETWEEN '1992/01/01' AND '1996/12/31'
ORDER BY hdate;

/*
DATE 타입은 화면에 보여질때는 default로
'년/월/일'만 표시하지만
내부적으로는 '년/월/일/시:분:초'를 포함한다
조건문에 '시:분:초'를 지정하지 않으면
기본 값은 0시 0분 0초인 '00:00:00'이 된다

그러므로 위의 예제에서는 날짜의 범위를 풀어쓰면
1992/1/1:00:00:00 ~ 1996/12/31:00:00:00
까지이다.
만약 1996년 12월 31일 11시 20분 30초에 입사한
사원이 있다면 검색되지 않는다.
*/

ALTER SESSION SET nls_date_format='YYYY/MM/DD:HH24:MI:SS';
SELECT *
FROM emp;

SELECT *
FROM emp
WHERE hdate
BETWEEN '1992/01/01:00:00:00'
AND '1996/12/31:23:59:59';

--급여가 2000에서 1000사이인 사원을 검색하라
SELECT *
FROM emp
WHERE sal BETWEEN 1000 AND 2000;

/*
IN  연산자

SELECT 컬럼, ...
FROM 테이블
WHERE 컬럼 IN (값1, 값2, ...);

1) 지정한 값중에 일치하면 검색
2) OR연산자와 = 연산자로 교환가능하다
3) 가독성이 우수하다
*/

--개발이나 관리 업무를 담당하는 사원
SELECT *
FROM emp
WHERE job='개발' OR job='지원';

SELECT *
FROM emp
WHERE job IN ('개발','지원');

--10번, 20번 부서 사원 검색하라
SELECT *
FROM emp
WHERE dno='10' OR dno='20';

SELECT *
FROM emp
WHERE dno IN ('10','20');
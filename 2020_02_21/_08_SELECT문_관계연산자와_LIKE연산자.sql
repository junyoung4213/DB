--관계 연산자와 LIKE 연산자

--SELECT 컬럼, ...
--FROM 테이블
--WHERE 조건 [관계연산자 조건...];
--1) 여러 개의 조건을 동시에 사용할 때
--2) AND, OR, NOT 이 사용
--3) 연산자 우선순위를 피하기 위해 
--   2개 이상의 관계연산자를 사용할 때는 
--   ()를 사용

--20번 부서 사원중에 급여가 2000이상인 사원을 검색하라
SELECT *
FROM emp
WHERE dno = '20' AND sal >= 2000;

--01번 부서 사원중에 급여가 2000이상이고
--지원 업무를 담당하는 사원을 검색하라
SELECT *
FROM emp
WHERE dno = '01' AND sal >=2000 AND JOB ='지원';

SELECT *
FROM emp
WHERE (dno = '10' OR sal > 1600) AND comm > 600;

--LIKE 연산자

--SELECT 컬럼, ...
--FROM 테이블
--WHERE 컬럼 LIKE '비교 문자열';
--1) 문자열의 일부 검색시
--2) 문자열에서 패턴을 찾아주는 연산자
--3) '_' : 1개의 문자 대체
--   '%' : 문자열을 대체

--김씨성을 가진 사원을 검색하라

SELECT *
FROM emp
WHERE ename LIKE '김%';

--이름이 '하늘'인 사원을 검색하라

SELECT *
FROM emp
WHERE ename LIKE '%하늘';

--성과 이름이 각각 1글자인 사원을 검색하라

SELECT *
FROM emp
WHERE ename LIKE '__';

--빈번한 실수
SELECT *
FROM emp
WHERE ename='김%';

LIKE 연산자 사용시 ex
'경%' : '경'으로 시작하는 모든 문자열
        경, 경제, 경금속, 경영학과, ...
'%과' : '과'로 끝나는 모든 문자열
        과, 다과, 화학과, 물리학과, ...
'%김%' : '김'이란 글자가 들어간 모든 문자열
        김, 김씨, 돌김, 되새김질, ...
'화_' : '화'로 시작하는 두글자 단어
        화학, 화약, 화살, 화장...
'_화' : '화'로 끝나는 두글자 단어
        영화, 불화, ...
'__화' : '화'로 끝나는 세글자 단어
        무궁화, 해당화, 운동화, ...
'_동_' : '동'이 가운데 들어간 세글자 단어
        전동차, 김동근, ....

--1) 화학과와 물리학과 학생을 검색한다
SELECT *
FROM student
WHERE major='화학' OR major='물리';
--2) 화학과 학생중에 성이 공씨인 학생을 검색한다
SELECT *
FROM student
WHERE major='화학' AND sname LIKE '공%';
--연결 연산자와 중복제거

사원의 이름을 급여와 업무를 하나로 합쳐서 출력하라
SELECT ename || sal || job
FROM emp;

SELECT ename ||' '||sal||' '||job "이름     급여    업무"
FROM emp;

SELECT ename||'의 업무는 '||job||'입니다' "사원 업무"
FROM emp;

--연산자 우선순위에 의해 
--ename||' '||sal 이 결합되고
--문자열에 +10의 연산을 하려고 해서 오류가 발생
SELECT ename||' '||sal+100
FROM emp;

SELECT ename||' '||(sal+100)
FROM emp;

--중복제거
--SELECT [DISTINCT|ALL] 컬럼, 컬럼, ...
--FROM 테이블;
--DISTINCT : 중복 제거
--ALL : 모두 출력(default)

--직원들의 업무는 어떤 것이 있는지 검색(업무의 종류)

SELECT job 업무
FROM emp;

SELECT DISTINCT job 업무
FROM emp;

--1) __학과인 __학생의 현재 평점은 __입니다
--  처럼 출력하세요
SELECT major||'학과인 '||sname||'학생의 현재 평점은 '|| avr||' 입니다' "1번문제"
FROM student;
--2) __과목은 __학점 과목입니다
--  처럼 출력하세요
SELECT cname||' 과목은 '||st_num||'학점 과목입니다.' "2번문제"
FROM course;
--3) 학교에는 어떤 학과가 있는지 검색한다(student테이블)
SELECT DISTINCT major "3번문제"
FROM student;

--4) 급여를 10% 인상했을 때 연간 지급되는 급여를 검색한다
DESC emp;
SELECT ename,sal,sal*12 "원래 연봉",sal*1.1*12 "오른 연봉"
FROM emp;

--5) 현재 학생의 평균 평점은 4.0 만점이다.
     이를 4.5만점으로 환산해서 검색한다.
DESC student;
SELECT sno 생년월일,sname 이름,avr*1.125 "4.0 환산평점"
FROM student;

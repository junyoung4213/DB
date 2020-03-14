--SELECT * FROM emp; --한줄 주석 
/*SELECT * FROM emp;*/ -- 여러줄 주석
--select * from emp;
--select * from EMP;
--SELECT *
--FROM emp;
/*
SQL 문의 특징
1) 대소문자를 구별하지 않는다
2) 하지만 관습적으로는 다음처럼 사용한다
   명령어 대문자, 사용자 정의 이름 소문자
   명령어 소문자, 사용자 정의 이름 대문자
   둘중에 한가지를 선택한다
3) SQL 문의 절은 개행해서 사용하면 편리하다
4) SQL문은 ;로 끝난다(;로 다음 문장과 구별)
5) SQL문은 일상적인 자연어와 유사하다
   첫번째 숫자를 1부터 센다
*/

/*
SELECT 문
1) 검색시 사용
2) SELECT 컬럼, 컬럼, ...
   From 테이블;
3) 컬럼 대신 *을 주면 모두 검색
*/

SELECT *
FROM professor;

--professor 테이블의 교수번호와 교수 이름을 검색

SELECT pno,pname
From professor;

--테이블의 구조를 검색

DESC emp;

--현재 스키마의 모든 테이블 목록 검색
--스키마 : 현재 접속한 계정(에 속한 모든 데이터)
SELECT *
FROM tab;

--부서테이블(dept)의 테이블 정보 확인
DESC dept;

--부서테이블에서 모든 정보 검색
SELECT *
FROM dept;

--부서테이블에서 부서번호, 부서이름을 검색
SELECT dno,dname
FROM dept;

--사원의 이름과 업무를 검색
DESC EMP;
SELECT eno,ename,job
FROM emp;

--수식 실행
SELECT 2+3
FROM dual;



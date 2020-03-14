--WHERE 절을 이용한 조건 검색
/*
SELECT 컬럼, 컬럼, ...
FROM 테이블
WHERE 조건;
ORDER BY 컬럼;

1) 조건 사용되는 연산자
   =(같아), <, >, <=, >=, !=(같지않다)
2) DB의 개념이 부족한 개발자들
   2-1)SELECT * FROM emp;
   2-2)컬렉션에 모두 저장한다
   2-3)반복문과 if문으로 원하는 값만 추출한다
3) DB의 개념이 있는 개발자
   3-1) SELECT 필요컬럼, ...
        FROM 테이블
        WHERE 조건;
   3-2) DBMS가 필요한 데이터만 준다(빠르다)
*/

--사원중에 급여가 3000이상인 사원의 명단
SELECT eno, ename, sal
FROM emp
WHERE sal>=3000;

--이름이 '김연아'인 사원의 정보
SELECT *
FROM emp
WHERE ename='김연아';

--10번 부서를 제외한 사원의 명단
SELECT dno "10번이 아닌 부서", eno,ename
FROM emp
WHERE dno!=10
ORDER BY dno;

DESC emp;

--자료형을 아래처럼 일치시켜야 한다
SELECT dno "10번이 아닌 부서", eno,ename
FROM emp
WHERE dno!='10'
ORDER BY dno;

/*
dno는 자료형이 VARCHAR2 이다
10을 비교하면 이 10은 정수 자료형이다
이럴 때 모든 행의 데이터를 검색할 때마다
dno를 정수 자료형으로 자동 변환한다

결과적으로 별 문제는 없지만
기업환경의 테이블은 수천만 이상의 행이 보통이므로
위처럼 검색하면 엄청나게 속도가 저하된다
*/

--연봉이 30,000 이상인 사원의 이름을 검색한다
DESC emp;
SELECT eno,ename,sal*12+NVL(comm,0) 연봉
FROM emp
WHERE sal*12+NVL(comm,0) >='30000'
ORDER BY 연봉 DESC;

--보너스가 200이하인 사원을 검색하라
SELECT eno,ename,comm
FROM emp
WHERE NVL(comm,0) <= 200;

--입사일이 1996년 이후인 사원의 정보를 검색하라
SELECT *
FROM emp
WHERE hdate > '1995/12/31';

ALTER SESSION SET
nls_date_format='YYYY/MM/DD';

ALTER SESSION SET
nls_date_format='YY/MM/DD';

SELECT *
FROM emp
WHERE hdate > '1995/12/31';

--보너스 컬럼이 널 값인 사원을 검색하라
--=, < : 널값일 때 사용불가
--IS NULL       :널값인가
--IS NOT NULL   :널값이 아닌가

SELECT *
FROM emp
WHERE comm IS NULL;
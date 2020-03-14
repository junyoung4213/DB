--자기 참조 조인(Self Join)

--SELECT 컬럼, ...
--FROM 테이블 별명1, 테이블 별명2
--WHERE 조인_조건
--AND 일반_조건
--1) 동일 테이블을 자기 참조에 의해 조인한다
--2) 별명1과 별명2는 같은 테이블의 다른 이름이다
--   같은 테이블이지만 다른 이름을 부여함으로써 
--   서로 다른 테이블을 조인하는 효과를 부여한다
--3) 테이블에 반드시 별명을 붙여야 한다
--   (별명을 이용한 조인이라고 부르기도 한다)
   
SELECT *
FROM emp;

--각 사원을 관리하는 관리자(사수)의 이름을 검색한다
--e1은 관리자 테이블
--e2는 사원 테이블
SELECT e1.eno 사번, e1.ename 사원, e1.mgr 관리자사번,
       e2.eno 관리자사번, e2.ename 관리자
FROM emp e1 , emp e2
WHERE e1.mgr=e2.eno;


--외부조인
--SELECT 테이블1.컬럼, ... 테이블2.컬럼, ...
--FROM 테이블1, 테이블2, ...
--WHERE 조인_조건(+)
--AND 일반_조건;
--1) 조인 조건에 일치하지 않는 데이터를 출력해준다
--2) + 기호는 데이터가 부족한 쪽에 기술한다.

--신규부서가 만들어져서 부서원이 없을 때
--신입사원이 아직 부서배정을 받지 않았을 때
--그냥 등가조인(=)을 하면 일부 누락되게 된다.
--이럴 때 외부조인을 하면 모두 출력된다.

--각 부서별로 사원을 검색한다

SELECT d.dno,dname,e.eno,ename
FROM dept d, emp e
WHERE d.dno=e.dno
ORDER BY 1;

SELECT d.dno,dname,e.eno,ename
FROM dept d, emp e
WHERE d.dno=e.dno(+)
ORDER BY 1;
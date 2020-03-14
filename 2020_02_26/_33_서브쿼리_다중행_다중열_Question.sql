--다중행/다중열 서브쿼리로 해결하세요
--1. 화학과 학생의 평점이 동일한 학생들을 검색한다
SELECT major,sname,avr
FROM student
WHERE avr IN (SELECT avr
              FROM student
              WHERE major='화학')
AND major!='화학';
--2. 화학과 교수와 부임일이 같은 사원을 검색한다
SELECT ename,hdate
FROM emp
WHERE hdate IN (SELECT hiredate
                   FROM professor
                   WHERE section='화학');
--3. 화학과 학생과 같은 학년에서 평점이 동일한
--   학생들을 검색한다.
SELECT major,sno,sname,syear,avr
FROM student
WHERE (avr,syear) IN (SELECT avr,syear
                      FROM student
                      WHERE major='화학')
AND major!='화학';
--4. 10번 부서 사원들과 연봉이 동일한 사원을 검색한다
SELECT eno,ename,sal*12+NVL(comm,0) 
FROM emp
WHERE (sal*12+NVL(comm,0),dno) IN (SELECT sal*12+NVL(comm,0),dno
                                   FROM emp
                                   WHERE dno='10')
AND dno!='10';

--5. 기말고사 성적이 핵화학 과목보다 우수한 과목의
--   과목명과 담당 교수명을 검색한다
SELECT cname,pname,AVG(result)
FROM course r
JOIN professor p ON p.pno = r.pno
JOIN score s ON s.cno = r.cno
GROUP BY s.cno,cname,pname
HAVING AVG(result) >  (SELECT AVG(result)
                         FROM course r
                         JOIN professor p ON p.pno = r.pno
                         JOIN score s ON s.cno = r.cno
                         WHERE r.cname='핵화학'
                         GROUP BY s.cno);
                         
--6. 10번 부서 사원들과 급여 및 연봉이 동일한 사원을
--   검색한다

SELECT dno,sal,sal*12+NVL(comm,0)
FROM emp
WHERE (sal,sal*12+NVL(comm,0)) IN (SELECT sal,sal*12+NVL(comm,0)
                                   FROM emp
                                   WHERE dno='10')
AND dno!='10';

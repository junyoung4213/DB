ON 절/좌우 외부조인을 사용해서 해결하세요

--1. 각 과목의 과목명과 담당 교수의 교수명을 검색한다
SELECT cno,cname,c.pno,pname
FROM course c
LEFT JOIN professor p ON c.pno=p.pno;

--2. 화학과 학생의 기말고사 성적을 모두 검색한다
SELECT major,st.sno,sname,cname,result
FROM student st
LEFT JOIN score s ON st.sno=s.sno
LEFT JOIN course c ON s.cno=c.cno
WHERE major='화학';

SELECT major, s.sno, sname, result
FROM student s
JOIN score r ON s.sno=r.sno
WHERE major='화학';

--3. 유기화학과목 수강생의 기말고사 시험점수를 검색한다
SELECT sno,c.cno,cname,result
FROM course c
JOIN score s ON c.cno=s.cno
WHERE cname='유기화학';

SELECT cname, s.sno, sname, result
FROM student s
JOIN score r ON s.sno=r.sno
JOIN course c ON r.cno=c.cno
WHERE cname='유기화학';

--4. 화학과 학생이 수강하는 과목을 담당하는 교수의
--   명단을 검색한다
SELECT DISTINCT c.cno,cname,pname,section,orders
FROM student st
JOIN score s ON st.sno = s.sno
JOIN course c ON c.cno=s.cno
JOIN professor p ON c.pno=p.pno
WHERE major='화학';

SELECT DISTINCT p.pno, pname
FROM student s
JOIN score r ON s.sno=r.sno
JOIN course c ON r.cno=c.cno
JOIN professor p ON c.pno=p.pno
WHERE major='화학';

--5. 모든 교수의 명단과 담당 과목을 검색한다
SELECT p.pno,pname,cname
FROM professor p
LEFT JOIN course c ON c.pno=p.pno;

--6. 모든 교수의 명단과 담당 과목을 검색한다
--   (단, 모든 과목도 같이 검색한다)
SELECT p.pno,pname,cname
FROM professor p
FULL JOIN course c ON c.pno=p.pno;

--1. 송강 교수가 강의하는 과목을 검색하라
SELECT p.pno,pname,c.cno,cname
FROM professor p,course c
WHERE p.pno=c.pno AND pname='송강';

--2. 화학 관련 과목을 강의하는 교수의 명단을 검색하라
SELECT c.pno,pname,c.cno,cname
FROM course c, professor p
WHERE c.pno=p.pno AND cname LIKE ('%화학%');

--3. 학점이 2학점인 과목과 이를 강의하는 교수를 검색하라
SELECT cno, cname, st_num, c.pno, pname
FROM course c, professor p
WHERE c.pno=p.pno
AND st_num=2;

SELECT c.pno,pname,orders,cno,cname,st_num
FROM course c,professor p
WHERE c.pno = p.pno AND st_num=2;

--4. 화학과 교수가 강의하는 과목을 검색하라
SELECT pname,section,cname
FROM course c,professor p
WHERE c.pno=p.pno AND section='화학';

--5. 화학과 1학년 학생의 기말고사 성적을 검색하라
SELECT st.sno, sname,sex,syear,major,cname,result
FROM student st,score sc,course c
WHERE st.sno=sc.sno AND c.cno=sc.cno AND major='화학' AND syear=1;

--6. 일반화학 과목의 기말고사 점수를 검색하라
SELECT c.cno,cname,sc.sno,sname,result
FROM course c, score sc, student st
WHERE c.cno=sc.cno AND st.sno=sc.sno AND cname='일반화학'
ORDER BY result DESC;

--7. 화학과 1학년 학생의 일반화학 기말고사 점수를 검색하라
SELECT st.sno,sname,sex,syear,major,cname,result
FROM student st,course c,score sc
WHERE st.sno=sc.sno AND c.cno=sc.cno AND major='화학' AND syear=1 AND cname='일반화학';

--8. 화학과 1학년 학생이 수강하는 과목을 검색하라
SELECT DISTINCT c.cno,cname
FROM student st, course c, score sc
WHERE st.sno=sc.sno AND c.cno=sc.cno AND major='화학' AND syear=1;

--9. 유기화학 과목의 평가점수가 F인 학생의 명단을 검색하라
SELECT st.sno,sname,sex,syear,major,cname,result, sg.grade
FROM student st, course c, score sc, scgrade sg
WHERE st.sno=sc.sno 
AND c.cno=sc.cno 
AND cname='유기화학' 
AND result BETWEEN sg.loscore AND sg.hiscore
AND sg.grade='F'
ORDER BY result DESC;
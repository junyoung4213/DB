--1. 학생중에 동명이인을 검색한다
SELECT DISTINCT s1.sno,s1.syear,s1.sname,s1.major
FROM student s1, student s2
WHERE s1.sname=s2.sname AND s1.sno!=s2.sno
ORDER BY s1.sname;

--2. 전체 교수명단과 교수가 담당하는 과목의 이름을
--   학과 순으로 검색한다
SELECT p1.pno,pname,section,orders,cno,cname
FROM professor p1, course c1
WHERE p1.pno=c1.pno(+)
ORDER BY section,pname;
--3. 모든 과목과 담당 교수를 학점순으로 검색한다 
SELECT cno,cname,st_num,p1.pno,pname
FROM course c1, professor p1
WHERE c1.pno=p1.pno(+)
ORDER BY st_num;
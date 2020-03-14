NATURAL JOIN 이나 USING 을 사용하세요

--1. 송강 교수가 강의하는 과목을 검색한다
SELECT pno,pname,cno,cname
FROM professor
NATURAL JOIN course
WHERE pname='송강';

SELECT pno,pname,cno,cname
FROM professor
JOIN course USING(pno)
WHERE pname='송강';

--2. 화학 관련 과목을 강의하는 교수의 명단을 검색한다
SELECT pno,pname,section,orders,cno,cname
FROM professor
NATURAL JOIN course
WHERE cname LIKE '%화학%';

SELECT pno,pname,section,orders,cno,cname
FROM professor
JOIN course USING (pno)
WHERE cname LIKE '%화학%';

--3. 학점이 2학점인 과목과 이를 강의하는 교수를 검색한다
SELECT st_num,cno,cname,pno,pname
FROM course
NATURAL JOIN professor
WHERE st_num=2;

SELECT st_num,cno,cname,pno,pname
FROM course
JOIN professor USING(pno)
WHERE st_num=2;

--4. 화학과 교수가 강의하는 과목을 검색한다
SELECT pno, pname, section, cno, cname
FROM professor
NATURAL JOIN course
WHERE section='화학';

SELECT pno, pname, section, cno, cname
FROM professor
JOIN course USING(pno)
WHERE section='화학';

--5. 화학과 1학년 학생의 기말고사 성적을 검색한다
SELECT major,syear,sname,cname,result
FROM student
NATURAL JOIN score
NATURAL JOIN course
WHERE major='화학' AND syear=1;

SELECT major,syear,sname,cname,result
FROM student
JOIN score USING(sno)
JOIN course USING(cno)
WHERE major='화학' AND syear=1;

--6. 일반화학 과목의 기말고사 점수를 검색한다
SELECT cno,cname,sno,result
FROM course
NATURAL JOIN score
WHERE cname='일반화학';

SELECT cno,cname,sno,result
FROM course
JOIN score USING(cno)
WHERE cname='일반화학';

--7. 화학과 1학년 학생의 일반화학 기말고사 점수를 검색한다
SELECT major,syear,sname,cno,cname,result
FROM student
NATURAL JOIN score
NATURAL JOIN course
WHERE major='화학' AND syear=1 AND cname='일반화학';

SELECT major,syear,sname,cno,cname,result
FROM student
JOIN score USING (sno)
JOIN course USING (cno)
WHERE major='화학' AND syear=1 AND cname='일반화학';

--8. 화학과 1학년 학생이 수강하는 과목을 검색한다
SELECT DISTINCT cno,cname
FROM student
NATURAL JOIN score
NATURAL JOIN course
WHERE major='화학' AND syear=1;

SELECT DISTINCT cno, cname
FROM student
JOIN score USING (sno)
JOIN course USING (cno)
WHERE major='화학' AND syear=1;
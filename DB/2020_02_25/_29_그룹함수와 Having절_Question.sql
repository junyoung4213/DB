--1. 과별 학생들의 평점 평균을 검색하세요
SELECT major, AVG(avr)
FROM student
GROUP BY major;
--2. 화학과를 제외한 각 학과별 평균 평점중에 평점이 2.0이상인
--   정보를 검색한다
SELECT major, AVG(avr)
FROM student
WHERE major!='화학'
GROUP BY major
HAVING AVG(avr)>=2.0;

--3. 기말고사 평균이 60점 이상인 학생의 정보를 검색한다
--  (학번과 기말고사 평균)
SELECT st.sno,AVG(result)
FROM student st
JOIN score r ON st.sno=r.sno
GROUP BY st.sno
HAVING AVG(result)>=60;

--4. 강의 학점수가 3학점 이상인 교수의 정보를 검색한다
--   (교수번호, 이름과 담당 학점수)
SELECT p.pno,pname,SUM(c.st_num)
FROM course c
JOIN professor p ON c.pno=p.pno
GROUP BY p.pno,pname
HAVING SUM(c.st_num)>=3;

--1. 화학과 학생을 검색하라
SELECT *
FROM student
WHERE major='화학';
--2. 물리과 학생을 검색하라
SELECT *
FROM student
WHERE major='물리';
--3. 평점이 2.0 미만인 학생을 검색하라
SELECT *
FROM student
WHERE avr<2.0
ORDER BY avr DESC;
--4. 관우학생의 평점을 검색하라
SELECT sno, sname, avr
FROM student
WHERE sname='관우';
--5. 정교수의 명단을 검색하라
SELECT *
FROM professor
WHERE orders='정교수'
ORDER BY pname;
--6. 생물과 소속 교수의 명단을 검색하라
SELECT *
FROM professor
WHERE section='생물'
ORDER BY pname;
--7. 송강 교수의 정보를 검색하라
SELECT *
FROM professor
WHERE pname='송강';
--8. 학년별로 화학과 학생의 성적을 검색하라
SELECT *
FROM student
WHERE major='화학'
ORDER BY syear;
--9. 2000년 이전에 부임한 교수의 정보를
--   부임일순으로 검색하라
SELECT *
FROM professor
WHERE hiredate<'2000/01/01'
ORDER BY hiredate;
--10. 담당 교수가 없는 과목의 정보를 검색하라
SELECT *
FROM course
WHERE pno IS NULL
ORDER BY pno;
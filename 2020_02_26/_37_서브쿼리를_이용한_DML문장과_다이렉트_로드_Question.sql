--1. 일반 화학 과목을 수강하는 학생의 성적을 4.5만점 기준으로
--   수정한다
UPDATE student
SET avr = avr/4.0*4.5
WHERE sno IN (SELECT sno
           FROM score
           WHERE cno = (SELECT cno
                        FROM course
                        WHERE cname='일반화학'));

ROLLBACK;

           
--2. 화학과 교수의 과목중에 학점이 3학점 미만인 과목을 
--   모두 3학점으로 수정한다
UPDATE course
set st_num = 3
WHERE pno IN (SELECT pno
             FROM professor
             WHERE section='화학')
AND st_num<3;

SELECT *
FROM course
JOIN professor ON professor.pno=course.pno
WHERE section='화학';

--3. 학생의 기말고사 성적을 모두 st_score 테이블에 저장한다
INSERT INTO st_score(sno,sname,major,syear,cno,cname,result)
SELECT st.sno,sname,major,syear,c.cno,cname,result
FROM student st
JOIN score r ON r.sno=st.sno
LEFT JOIN course c ON c.cno = r.cno;

ROLLBACK;
SELECT *
FROM st_score;
--4. st_score 테이블에 각 학생의 평점을 학과별, 과목별로 입력한다.
--   검색할 때 대부분 학과별 검색을 수행하기 때문에 이들 데이터가
--   학과별로 몰려있으면 성능을 향상시킬 수 있다.
--   (왜냐하면 ORDER BY 할 필요가 없으므로)
--   (데이터가 매우 많은 테이블의 정렬은 많은 시간을 소요하게 된다)
INSERT INTO st_score(major,cname,result)
SELECT major,cname,result
FROM student st
JOIN score r ON r.sno = st.sno
JOIN course c ON c.cno = r.cno
ORDER BY major,cname;

ROLLBACK;

SELECT major,cname,result
FROM st_score;

--5. 화학과 학생이 수강하는 과목을 강의하는 교수의 부임일자를
--   1년 늦도록 수정한다.
UPDATE professor
set hiredate = hiredate + 365
WHERE pno IN (SELECT pno
           FROM course
           JOIN score ON score.cno=course.cno
           JOIN student ON student.sno=score.sno
           WHERE major='화학');
ROLLBACK;

SELECT *
FROM professor;
--서브 쿼리를 사용하세요
--1. 관우보다 평점이 우수한 학생의 학번과 이름을 검색하라
SELECT sno,sname,avr
FROM student
WHERE avr > (SELECT avr
             FROM student
             WHERE sname='관우');
--2. 관우와 동일한 학년중에 평점이 사마감과 동일한 학생을
--   검색하라
SELECT sno,sname,syear,avr
FROM student
WHERE avr = (SELECT avr
             FROM student
             WHERE sname='사마감')
AND syear = (SELECT syear
             FROM student
             WHERE sname='관우');
--3. 관우보다 일반화학과목의 기말고사 점수가 더 낮은 학생의 
--   명단을 기말고사 점수와 함께 검색하라
SELECT sname,result
FROM student
JOIN score USING (sno)
JOIN course USING (cno)
WHERE result < (SELECT result
             FROM student
             JOIN score USING (sno)
             JOIN course USING (cno)
             WHERE sname='관우' AND cname='일반화학')
AND cname='일반화학';


                           
-- 관우보다 일반화학 과목 학점(ABCDF)이 낮은 애들 검색
SELECT sname,cname,grade
FROM student
JOIN score ON student.sno=score.sno
JOIN course ON course.cno = score.cno
JOIN scgrade ON result BETWEEN loscore AND hiscore
WHERE grade > (SELECT grade
                FROM student
                JOIN score ON student.sno=score.sno
                JOIN course ON course.cno = score.cno
                JOIN scgrade ON result BETWEEN loscore AND hiscore
                AND cname='일반화학' AND sname='관우')
AND cname='일반화학';


SELECT r.cno,r.sno,r.result
FROM score r
WHERE r.result < (SELECT result
             FROM student st
             JOIN score r ON r.sno=st.sno
             JOIN course c ON c.cno = r.cno
             WHERE st.sname='관우' AND cname='일반화학');
--4. 인원수가 가장 많은 학과를 검색하라
SELECT major,COUNT(major)
FROM student
GROUP BY major
HAVING COUNT(major)=(SELECT MAX(COUNT (major))
                     FROM student
                     GROUP BY major);

--5. 학생중 기말고사 성적이 가장 낮은 학생의 정보를 검색하라
SELECT sname,result
FROM student st
JOIN score r ON r.sno=st.sno
JOIN course c ON c.cno = r.cno
WHERE r.result = (SELECT MIN(result)
             FROM score);
             


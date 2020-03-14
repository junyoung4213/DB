--1. 3학년 학생의 학과별 평점 평균과 분산 및 표준편차를 검색하라
--STDDEV 표준편차를 계산
--VARIANCE 분산을 계산
SELECT major,
       AVG(avr) 평균,
       VARIANCE(avr) 분산,
       STDDEV(avr) 표준편차
FROM student
WHERE syear=3
GROUP BY major;

--2. 화학과 학년별 평균 평점을 검색하라
SELECT syear,
      AVG(avr) 평균
FROM student
WHERE major='화학'
GROUP BY syear
ORDER BY syear;
--3. 각 학생별 기말고사 평균을 검색하라
SELECT s.sno,sname,
       ROUND(AVG(NVL(result,0)))
FROM student s
LEFT JOIN score r ON s.sno=r.sno
GROUP BY s.sno,sname;
--4. 각 학과별 학생 수를 검색하라
SELECT major 학과,
      COUNT(sname) "학생 수"
FROM student
GROUP BY major;
--5. 화학과와 생물학과 학생 4.5 환산 평점의 평균을 각각 검색하라
SELECT major,sname,
      AVG(avr/4.0*4.5) "환산 평점 평균"
FROM student
WHERE major='화학' OR major='생물'
GROUP BY major,sname
ORDER BY major DESC;



--6. 부임일이 10년 이상 된 직급별(정교수, 조교수, 부교수)
--   교수의 수를 검색하라
--    WHERE MONTHS_BETWEEN(sysdate,hiredate)>=120;
SELECT orders,
        COUNT(orders)
FROM professor
WHERE MONTHS_BETWEEN(sysdate,hiredate)>=120
GROUP BY orders;
--7. 과목명에 화학이 포함된 과목의 학점수 총합을 검색하라
SELECT SUM(NVL(st_num,0)) 총합
FROM course
WHERE cname LIKE '%화학%';
--8. 화학과 학생들의 기말고사 성적을 성적순으로 검색하라
SELECT major,sname,
      ROUND(AVG(result)) 성적
FROM student st
JOIN score r ON st.sno=r.sno
WHERE major='화학'
GROUP BY major,sname
ORDER BY 성적 DESC;
--9. 학과별 기말고사 평균을 성적순으로 검색하라
SELECT major,
       ROUND(AVG(NVL(result,0)),2) 평균
FROM student st
LEFT JOIN score r ON st.sno=r.sno
GROUP BY major
ORDER BY 평균 DESC;

SELECT major,
       ROUND(AVG(result),2) 평균
FROM student st
JOIN score r ON st.sno=r.sno
GROUP BY major
ORDER BY 평균 DESC;
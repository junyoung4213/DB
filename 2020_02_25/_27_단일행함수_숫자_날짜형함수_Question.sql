--모두 단일 행 함수를 사용한다
--1. 교수들이 부임한 달에 근무한 일수는 몇 일인지 검색한다
SELECT pno,pname,
       LAST_DAY(hiredate)-hiredate+1
FROM professor;
--2. 교수들의 오늘까지 근무한 주가 몇 주인지 검색한다
SELECT pno, pname,
      TRUNC((sysdate - hiredate+1)/7)+1 "근무한 주"
FROM professor
ORDER BY "근무한 주";
--3. 1991년에서 1995년 사이에 부임한 교수를 검색한다
SELECT pno, pname,hiredate
FROM professor
WHERE hiredate BETWEEN TO_DATE('1991/01/01') AND TO_DATE('1995/12/31');

SELECT pno,pname,hiredate
FROM professor
WHERE TRUNC(hiredate,'YYYY') > TO_DATE('1991/01/01') 
AND TRUNC(hiredate,'YYYY') < TO_DATE('1995/12/31');

SELECT pno, pname, hiredate
FROM professor
WHERE SUBSTR(hiredate,1,2) BETWEEN 91 AND 95;


SELECT pno, pname, TRUNC(hiredate,'YY')
FROM professor;
--4. 학생들의 4.5 환산 평점을 검색한다(소수점 둘째자리까지)
SELECT sno,sname,ROUND(avr/4.0*4.5,2) 환산평점
FROM student;

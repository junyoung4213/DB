--1. emp 테이블에 소녀시대 멤버를 임의로 입력하라
--   단, 시간은 현재시간을 입력하세요 -- sysdate
INSERT INTO emp
VALUES('2000','태연','가수',NULL,sysdate,5000,3000,'20');
SELECT *
FROM emp;
--2. 모든 학생의 성적을 4.5만점 기준으로 수정하라
UPDATE student SET avr=avr/4.0*4.5;
SELECT *
FROM student;
--3. 모든 교수의 부임일자를 100일 앞으로 수정하라
UPDATE professor SET hiredate=hiredate-100;

SELECT *
FROM professor;
--4. 화학과 2학년 학생의 정보를 삭제하라
DELETE FROM student
WHERE syear=2 AND major='화학';

SELECT *
FROM student;
--5. 조교수의 정보를 삭제하라
DELETE FROM professor
WHERE orders='조교수';

SELECT *
FROM professor;

--6. 원래 정보로 회복하라
ROLLBACK;
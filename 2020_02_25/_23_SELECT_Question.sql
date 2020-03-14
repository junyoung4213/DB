1. 학생의 평균 평점을 다음 형식에 따라 소수점 이하 두 자리까지 검색한다
   'XXX 학생의 평균 평점은 x.xx입니다.'

SELECT sname||'학생의 평균 평점은'||TO_CHAR(avr,'0.99')||'입니다.' 성적
FROM student;

2. 교수의 다음 형식으로 부임일을 검색한다
   'XXX 교수의 부임일은 YYYY년 MM월 DD일입니다.'
SELECT pname || '교수의 부임일은 ' || TO_CHAR(hiredate,'YYYY"년 "MM"월 "DD"일입니다."')
FROM professor;
3. 교수 중에 3월에 부임한 교수의 명단을 검색한다.
SELECT *
FROM professor
WHERE SUBSTR(hiredate,4,2)='03';

SELECT *
FROM professor
WHERE TO_CHAR(hiredate, 'MM')='03';


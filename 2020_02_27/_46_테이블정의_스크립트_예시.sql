--client 테이블을 삭제하라
DROP TABLE client;

--client 테이블을 생성하라
CREATE TABLE client(
  cnum NUMBER,
  cname VARCHAR2(50),
  addr VARCHAR2(200),
  tel VARCHAR2(20)
);

--server 테이블을 삭제하라
DROP TABLE server;

--server 테이블을 생성하라
CREATE TABLE server(
  cnum NUMBER,
  cname VARCHAR2(50),
  addr VARCHAR2(200),
  tel VARCHAR2(20)
);
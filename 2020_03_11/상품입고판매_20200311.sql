DROP USER bitsinshon CASCADE;

CREATE USER bitsinchon IDENTIFIED BY bitsinchon DEFAULT TABLESPACE users TEMPORARY TABLESPACE temp PROFILE DEFAULT;

GRANT CONNECT, RESOURCE TO bitsinchon;
GRANT CREATE VIEW, CREATE SYNONYM TO bitsinchon;

ALTER USER bitsinchon ACCOUNT UNLOCK;

conn bitsinchon/bitsinchon;

--모든 테이블을 삭제한다
DROP TABLE ENTERING;
DROP TABLE SALE;
DROP TABLE SUPPLY_COMPANY;
DROP TABLE PRODUCT;
DROP TABLE MEMBER;

CREATE TABLE SUPPLY_COMPANY(
  company_code VARCHAR2(10),
  company_name VARCHAR2(30),
  ceo_name VARCHAR2(20),
  ceo_phone VARCHAR2(20),
  charge_person VARCHAR2(20),
  charge_phone VARCHAR2(20),
  post_num VARCHAR2(12),
  address VARCHAR2(100),
  CONSTRAINT SUPPLY_COMPANY_company_code_pk PRIMARY KEY (company_code)
);



CREATE TABLE PRODUCT(
  product_code VARCHAR2(10),
  product_name VARCHAR2(30),
  manufacturer VARCHAR2(20),
  consumer_price INTEGER,
  sale_price INTEGER,
  total_stock INTEGER,
  CONSTRAINT PRODUCT_product_code_pk PRIMARY KEY (product_code)
);



--CREATE TABLE MEMBER(
--  member_code VARCHAR2(10),
--  name VARCHAR2(20),
--  reg_num VARCHAR2(20),
--  phone VARCHAR2(20),
--  mobilephone VARCHAR2(20),
--  post_num VARCHAR2(12),
--  address VARCHAR2(100),
--  reg_date DATE,
--  CONSTRAINT MEMBER_member_code_pk PRIMARY KEY(member_code)
--);

CREATE TABLE MEMBER(
  member_code VARCHAR2(10),
  name VARCHAR2(20) CONSTRAINT MEMBER_name_nu NOT NULL,
  reg_num VARCHAR2(20) CONSTRAINT MEMBER_reg_num_nu NOT NULL,
  phone VARCHAR2(20) CONSTRAINT MEMBER_phone_nu NOT NULL,
  mobilephone VARCHAR2(20) CONSTRAINT MEMBER_mobilephone_nu NOT NULL,
  post_num VARCHAR2(12),
  address VARCHAR2(100) CONSTRAINT MEMBER_address_nu NOT NULL,
  reg_date DATE CONSTRAINT MEMBER_reg_date NOT NULL,
  CONSTRAINT MEMBER_member_code_pk PRIMARY KEY(member_code),
  CONSTRAINT MEMBER_post_num_ch CHECK (LENGTH(post_num) <= 8 AND post_num LIKE '%-%')
);

CREATE TABLE ENTERING(
  entering_serial INTEGER,
  product_code VARCHAR2(10),
  company_code VARCHAR2(10),
  entering_date DATE,
  entering_num INTEGER,
  entering_unitprice INTEGER,
  entering_price INTEGER,
  CONSTRAINT ENTERING_entering_serial_pk PRIMARY KEY (entering_serial),
  CONSTRAINT ENTERING_code_fk FOREIGN KEY(product_code) 
                             REFERENCES PRODUCT(product_code),
  CONSTRAINT ENTERING_company_code_fk FOREIGN KEY(company_code) 
                             REFERENCES SUPPLY_COMPANY(company_code)                           
                  
);

CREATE TABLE SALE(
  sale_serial INTEGER,
  member_code VARCHAR2(10),
  product_code VARCHAR2(10),
  sale_date DATE,
  sale_num INTEGER,
  sale_unitprice INTEGER,
  sale_price INTEGER,
  CONSTRAINT SALE_sale_serial_pk PRIMARY KEY(sale_serial),
  CONSTRAINT SALE_member_code_fk FOREIGN KEY(member_code) 
                             REFERENCES MEMBER(member_code),
  CONSTRAINT SALE_product_code_fk FOREIGN KEY(product_code) 
                             REFERENCES PRODUCT(product_code)
);



INSERT INTO MEMBER (member_code,  name,  reg_num,
                    phone,  mobilephone,  post_num,
                    address,  reg_date)
VALUES('1000','홍길동', '7701101028901',
       '02-111-111', '010-111-1111', '111-333', 
       '지리산', sysdate);
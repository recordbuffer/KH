DROP SEQUENCE M_NOSEQ;
DROP TABLE BE_MEMBER CASCADE CONSTRAINTS;

--회원 번호 시퀀스
CREATE SEQUENCE M_NOSEQ NOCACHE;

--회원 테이블 
CREATE TABLE BE_MEMBER(
 BE_NO NUMBER NOT NULL,
 BE_ID VARCHAR2(100) NOT NULL,		
 BE_PW VARCHAR2(100) NOT NULL,
 BE_NN VARCHAR2(100) NOT NULL,
 BE_NAME VARCHAR2(100) NOT NULL,
 BE_ADDR VARCHAR2(100) NOT NULL,
 BE_PHONE VARCHAR2(100) NOT NULL,
 BE_EMAIL VARCHAR2(100) NOT NULL,
 BE_ENABLED VARCHAR2(2) DEFAULT 'Y' NOT NULL,
 BE_ROLE VARCHAR2(50) DEFAULT 'L1'NOT NULL,

 CONSTRAINT BE_MEMBER_PK PRIMARY KEY(BE_NO),
 CONSTRAINT BE_MEMBER_UQ_ID UNIQUE(BE_ID),
 CONSTRAINT BE_MEMBER_UQ_EMAIL UNIQUE(BE_EMAIL),
 CONSTRAINT BE_MEMBER_ENABLE_CHK CHECK(BE_ENABLED IN('Y', 'N')),
 CONSTRAINT BE_MEMBER_ROLE_CHK CHECK(BE_ROLE IN('L1', 'L2', 'L3', 'ADM'))
);

INSERT INTO BE_MEMBER VALUES(
M_NOSEQ.NEXTVAL, 'thal00','1234','감자','박소미','서울시 송파구','010-1111-3333','pth00@naver.com','Y','ADM');

INSERT INTO BE_MEMBER VALUES(
M_NOSEQ.NEXTVAL, 'wngus99','1234','김밥','김주현','경기도 성남시','010-8888-6666','wn99@naver.com','Y','ADM');

INSERT INTO BE_MEMBER VALUES(
M_NOSEQ.NEXTVAL, 'tjwjd00','1234','순두부','문서정','경기도 광명시','010-3553-5555','moon00@naver.com','Y','ADM');

INSERT INTO BE_MEMBER VALUES(
M_NOSEQ.NEXTVAL, 'tmddnjs77','1234','키위','채승원','경기도 남양주시','010-6666-7777','cccww11@naver.com','Y','L3');

INSERT INTO BE_MEMBER VALUES(
M_NOSEQ.NEXTVAL, 'tjdtn44','1234','옥수수','민성수','경기도 성남시','010-1111-9999','ssuu1919@naver.com','Y','L1');

INSERT INTO BE_MEMBER VALUES(
M_NOSEQ.NEXTVAL, 'wjddn99','1234','수박','최정우','경기도 안양시','010-1234-7777','jwooo00@naver.com',default,default);



SELECT * FROM BE_MEMBER;
-----------------
DROP SEQUENCE FLIST_SEQ;
DROP TABLE BE_FRIEND CASCADE CONSTRAINTS;

--친구 번호 시퀀스
CREATE SEQUENCE FLIST_SEQ NOCACHE;

--친구 테이블
CREATE TABLE BE_FRIEND(
 FLIST_NO NUMBER NOT NULL,
 M1 VARCHAR2(100) NOT NULL,
 M2 VARCHAR2(100) NOT NULL,

 UNIQUE(M1, M2),
 CHECK(M1!=M2),
 CONSTRAINT BE_FRIEND_PK PRIMARY KEY(FLIST_NO),
 CONSTRAINT BE_FRIEND_FK FOREIGN KEY(M1) REFERENCES BE_MEMBER(BE_ID),
 CONSTRAINT FRIEND_FK FOREIGN KEY(M2) REFERENCES BE_MEMBER(BE_ID)
);

INSERT INTO BE_FRIEND VALUES(
FLIST_SEQ.NEXTVAL, 'tmddnjs77', 'wjddn99');

INSERT INTO BE_FRIEND VALUES(
FLIST_SEQ.NEXTVAL, 'wjddn99', 'tmddnjs77');

INSERT INTO BE_FRIEND VALUES(
FLIST_SEQ.NEXTVAL, 'wjddn99', 'wjddn99');

INSERT INTO BE_FRIEND VALUES(
FLIST_SEQ.NEXTVAL, 'tmddnjs77', 'tjdtn44');

INSERT INTO BE_FRIEND VALUES(
FLIST_SEQ.NEXTVAL, 'tjdtn44', 'tmddnjs77');


SELECT * FROM BE_FRIEND;
---------------------
DROP SEQUENCE MSG_SEQ;
DROP TABLE BE_MSG CASCADE CONSTRAINTS;

--쪽지 번호 시퀀스
CREATE SEQUENCE MSG_SEQ NOCACHE;
 
--쪽지 테이블
CREATE TABLE BE_MSG(
 MSG_NO NUMBER NOT NULL,
 FLIST_NO NUMBER NOT NULL,
 MSG_CONTENT VARCHAR2(4000),
 MSG_DATE DATE DEFAULT SYSDATE NOT NULL,

 CONSTRAINT BE_MSG_PK PRIMARY KEY(MSG_NO),
 CONSTRAINT FLIST_NO_FK FOREIGN KEY(FLIST_NO) REFERENCES BE_FRIEND(FLIST_NO)
... (8 lines left)
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
 CONSTRAINT BE_MEMBER_UQ_NN UNIQUE(BE_NN),
 CONSTRAINT BE_MEMBER_UQ_EMAIL UNIQUE(BE_EMAIL),
 CONSTRAINT BE_MEMBER_ENABLE_CHK CHECK(BE_ENABLED IN('Y', 'N')),
 CONSTRAINT BE_MEMBER_ROLE_CHK CHECK(BE_ROLE IN('L1', 'L2', 'L3', 'ADM'))
);

INSERT INTO BE_MEMBER VALUES(
M_NOSEQ.NEXTVAL, 'thal00','1234','감자','박소미','서울시 송파구','010-1111-3333','pth00@naver.com','Y','ADM');

INSERT INTO BE_MEMBER VALUES(
M_NOSEQ.NEXTVAL, 'tjwjd00','1234','순두부','문서정','경기도 광명시','010-3553-5555','moon00@naver.com','Y','ADM');

INSERT INTO BE_MEMBER VALUES(
M_NOSEQ.NEXTVAL, 'tmddnjs77','1234','키위','채승원','경기도 남양주시','010-6666-7777','cccww11@naver.com','Y','L3');

INSERT INTO BE_MEMBER VALUES(
M_NOSEQ.NEXTVAL, 'wngus99','1234','김밥','김주현','경기도 성남시','010-8888-6666','wn99@naver.com','Y','L2');

INSERT INTO BE_MEMBER VALUES(
M_NOSEQ.NEXTVAL, 'tjdtn44','1234','옥수수','민성수','경기도 성남시','010-1111-9999','ssuu1919@naver.com','Y','L1');

INSERT INTO BE_MEMBER VALUES(
M_NOSEQ.NEXTVAL, 'wjddn99','1234','수박','최정우','경기도 안양시','010-1234-7777','jwooo00@naver.com',default,default);

update be_member
set be_enabled='Y';

SELECT * FROM BE_MEMBER;

commit;
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

INSERT INTO BE_FRIEND VALUES(
FLIST_SEQ.NEXTVAL, 'tmddnjs77', 'tjwjd00');

SELECT * FROM BE_FRIEND ORDER BY M1;

DELETE FROM BE_FRIEND WHERE M1='tmddnjs77' AND M2='wjddn99';

SELECT BE_ID, BE_NN, BE_ROLE
FROM BE_MEMBER
WHERE BE_ID IN (SELECT M2 FROM BE_FRIEND WHERE M1='tmddnjs77');

commit;

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
 ON DELETE CASCADE
);

INSERT INTO BE_MSG VALUES(
MSG_SEQ.NEXTVAL, 1, '첫 쪽지입니다. 어떠세요?', DEFAULT);

INSERT INTO BE_MSG VALUES(
MSG_SEQ.NEXTVAL, 1, '두번째 쪽지입니다. 어떠세요?', DEFAULT);

INSERT INTO BE_MSG VALUES(
MSG_SEQ.NEXTVAL, 4, '쪽지입니다', DEFAULT);

SELECT * FROM BE_MSG;

SELECT  MSG_CONTENT, MSG_DATE FROM BE_MSG WHERE  FLIST_NO=1;
SELECT  MSG_CONTENT, MSG_DATE FROM BE_MSG WHERE  FLIST_NO=(SELECT FLIST_NO FROM BE_FRIEND WHERE m1='tmddnjs77' and m2='wjddn99');

SELECT b.FLIST_NO, a.M1, a.M2, b.MSG_CONTENT, b.MSG_DATE 
FROM be_friend a, be_msg b
WHERE a.flist_no = b.flist_no;

--all
SELECT a.M1, a.M2, b.MSG_CONTENT, b.MSG_DATE 
FROM be_friend a, be_msg b
WHERE a.flist_no = b.flist_no;

SELECT FLIST_NO FROM BE_FRIEND WHERE M1='tmddnjs77' AND M2='wjddn99';

INSERT INTO BE_MSG VALUES(
MSG_SEQ.NEXTVAL, (SELECT FLIST_NO FROM BE_FRIEND WHERE M1='tmddnjs77' AND M2='wjddn99'), '조인 후 쪽지', SYSDATE);

commit;
-------------------
DROP SEQUENCE NOTICEBD_SEQ;
DROP TABLE NOTICEBOARD CASCADE CONSTRAINTS;

--공지사항 번호 시퀀스
CREATE SEQUENCE NOTICEBD_SEQ NOCACHE;

--관리자 공지사항 테이블
CREATE TABLE NOTICEBOARD(
    BD_NO NUMBER PRIMARY KEY,
    BD_NN VARCHAR2(100) NOT NULL,
    BD_TITLE VARCHAR2(100) NOT NULL,
    BD_CONTENT VARCHAR2(1000) NOT NULL,
    BD_DATE DATE DEFAULT SYSDATE NOT NULL,
    
    CONSTRAINT NOTICEBD_FK_NN FOREIGN KEY(BD_NN) REFERENCES BE_MEMBER(BE_NN)
);

INSERT INTO NOTICEBOARD VALUES(
NOTICEBD_SEQ.NEXTVAL, '감자', '안녕하세요 북이온앤온입니다', '북이온앤온 프로젝트의 마감이 곧이네요', SYSDATE);

INSERT INTO NOTICEBOARD VALUES(
NOTICEBD_SEQ.NEXTVAL, '감자', '북이온앤온 서비스 준비 중', '서비스 준비 중입니다', SYSDATE);


SELECT * FROM noticeboard;

--------
DROP SEQUENCE R_NOSEQ ;
DROP TABLE R_BOOK CASCADE CONSTRAINTS;

--읽은 책 서재 번호 시퀀스
CREATE SEQUENCE R_NOSEQ NOCACHE;

--읽은 책 서재 테이블
CREATE TABLE R_BOOK(
 R_NO NUMBER NOT NULL,
 BE_NO NUMBER NOT NULL,
 B_TITLE VARCHAR2(1000) NOT NULL,
 B_AUTHOR VARCHAR2(1000) NOT NULL,
 B_COVER VARCHAR2(1000) NOT NULL,
 ADDDATE DATE DEFAULT SYSDATE,
 
 CONSTRAINT R_BOOK_PK PRIMARY KEY(R_NO),
 CONSTRAINT R_BOOK_FK FOREIGN KEY(BE_NO) REFERENCES BE_MEMBER(BE_NO)
 );

INSERT INTO R_BOOK
VALUES(R_NOSEQ.NEXTVAL,6,'침묵의 봄 - 개정판', '레이첼 카슨', 'https://image.aladin.co.kr/product/1446/13/cover150/k192531425_2.jpg', sysdate);


INSERT INTO R_BOOK
VALUES(R_NOSEQ.NEXTVAL,6,'인간 실격','다자이 오사무', 'https://image.aladin.co.kr/product/49/16/cover150/893746103x_3.jpg', sysdate); 


INSERT INTO R_BOOK
VALUES(R_NOSEQ.NEXTVAL, 6, '동물농장', '조지 오웰','https://image.aladin.co.kr/product/4/6/cover150/s893746005x_1.jpg', SYSDATE);

INSERT INTO R_BOOK
VALUES(R_NOSEQ.NEXTVAL, 6, '멋진 신세계', '올더스 헉슬리', 'https://image.aladin.co.kr/product/6083/61/cover150/8973814729_2.jpg', SYSDATE);

INSERT INTO R_BOOK
VALUES(R_NOSEQ.NEXTVAL, 6, '페스트', '알베르 카뮈','https://image.aladin.co.kr/product/1126/73/cover150/s8937462672_1.jpg',SYSDATE);

INSERT INTO R_BOOK
VALUES(R_NOSEQ.NEXTVAL, 6, '돈키호테 1~2 (리커버 특별판 + 박스 세트) - 전2권', '미겔 데 세르반테스 사아베드라', 'https://image.aladin.co.kr/product/26057/74/cover150/k312737053_1.jpg', SYSDATE);

INSERT INTO R_BOOK
VALUES(R_NOSEQ.NEXTVAL, 6, '이상한 나라의 앨리스 (디즈니 애니메이션 70주년 특별 에디션)', '루이스 캐럴','https://image.aladin.co.kr/product/26817/67/cover150/k882730197_1.jpg',SYSDATE);

INSERT INTO R_BOOK
VALUES(R_NOSEQ.NEXTVAL, 6, '데미안', '헤르만 헤세','https://image.aladin.co.kr/product/26/0/cover150/s742633278_1.jpg',SYSDATE);

INSERT INTO R_BOOK
VALUES(R_NOSEQ.NEXTVAL, 6, '사랑의 기술', '에리히 프롬','https://image.aladin.co.kr/product/20329/93/cover150/8931011628_1.jpg',  SYSDATE);

INSERT INTO R_BOOK
VALUES(R_NOSEQ.NEXTVAL, 6, '어린 왕자', '앙투안 드 생텍쥐페리','https://image.aladin.co.kr/product/26963/90/cover150/8964361946_1.jpg', SYSDATE);

SELECT * FROM R_BOOK;

SELECT 
     TO_CHAR(ADDDATE,'MM'),
     COUNT(*)
FROM R_BOOK
WHERE ADDDATE >= '210101' AND ADDDATE < '211230'
GROUP BY TO_CHAR(ADDDATE,'MM')
ORDER BY TO_CHAR(ADDDATE,'MM');

-----------
DROP SEQUENCE W_NOSEQ;
DROP TABLE W_BOOK;

CREATE SEQUENCE W_NOSEQ NOCACHE;

--읽고 싶은 책 서재 테이블
CREATE TABLE W_BOOK(
 W_NO NUMBER NOT NULL,
 BE_NO NUMBER NOT NULL,
 B_TITLE VARCHAR2(1000) NOT NULL,
 B_AUTHOR VARCHAR2(1000) NOT NULL,
 B_COVER VARCHAR2(1000) NOT NULL,
 ADDDATE DATE,
 UNIQUE(BE_NO, B_TITLE),
 
 CONSTRAINT W_BOOK_PK PRIMARY KEY(W_NO),
 CONSTRAINT W_BOOK_FK FOREIGN KEY(BE_NO) REFERENCES BE_MEMBER(BE_NO)
 );
 
 SELECT * FROM W_BOOK;

-----------
DROP TABLE BOOKSTATS CASCADE CONSTRAINTS;

--목표 테이블
CREATE TABLE BOOKSTATS(
 R_NO NUMBER NOT NULL,
 BE_NO NUMBER NOT NULL,
 TARGET NUMBER NOT NULL,
 YEAR VARCHAR2(100) NOT NULL,

 CONSTRAINT BE_NO_FK FOREIGN KEY(BE_NO) REFERENCES BE_MEMBER(BE_NO)
);

SELECT * FROM BOOKSTATS;

INSERT INTO bookstats VALUES(1,1, 50, 2020);
INSERT INTO bookstats VALUES(1,1, 30, 2021);
INSERT INTO bookstats VALUES(3,3, 20, 2020);


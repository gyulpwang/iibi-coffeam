-- 자유게시판
ALTER TABLE FREEBOARD
	DROP CONSTRAINT FK_MEMBER_TO_FREEBOARD; -- 회원 -> 자유게시판

-- 자유게시판
ALTER TABLE FREEBOARD
	DROP CONSTRAINT PK_FREEBOARD; -- 자유게시판 기본키

-- 자유게시판
DROP TABLE FREEBOARD;

-- 자유게시판
CREATE TABLE FREEBOARD (
	num      NUMBER(8)      NOT NULL, -- 글번호
	idx      NUMBER(8)      NOT NULL, -- 회원번호
	title    VARCHAR2(50)   NULL,     -- 제목
	contents VARCHAR2(3000) NULL,     -- 내용
	writer   VARCHAR2(30)   NULL,     -- 작성자
	upfile   VARCHAR2(100)  NULL,     -- 업로드파일
	wdate    DATE           NULL,     -- 작성일
	cnt      NUMBER(10)     NULL      -- 조회수
);

-- 자유게시판 기본키
CREATE UNIQUE INDEX PK_FREEBOARD
	ON FREEBOARD ( -- 자유게시판
		num ASC -- 글번호
	);

-- 자유게시판
ALTER TABLE FREEBOARD
	ADD
		CONSTRAINT PK_FREEBOARD -- 자유게시판 기본키
		PRIMARY KEY (
			num -- 글번호
		);

-- 자유게시판
ALTER TABLE FREEBOARD
	ADD
		CONSTRAINT FK_MEMBER_TO_FREEBOARD -- 회원 -> 자유게시판
		FOREIGN KEY (
			idx -- 회원번호
		)
		REFERENCES MEMBER ( -- 회원
			idx -- 회원번호
		);

-- 자유게시판 글번호 시퀀스 생성
DROP SEQUENCE FB_NUM_SEQ;

CREATE SEQUENCE FB_NUM_SEQ
START WITH 1
INCREMENT BY 1
NOCACHE;

select * from freeboard;
commit;
insert into freeboard(num, idx, title, contents, writer, wdate, cnt)
values(1, 4, '첫번째 자유게시글', '야호 내가 1등이다! - 4등의 기쁨', 'fourth', sysdate, 4);
insert into freeboard(num, idx, title, contents, writer, wdate, cnt)
values(FB_NUM_SEQ.nextval, 4, '두번째 자유게시글', '야호 내가 2등이다! - 4등의 기쁨', 'fourth', sysdate, 3);
insert into freeboard(num, idx, title, contents, writer, wdate, cnt)
values(FB_NUM_SEQ.nextval, 4, '세번째 자유게시글', '이히 내가 3등이다! - 4등의 기쁨', 'fourth', sysdate, 7);
insert into freeboard(num, idx, title, contents, writer, wdate, cnt)
values(FB_NUM_SEQ.nextval, 4, '네번째 자유게시글', '이히 내가 4등이다! - 4등의 기쁨', 'fourth', sysdate, 3);
insert into freeboard(num, idx, title, contents, writer, wdate, cnt)
values(FB_NUM_SEQ.nextval, 4, '다섯번째 자유게시글', '유후 내가 5등이다! - 4등의 기쁨', 'fourth', sysdate, 2);
insert into freeboard(num, idx, title, contents, writer, wdate, cnt)
values(FB_NUM_SEQ.nextval, 4, '여섯번째 자유게시글', '유후 내가 6등이다! - 4등의 기쁨', 'fourth', sysdate, 9);
insert into freeboard(num, idx, title, contents, writer, wdate, cnt)
values(FB_NUM_SEQ.nextval, 4, '일곱번째 자유게시글', '예헤 내가 7등이다! - 4등의 기쁨', 'fourth', sysdate, 6);
insert into freeboard(num, idx, title, contents, writer, wdate, cnt)
values(FB_NUM_SEQ.nextval, 4, '여덟번째 자유게시글', '예헤 내가 8등이다! - 4등의 기쁨', 'fourth', sysdate, 8);

select * from(
select row_number() over(order by num desc) rn, freeboard.*
from freeboard)
where rn between 1 and 5;

commit;
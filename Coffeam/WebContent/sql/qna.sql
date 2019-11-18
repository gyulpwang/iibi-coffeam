-- 문의사항 게시판
ALTER TABLE QnA
	DROP CONSTRAINT FK_MEMBER_TO_QnA; -- 회원 -> 문의사항 게시판

-- 문의사항 게시판
ALTER TABLE QnA
	DROP CONSTRAINT FK_ADMIN_TO_QnA; -- 관리자 -> 문의사항 게시판

-- 문의사항 게시판
ALTER TABLE QnA
	DROP CONSTRAINT PK_QnA; -- 문의사항 게시판 기본키

-- 문의사항 게시판
DROP TABLE QnA;

-- 문의사항 게시판
CREATE TABLE QnA (
	num      NUMBER(10)     NOT NULL, -- 글번호
	idx      NUMBER(8)      NOT NULL, -- 회원번호
	title    VARCHAR2(50)   NULL,     -- 제목
	writer   VARCHAR2(30)   NOT NULL, -- 작성자
	contents VARCHAR2(3000) NULL,     -- 내용
	wdate    DATE           NULL,     -- 등록일
	adminNo  NUMBER(2)      NULL,     -- 관리자번호
	yn       CHAR(2)        default 'n',     -- 답변여부
	answer   VARCHAR2(3000) NULL,     -- 답변
	answerer VARCHAR2(30)   NULL      -- 답변인
);

-- 문의사항 게시판 기본키
CREATE UNIQUE INDEX PK_QnA
	ON QnA ( -- 문의사항 게시판
		num ASC -- 글번호
	);

-- 문의사항 게시판
ALTER TABLE QnA
	ADD
		CONSTRAINT PK_QnA -- 문의사항 게시판 기본키
		PRIMARY KEY (
			num -- 글번호
		);

-- 문의사항 게시판
ALTER TABLE QnA
	ADD
		CONSTRAINT FK_MEMBER_TO_QnA -- 회원 -> 문의사항 게시판
		FOREIGN KEY (
			idx -- 회원번호
		)
		REFERENCES MEMBER ( -- 회원
			idx -- 회원번호
		);

-- 문의사항 게시판
ALTER TABLE QnA
	ADD
		CONSTRAINT FK_ADMIN_TO_QnA -- 관리자 -> 문의사항 게시판
		FOREIGN KEY (
			adminNo -- 관리자번호
		)
		REFERENCES ADMIN ( -- 관리자
			adminNo -- 관리자번호
		);
		
-- 문의사항번호 시퀀스
drop sequence qna_num_seq;

CREATE SEQUENCE qna_num_SEQ
START WITH 1
INCREMENT BY 1
NOCACHE;

insert into qna(num, idx, title, writer, contents, wdate)
values(qna_num_seq.nextval, 4, '질문1', '네번째', '내용1', sysdate);
insert into qna(num, idx, title, writer, contents, wdate)
values(qna_num_seq.nextval, 4, '질문2', '네번째', '내용2', sysdate);
insert into qna(num, idx, title, writer, contents, wdate)
values(qna_num_seq.nextval, 4, '질문3', '네번째', '내용3', sysdate);
insert into qna(num, idx, title, writer, contents, wdate)
values(qna_num_seq.nextval, 4, '질문4', '네번째', '내용4', sysdate);
insert into qna(num, idx, title, writer, contents, wdate)
values(qna_num_seq.nextval, 4, '질문5', '네번째', '내용5', sysdate);
insert into qna(num, idx, title, writer, contents, wdate)
values(qna_num_seq.nextval, 4, '질문6', '네번째', '내용6', sysdate);
insert into qna(num, idx, title, writer, contents, wdate)
values(qna_num_seq.nextval, 4, '질문7', '네번째', '내용7', sysdate);
insert into qna(num, idx, title, writer, contents, wdate)
values(qna_num_seq.nextval, 4, '질문8', '네번째', '내용8', sysdate);
insert into qna(num, idx, title, writer, contents, wdate)
values(qna_num_seq.nextval, 4, '질문9', '네번째', '내용9', sysdate);
insert into qna(num, idx, title, writer, contents, wdate)
values(qna_num_seq.nextval, 4, '질문10', '네번째', '내용10', sysdate);
insert into qna(num, idx, title, writer, contents, wdate)
values(qna_num_seq.nextval, 5, '질문11', '다섯째', '내용1', sysdate);
insert into qna(num, idx, title, writer, contents, wdate)
values(qna_num_seq.nextval, 5, '질문12', '다섯째', '내용2', sysdate);
insert into qna(num, idx, title, writer, contents, wdate)
values(qna_num_seq.nextval, 5, '질문13', '다섯째', '내용3', sysdate);
insert into qna(num, idx, title, writer, contents, wdate)
values(qna_num_seq.nextval, 5, '질문14', '다섯째', '내용4', sysdate);
insert into qna(num, idx, title, writer, contents, wdate)
values(qna_num_seq.nextval, 5, '질문15', '다섯째', '내용5', sysdate);
insert into qna(num, idx, title, writer, contents, wdate)
values(qna_num_seq.nextval, 5, '질문16', '다섯째', '내용6', sysdate);
insert into qna(num, idx, title, writer, contents, wdate)
values(qna_num_seq.nextval, 5, '질문17', '다섯째', '내용7', sysdate);
insert into qna(num, idx, title, writer, contents, wdate)
values(qna_num_seq.nextval, 5, '질문18', '다섯째', '내용8', sysdate);
insert into qna(num, idx, title, writer, contents, wdate)
values(qna_num_seq.nextval, 5, '질문19', '다섯째', '내용9', sysdate);
insert into qna(num, idx, title, writer, contents, wdate)
values(qna_num_seq.nextval, 5, '질문20', '다섯째', '내용10', sysdate);


select * from qna;
commit;
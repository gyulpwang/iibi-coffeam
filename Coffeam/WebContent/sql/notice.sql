-- 공지사항
ALTER TABLE NOTICE
	DROP CONSTRAINT FK_ADMIN_TO_NOTICE; -- 관리자 -> 공지사항

-- 공지사항
ALTER TABLE NOTICE
	DROP CONSTRAINT PK_NOTICE; -- 공지사항 기본키

-- 공지사항
DROP TABLE NOTICE;

-- 공지사항
CREATE TABLE NOTICE (
	num      NUMBER(10)     NOT NULL, -- 공지번호
	adminNo  NUMBER(2)      NULL,     -- 관리자번호
	writer   VARCHAR2(30)   NULL,     -- 작성자
	wdate    DATE           default sysdate,     -- 작성일
	title    VARCHAR2(50)   default '제목없음',     -- 공지제목
	contents VARCHAR2(3000) default '내용없음',     -- 공지내용
	upfile   VARCHAR2(100)  NULL      -- 첨부파일
);

-- 공지사항 기본키
CREATE UNIQUE INDEX PK_NOTICE
	ON NOTICE ( -- 공지사항
		num ASC -- 공지번호
	);

-- 공지사항
ALTER TABLE NOTICE
	ADD
		CONSTRAINT PK_NOTICE -- 공지사항 기본키
		PRIMARY KEY (
			num -- 공지번호
		);

-- 공지사항
ALTER TABLE NOTICE
	ADD
		CONSTRAINT FK_ADMIN_TO_NOTICE -- 관리자 -> 공지사항
		FOREIGN KEY (
			adminNo -- 관리자번호
		)
		REFERENCES ADMIN ( -- 관리자
			adminNo -- 관리자번호
		);
		
-- 공지사항번호 시퀀스
drop sequence notice_num_seq;

CREATE SEQUENCE notice_num_SEQ
START WITH 1
INCREMENT BY 1
NOCACHE;

insert into notice(num, adminNo, writer, wdate, title, contents)
values(notice_num_SEQ.nextval, 1, '관리자', sysdate, '커핌에 오신 모든 분들을 진심으로 환영합니다!',
'커핌을 방문해주신 모든 고객들을 진심으로 환영합니다. 항상 고객의 입장에서 
최선을 다하겠습니다. 많은 관심과 사랑 부탁드립니다. 감사합니다.'
);

insert into notice(num, adminNo, writer, wdate, title, contents)
values(notice_num_SEQ.nextval, 1, '관리자', sysdate, '커핌 사이트에서 제공하는 카페 정보', 
'커핌에서 제공하는 카페의 정보는 다음과 같습니다. 
1. 투썸플레이스, 2. 빈브라더스, 3. 카페베네, 4. 커피빈, 5. 드롭탑, 6. 이디야,
7. 할리스, 8. 빽다방, 9. 파스쿠찌, 10. 스타벅스, 11. 더착한커피, 12. 탐앤탐스. 
이상입니다. 고객 여러분은 이용에 참고하시어 불편이 없으시길 바랍니다.');

insert into notice(num, adminNo, writer, wdate, title, contents)
values(notice_num_SEQ.nextval, 1, '관리자', sysdate, '공지3공지3공지3', '아아 더이상 할말이 없는뒈에 공지 쓰기는 너무나 어렵군요오~~');

insert into notice(num, adminNo, writer, wdate, title, contents)
values(notice_num_SEQ.nextval, 1, '관리자', sysdate, '애국가', '동해물과 백두산이 마르고 닳도록 하느님이 보우하사 우리나라 만세 무궁화 삼천리 화려강산 대한사람 대한으로 길이 보전하세');

insert into notice(num, adminNo, writer, wdate, title, contents)
values(notice_num_SEQ.nextval, 1, '관리자', sysdate, '동요 나비야', '나비야 나비야 이리날아 오너라 호랑나비 흰나비 춤을 추며 오너라');

insert into notice(num, adminNo, writer, wdate, title, contents)
values(notice_num_SEQ.nextval, 1, '관리자', sysdate, '커핌에 오신 모든 분들을 진심으로 환영합니다!',
'커핌을 방문해주신 모든 고객들을 진심으로 환영합니다. 항상 고객의 입장에서 
최선을 다하겠습니다. 많은 관심과 사랑 부탁드립니다. 감사합니다.'
);

insert into notice(num, adminNo, writer, wdate, title, contents)
values(notice_num_SEQ.nextval, 1, '관리자', sysdate, '커핌 사이트에서 제공하는 카페 정보', 
'커핌에서 제공하는 카페의 정보는 다음과 같습니다. 
1. 투썸플레이스, 2. 빈브라더스, 3. 카페베네, 4. 커피빈, 5. 드롭탑, 6. 이디야,
7. 할리스, 8. 빽다방, 9. 파스쿠찌, 10. 스타벅스, 11. 더착한커피, 12. 탐앤탐스. 
이상입니다. 고객 여러분은 이용에 참고하시어 불편이 없으시길 바랍니다.');

insert into notice(num, adminNo, writer, wdate, title, contents)
values(notice_num_SEQ.nextval, 1, '관리자', sysdate, '공지3공지3공지3', '아아 더이상 할말이 없는뒈에 공지 쓰기는 너무나 어렵군요오~~');

insert into notice(num, adminNo, writer, wdate, title, contents)
values(notice_num_SEQ.nextval, 1, '관리자', sysdate, '애국가', '동해물과 백두산이 마르고 닳도록 하느님이 보우하사 우리나라 만세 무궁화 삼천리 화려강산 대한사람 대한으로 길이 보전하세');

insert into notice(num, adminNo, writer, wdate, title, contents)
values(notice_num_SEQ.nextval, 1, '관리자', sysdate, '동요 나비야', '나비야 나비야 이리날아 오너라 호랑나비 흰나비 춤을 추며 오너라');

alter table notice add upfile varchar2(50);
commit;
select * from notice;
-- 회원
ALTER TABLE MEMBER
	DROP CONSTRAINT PK_MEMBER; -- 회원 기본키

-- 회원
DROP TABLE MEMBER;

-- 회원
CREATE TABLE MEMBER (
	idx      NUMBER(8)     NOT NULL, -- 회원번호
	name     VARCHAR2(30)  NOT NULL, -- 이름
	userid   VARCHAR2(20)  NOT NULL, -- 아이디
	email    VARCHAR2(100) NULL,     -- 이메일
	pwd      VARCHAR2(18)  NOT NULL, -- 비밀번호
	hp1      CHAR(3)       NOT NULL, -- 연락처1
	hp2      CHAR(4)       NOT NULL, -- 연락처2
	hp3      CHAR(4)       NOT NULL, -- 연락처3
	indate   DATE          NULL,     -- 가입일
	favorite VARCHAR2(20)  NULL,     -- 선호메뉴
	mileage  NUMBER(10)    NULL      -- 적립금
);

-- 회원 기본키
CREATE UNIQUE INDEX PK_MEMBER
	ON MEMBER ( -- 회원
		idx ASC -- 회원번호
	);

-- 회원
ALTER TABLE MEMBER
	ADD
		CONSTRAINT PK_MEMBER -- 회원 기본키
		PRIMARY KEY (
			idx -- 회원번호
		);
		
-- 회원 번호 관련 시퀀스 생성
-- 현재는 mebme_mebmer_seq로 되어있음. 다음부터는 다른 컴퓨터들에선 num으로 생성
DROP SEQUENCE MEMBER_NUM_SEQ;

CREATE SEQUENCE MEMBER_NUM_SEQ
START WITH 1
INCREMENT BY 1
NOCACHE;
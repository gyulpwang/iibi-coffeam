-- 장바구니
ALTER TABLE BASKET
	DROP CONSTRAINT FK_MEMBER_TO_BASKET; -- 회원 -> 장바구니

-- 장바구니
ALTER TABLE BASKET
	DROP CONSTRAINT FK_DRINK_TO_BASKET; -- 상품 -> 장바구니

-- 장바구니
ALTER TABLE BASKET
	DROP CONSTRAINT PK_BASKET; -- 장바구니 기본키

-- 장바구니
DROP TABLE BASKET;

-- 장바구니
CREATE TABLE BASKET (
	COL       <데이터 타입 없음> NOT NULL, -- 장바구니번호
	idx       NUMBER(8)          NULL,     -- 회원번호
	drinkCode NUMBER(8)          NULL,     -- 상품코드
	num       NUMBER(10)         NULL      -- 상품수량
);

-- 장바구니 기본키
CREATE UNIQUE INDEX PK_BASKET
	ON BASKET ( -- 장바구니
		COL ASC -- 장바구니번호
	);

-- 장바구니
ALTER TABLE BASKET
	ADD
		CONSTRAINT PK_BASKET -- 장바구니 기본키
		PRIMARY KEY (
			COL -- 장바구니번호
		);

-- 장바구니
ALTER TABLE BASKET
	ADD
		CONSTRAINT FK_MEMBER_TO_BASKET -- 회원 -> 장바구니
		FOREIGN KEY (
			idx -- 회원번호
		)
		REFERENCES MEMBER ( -- 회원
			idx -- 회원번호
		)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION;

-- 장바구니
ALTER TABLE BASKET
	ADD
		CONSTRAINT FK_DRINK_TO_BASKET -- 상품 -> 장바구니
		FOREIGN KEY (
			drinkCode -- 상품코드
		)
		REFERENCES DRINK ( -- 상품
			drinkCode -- 상품코드
		)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION;
		
-- 상품코드 관련 시퀀스 생성
DROP SEQUENCE DRINK_DRINK_SEQ;

CREATE SEQUENCE DRINK_DRINK_SEQ
START WITH 1
INCREMENT BY 1
NOCACHE;
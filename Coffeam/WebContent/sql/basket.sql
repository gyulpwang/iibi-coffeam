-- ��ٱ���
ALTER TABLE BASKET
	DROP CONSTRAINT FK_MEMBER_TO_BASKET; -- ȸ�� -> ��ٱ���

-- ��ٱ���
ALTER TABLE BASKET
	DROP CONSTRAINT FK_DRINK_TO_BASKET; -- ��ǰ -> ��ٱ���

-- ��ٱ���
ALTER TABLE BASKET
	DROP CONSTRAINT PK_BASKET; -- ��ٱ��� �⺻Ű

-- ��ٱ���
DROP TABLE BASKET;

-- ��ٱ���
CREATE TABLE BASKET (
	COL       <������ Ÿ�� ����> NOT NULL, -- ��ٱ��Ϲ�ȣ
	idx       NUMBER(8)          NULL,     -- ȸ����ȣ
	drinkCode NUMBER(8)          NULL,     -- ��ǰ�ڵ�
	num       NUMBER(10)         NULL      -- ��ǰ����
);

-- ��ٱ��� �⺻Ű
CREATE UNIQUE INDEX PK_BASKET
	ON BASKET ( -- ��ٱ���
		COL ASC -- ��ٱ��Ϲ�ȣ
	);

-- ��ٱ���
ALTER TABLE BASKET
	ADD
		CONSTRAINT PK_BASKET -- ��ٱ��� �⺻Ű
		PRIMARY KEY (
			COL -- ��ٱ��Ϲ�ȣ
		);

-- ��ٱ���
ALTER TABLE BASKET
	ADD
		CONSTRAINT FK_MEMBER_TO_BASKET -- ȸ�� -> ��ٱ���
		FOREIGN KEY (
			idx -- ȸ����ȣ
		)
		REFERENCES MEMBER ( -- ȸ��
			idx -- ȸ����ȣ
		)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION;

-- ��ٱ���
ALTER TABLE BASKET
	ADD
		CONSTRAINT FK_DRINK_TO_BASKET -- ��ǰ -> ��ٱ���
		FOREIGN KEY (
			drinkCode -- ��ǰ�ڵ�
		)
		REFERENCES DRINK ( -- ��ǰ
			drinkCode -- ��ǰ�ڵ�
		)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION;
		
-- ��ǰ�ڵ� ���� ������ ����
DROP SEQUENCE DRINK_DRINK_SEQ;

CREATE SEQUENCE DRINK_DRINK_SEQ
START WITH 1
INCREMENT BY 1
NOCACHE;
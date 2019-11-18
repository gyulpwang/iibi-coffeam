-- ȸ��
ALTER TABLE MEMBER
	DROP CONSTRAINT PK_MEMBER; -- ȸ�� �⺻Ű

-- ȸ��
DROP TABLE MEMBER;

-- ȸ��
CREATE TABLE MEMBER (
	idx      NUMBER(8)     NOT NULL, -- ȸ����ȣ
	name     VARCHAR2(30)  NOT NULL, -- �̸�
	userid   VARCHAR2(20)  NOT NULL, -- ���̵�
	email    VARCHAR2(100) NULL,     -- �̸���
	pwd      VARCHAR2(18)  NOT NULL, -- ��й�ȣ
	hp1      CHAR(3)       NOT NULL, -- ����ó1
	hp2      CHAR(4)       NOT NULL, -- ����ó2
	hp3      CHAR(4)       NOT NULL, -- ����ó3
	indate   DATE          NULL,     -- ������
	favorite VARCHAR2(20)  NULL,     -- ��ȣ�޴�
	mileage  NUMBER(10)    NULL      -- ������
);

-- ȸ�� �⺻Ű
CREATE UNIQUE INDEX PK_MEMBER
	ON MEMBER ( -- ȸ��
		idx ASC -- ȸ����ȣ
	);

-- ȸ��
ALTER TABLE MEMBER
	ADD
		CONSTRAINT PK_MEMBER -- ȸ�� �⺻Ű
		PRIMARY KEY (
			idx -- ȸ����ȣ
		);
		
-- ȸ�� ��ȣ ���� ������ ����
-- ����� mebme_mebmer_seq�� �Ǿ�����. �������ʹ� �ٸ� ��ǻ�͵鿡�� num���� ����
DROP SEQUENCE MEMBER_NUM_SEQ;

CREATE SEQUENCE MEMBER_NUM_SEQ
START WITH 1
INCREMENT BY 1
NOCACHE;
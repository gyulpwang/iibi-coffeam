-- �����Խ���
ALTER TABLE FREEBOARD
	DROP CONSTRAINT FK_MEMBER_TO_FREEBOARD; -- ȸ�� -> �����Խ���

-- �����Խ���
ALTER TABLE FREEBOARD
	DROP CONSTRAINT PK_FREEBOARD; -- �����Խ��� �⺻Ű

-- �����Խ���
DROP TABLE FREEBOARD;

-- �����Խ���
CREATE TABLE FREEBOARD (
	num      NUMBER(8)      NOT NULL, -- �۹�ȣ
	idx      NUMBER(8)      NOT NULL, -- ȸ����ȣ
	title    VARCHAR2(50)   NULL,     -- ����
	contents VARCHAR2(3000) NULL,     -- ����
	writer   VARCHAR2(30)   NULL,     -- �ۼ���
	upfile   VARCHAR2(100)  NULL,     -- ���ε�����
	wdate    DATE           NULL,     -- �ۼ���
	cnt      NUMBER(10)     NULL      -- ��ȸ��
);

-- �����Խ��� �⺻Ű
CREATE UNIQUE INDEX PK_FREEBOARD
	ON FREEBOARD ( -- �����Խ���
		num ASC -- �۹�ȣ
	);

-- �����Խ���
ALTER TABLE FREEBOARD
	ADD
		CONSTRAINT PK_FREEBOARD -- �����Խ��� �⺻Ű
		PRIMARY KEY (
			num -- �۹�ȣ
		);

-- �����Խ���
ALTER TABLE FREEBOARD
	ADD
		CONSTRAINT FK_MEMBER_TO_FREEBOARD -- ȸ�� -> �����Խ���
		FOREIGN KEY (
			idx -- ȸ����ȣ
		)
		REFERENCES MEMBER ( -- ȸ��
			idx -- ȸ����ȣ
		);

-- �����Խ��� �۹�ȣ ������ ����
DROP SEQUENCE FB_NUM_SEQ;

CREATE SEQUENCE FB_NUM_SEQ
START WITH 1
INCREMENT BY 1
NOCACHE;

select * from freeboard;
commit;
insert into freeboard(num, idx, title, contents, writer, wdate, cnt)
values(1, 4, 'ù��° �����Խñ�', '��ȣ ���� 1���̴�! - 4���� ���', 'fourth', sysdate, 4);
insert into freeboard(num, idx, title, contents, writer, wdate, cnt)
values(FB_NUM_SEQ.nextval, 4, '�ι�° �����Խñ�', '��ȣ ���� 2���̴�! - 4���� ���', 'fourth', sysdate, 3);
insert into freeboard(num, idx, title, contents, writer, wdate, cnt)
values(FB_NUM_SEQ.nextval, 4, '����° �����Խñ�', '���� ���� 3���̴�! - 4���� ���', 'fourth', sysdate, 7);
insert into freeboard(num, idx, title, contents, writer, wdate, cnt)
values(FB_NUM_SEQ.nextval, 4, '�׹�° �����Խñ�', '���� ���� 4���̴�! - 4���� ���', 'fourth', sysdate, 3);
insert into freeboard(num, idx, title, contents, writer, wdate, cnt)
values(FB_NUM_SEQ.nextval, 4, '�ټ���° �����Խñ�', '���� ���� 5���̴�! - 4���� ���', 'fourth', sysdate, 2);
insert into freeboard(num, idx, title, contents, writer, wdate, cnt)
values(FB_NUM_SEQ.nextval, 4, '������° �����Խñ�', '���� ���� 6���̴�! - 4���� ���', 'fourth', sysdate, 9);
insert into freeboard(num, idx, title, contents, writer, wdate, cnt)
values(FB_NUM_SEQ.nextval, 4, '�ϰ���° �����Խñ�', '���� ���� 7���̴�! - 4���� ���', 'fourth', sysdate, 6);
insert into freeboard(num, idx, title, contents, writer, wdate, cnt)
values(FB_NUM_SEQ.nextval, 4, '������° �����Խñ�', '���� ���� 8���̴�! - 4���� ���', 'fourth', sysdate, 8);

select * from(
select row_number() over(order by num desc) rn, freeboard.*
from freeboard)
where rn between 1 and 5;

commit;
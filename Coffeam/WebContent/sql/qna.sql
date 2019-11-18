-- ���ǻ��� �Խ���
ALTER TABLE QnA
	DROP CONSTRAINT FK_MEMBER_TO_QnA; -- ȸ�� -> ���ǻ��� �Խ���

-- ���ǻ��� �Խ���
ALTER TABLE QnA
	DROP CONSTRAINT FK_ADMIN_TO_QnA; -- ������ -> ���ǻ��� �Խ���

-- ���ǻ��� �Խ���
ALTER TABLE QnA
	DROP CONSTRAINT PK_QnA; -- ���ǻ��� �Խ��� �⺻Ű

-- ���ǻ��� �Խ���
DROP TABLE QnA;

-- ���ǻ��� �Խ���
CREATE TABLE QnA (
	num      NUMBER(10)     NOT NULL, -- �۹�ȣ
	idx      NUMBER(8)      NOT NULL, -- ȸ����ȣ
	title    VARCHAR2(50)   NULL,     -- ����
	writer   VARCHAR2(30)   NOT NULL, -- �ۼ���
	contents VARCHAR2(3000) NULL,     -- ����
	wdate    DATE           NULL,     -- �����
	adminNo  NUMBER(2)      NULL,     -- �����ڹ�ȣ
	yn       CHAR(2)        default 'n',     -- �亯����
	answer   VARCHAR2(3000) NULL,     -- �亯
	answerer VARCHAR2(30)   NULL      -- �亯��
);

-- ���ǻ��� �Խ��� �⺻Ű
CREATE UNIQUE INDEX PK_QnA
	ON QnA ( -- ���ǻ��� �Խ���
		num ASC -- �۹�ȣ
	);

-- ���ǻ��� �Խ���
ALTER TABLE QnA
	ADD
		CONSTRAINT PK_QnA -- ���ǻ��� �Խ��� �⺻Ű
		PRIMARY KEY (
			num -- �۹�ȣ
		);

-- ���ǻ��� �Խ���
ALTER TABLE QnA
	ADD
		CONSTRAINT FK_MEMBER_TO_QnA -- ȸ�� -> ���ǻ��� �Խ���
		FOREIGN KEY (
			idx -- ȸ����ȣ
		)
		REFERENCES MEMBER ( -- ȸ��
			idx -- ȸ����ȣ
		);

-- ���ǻ��� �Խ���
ALTER TABLE QnA
	ADD
		CONSTRAINT FK_ADMIN_TO_QnA -- ������ -> ���ǻ��� �Խ���
		FOREIGN KEY (
			adminNo -- �����ڹ�ȣ
		)
		REFERENCES ADMIN ( -- ������
			adminNo -- �����ڹ�ȣ
		);
		
-- ���ǻ��׹�ȣ ������
drop sequence qna_num_seq;

CREATE SEQUENCE qna_num_SEQ
START WITH 1
INCREMENT BY 1
NOCACHE;

insert into qna(num, idx, title, writer, contents, wdate)
values(qna_num_seq.nextval, 4, '����1', '�׹�°', '����1', sysdate);
insert into qna(num, idx, title, writer, contents, wdate)
values(qna_num_seq.nextval, 4, '����2', '�׹�°', '����2', sysdate);
insert into qna(num, idx, title, writer, contents, wdate)
values(qna_num_seq.nextval, 4, '����3', '�׹�°', '����3', sysdate);
insert into qna(num, idx, title, writer, contents, wdate)
values(qna_num_seq.nextval, 4, '����4', '�׹�°', '����4', sysdate);
insert into qna(num, idx, title, writer, contents, wdate)
values(qna_num_seq.nextval, 4, '����5', '�׹�°', '����5', sysdate);
insert into qna(num, idx, title, writer, contents, wdate)
values(qna_num_seq.nextval, 4, '����6', '�׹�°', '����6', sysdate);
insert into qna(num, idx, title, writer, contents, wdate)
values(qna_num_seq.nextval, 4, '����7', '�׹�°', '����7', sysdate);
insert into qna(num, idx, title, writer, contents, wdate)
values(qna_num_seq.nextval, 4, '����8', '�׹�°', '����8', sysdate);
insert into qna(num, idx, title, writer, contents, wdate)
values(qna_num_seq.nextval, 4, '����9', '�׹�°', '����9', sysdate);
insert into qna(num, idx, title, writer, contents, wdate)
values(qna_num_seq.nextval, 4, '����10', '�׹�°', '����10', sysdate);
insert into qna(num, idx, title, writer, contents, wdate)
values(qna_num_seq.nextval, 5, '����11', '�ټ�°', '����1', sysdate);
insert into qna(num, idx, title, writer, contents, wdate)
values(qna_num_seq.nextval, 5, '����12', '�ټ�°', '����2', sysdate);
insert into qna(num, idx, title, writer, contents, wdate)
values(qna_num_seq.nextval, 5, '����13', '�ټ�°', '����3', sysdate);
insert into qna(num, idx, title, writer, contents, wdate)
values(qna_num_seq.nextval, 5, '����14', '�ټ�°', '����4', sysdate);
insert into qna(num, idx, title, writer, contents, wdate)
values(qna_num_seq.nextval, 5, '����15', '�ټ�°', '����5', sysdate);
insert into qna(num, idx, title, writer, contents, wdate)
values(qna_num_seq.nextval, 5, '����16', '�ټ�°', '����6', sysdate);
insert into qna(num, idx, title, writer, contents, wdate)
values(qna_num_seq.nextval, 5, '����17', '�ټ�°', '����7', sysdate);
insert into qna(num, idx, title, writer, contents, wdate)
values(qna_num_seq.nextval, 5, '����18', '�ټ�°', '����8', sysdate);
insert into qna(num, idx, title, writer, contents, wdate)
values(qna_num_seq.nextval, 5, '����19', '�ټ�°', '����9', sysdate);
insert into qna(num, idx, title, writer, contents, wdate)
values(qna_num_seq.nextval, 5, '����20', '�ټ�°', '����10', sysdate);


select * from qna;
commit;
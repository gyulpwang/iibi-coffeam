-- ��������
ALTER TABLE NOTICE
	DROP CONSTRAINT FK_ADMIN_TO_NOTICE; -- ������ -> ��������

-- ��������
ALTER TABLE NOTICE
	DROP CONSTRAINT PK_NOTICE; -- �������� �⺻Ű

-- ��������
DROP TABLE NOTICE;

-- ��������
CREATE TABLE NOTICE (
	num      NUMBER(10)     NOT NULL, -- ������ȣ
	adminNo  NUMBER(2)      NULL,     -- �����ڹ�ȣ
	writer   VARCHAR2(30)   NULL,     -- �ۼ���
	wdate    DATE           default sysdate,     -- �ۼ���
	title    VARCHAR2(50)   default '�������',     -- ��������
	contents VARCHAR2(3000) default '�������',     -- ��������
	upfile   VARCHAR2(100)  NULL      -- ÷������
);

-- �������� �⺻Ű
CREATE UNIQUE INDEX PK_NOTICE
	ON NOTICE ( -- ��������
		num ASC -- ������ȣ
	);

-- ��������
ALTER TABLE NOTICE
	ADD
		CONSTRAINT PK_NOTICE -- �������� �⺻Ű
		PRIMARY KEY (
			num -- ������ȣ
		);

-- ��������
ALTER TABLE NOTICE
	ADD
		CONSTRAINT FK_ADMIN_TO_NOTICE -- ������ -> ��������
		FOREIGN KEY (
			adminNo -- �����ڹ�ȣ
		)
		REFERENCES ADMIN ( -- ������
			adminNo -- �����ڹ�ȣ
		);
		
-- �������׹�ȣ ������
drop sequence notice_num_seq;

CREATE SEQUENCE notice_num_SEQ
START WITH 1
INCREMENT BY 1
NOCACHE;

insert into notice(num, adminNo, writer, wdate, title, contents)
values(notice_num_SEQ.nextval, 1, '������', sysdate, 'Ŀ�˿� ���� ��� �е��� �������� ȯ���մϴ�!',
'Ŀ���� �湮���ֽ� ��� ������ �������� ȯ���մϴ�. �׻� ���� ���忡�� 
�ּ��� ���ϰڽ��ϴ�. ���� ���ɰ� ��� ��Ź�帳�ϴ�. �����մϴ�.'
);

insert into notice(num, adminNo, writer, wdate, title, contents)
values(notice_num_SEQ.nextval, 1, '������', sysdate, 'Ŀ�� ����Ʈ���� �����ϴ� ī�� ����', 
'Ŀ�˿��� �����ϴ� ī���� ������ ������ �����ϴ�. 
1. �����÷��̽�, 2. �������, 3. ī�亣��, 4. Ŀ�Ǻ�, 5. ���ž, 6. �̵��,
7. �Ҹ���, 8. ���ٹ�, 9. �Ľ�����, 10. ��Ÿ����, 11. ������Ŀ��, 12. Ž��Ž��. 
�̻��Դϴ�. �� �������� �̿뿡 �����Ͻþ� ������ �����ñ� �ٶ��ϴ�.');

insert into notice(num, adminNo, writer, wdate, title, contents)
values(notice_num_SEQ.nextval, 1, '������', sysdate, '����3����3����3', '�ƾ� ���̻� �Ҹ��� ���µؿ� ���� ����� �ʹ��� ��Ʊ����~~');

insert into notice(num, adminNo, writer, wdate, title, contents)
values(notice_num_SEQ.nextval, 1, '������', sysdate, '�ֱ���', '���ع��� ��λ��� ������ �⵵�� �ϴ����� �����ϻ� �츮���� ���� ����ȭ ��õ�� ȭ������ ���ѻ�� �������� ���� �����ϼ�');

insert into notice(num, adminNo, writer, wdate, title, contents)
values(notice_num_SEQ.nextval, 1, '������', sysdate, '���� �����', '����� ����� �̸����� ���ʶ� ȣ������ �򳪺� ���� �߸� ���ʶ�');

insert into notice(num, adminNo, writer, wdate, title, contents)
values(notice_num_SEQ.nextval, 1, '������', sysdate, 'Ŀ�˿� ���� ��� �е��� �������� ȯ���մϴ�!',
'Ŀ���� �湮���ֽ� ��� ������ �������� ȯ���մϴ�. �׻� ���� ���忡�� 
�ּ��� ���ϰڽ��ϴ�. ���� ���ɰ� ��� ��Ź�帳�ϴ�. �����մϴ�.'
);

insert into notice(num, adminNo, writer, wdate, title, contents)
values(notice_num_SEQ.nextval, 1, '������', sysdate, 'Ŀ�� ����Ʈ���� �����ϴ� ī�� ����', 
'Ŀ�˿��� �����ϴ� ī���� ������ ������ �����ϴ�. 
1. �����÷��̽�, 2. �������, 3. ī�亣��, 4. Ŀ�Ǻ�, 5. ���ž, 6. �̵��,
7. �Ҹ���, 8. ���ٹ�, 9. �Ľ�����, 10. ��Ÿ����, 11. ������Ŀ��, 12. Ž��Ž��. 
�̻��Դϴ�. �� �������� �̿뿡 �����Ͻþ� ������ �����ñ� �ٶ��ϴ�.');

insert into notice(num, adminNo, writer, wdate, title, contents)
values(notice_num_SEQ.nextval, 1, '������', sysdate, '����3����3����3', '�ƾ� ���̻� �Ҹ��� ���µؿ� ���� ����� �ʹ��� ��Ʊ����~~');

insert into notice(num, adminNo, writer, wdate, title, contents)
values(notice_num_SEQ.nextval, 1, '������', sysdate, '�ֱ���', '���ع��� ��λ��� ������ �⵵�� �ϴ����� �����ϻ� �츮���� ���� ����ȭ ��õ�� ȭ������ ���ѻ�� �������� ���� �����ϼ�');

insert into notice(num, adminNo, writer, wdate, title, contents)
values(notice_num_SEQ.nextval, 1, '������', sysdate, '���� �����', '����� ����� �̸����� ���ʶ� ȣ������ �򳪺� ���� �߸� ���ʶ�');

alter table notice add upfile varchar2(50);
commit;
select * from notice;
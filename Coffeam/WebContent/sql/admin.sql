-- ������
ALTER TABLE ADMIN
	DROP CONSTRAINT PK_ADMIN; -- ������ �⺻Ű

-- ������
DROP TABLE ADMIN;

-- ������
CREATE TABLE ADMIN (
	adminNo   NUMBER(2)    NOT NULL, -- �����ڹ�ȣ
	adminId   VARCHAR2(30) NOT NULL, -- �����ھ��̵�
	adminName VARCHAR2(30) NOT NULL, -- �������̸�
	adminPwd  VARCHAR2(16) NOT NULL  -- �����ں�й�ȣ
);

-- ������ �⺻Ű
CREATE UNIQUE INDEX PK_ADMIN
	ON ADMIN ( -- ������
		adminNo ASC -- �����ڹ�ȣ
	);

-- ������
ALTER TABLE ADMIN
	ADD
		CONSTRAINT PK_ADMIN -- ������ �⺻Ű
		PRIMARY KEY (
			adminNo -- �����ڹ�ȣ
		);
    
desc admin;

CREATE SEQUENCE admin_adminNo_SEQ
START WITH 1
INCREMENT BY 1
NOCACHE;

insert into admin(adminNo, adminId, adminName, adminPwd)
values(1, 'seong', '������', '9');

select * from admin;
commit;
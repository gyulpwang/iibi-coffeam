-- 관리자
ALTER TABLE ADMIN
	DROP CONSTRAINT PK_ADMIN; -- 관리자 기본키

-- 관리자
DROP TABLE ADMIN;

-- 관리자
CREATE TABLE ADMIN (
	adminNo   NUMBER(2)    NOT NULL, -- 관리자번호
	adminId   VARCHAR2(30) NOT NULL, -- 관리자아이디
	adminName VARCHAR2(30) NOT NULL, -- 관리자이름
	adminPwd  VARCHAR2(16) NOT NULL  -- 관리자비밀번호
);

-- 관리자 기본키
CREATE UNIQUE INDEX PK_ADMIN
	ON ADMIN ( -- 관리자
		adminNo ASC -- 관리자번호
	);

-- 관리자
ALTER TABLE ADMIN
	ADD
		CONSTRAINT PK_ADMIN -- 관리자 기본키
		PRIMARY KEY (
			adminNo -- 관리자번호
		);
    
desc admin;

CREATE SEQUENCE admin_adminNo_SEQ
START WITH 1
INCREMENT BY 1
NOCACHE;

insert into admin(adminNo, adminId, adminName, adminPwd)
values(1, 'seong', '관리자', '9');

select * from admin;
commit;
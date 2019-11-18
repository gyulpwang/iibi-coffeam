-- ��ǰ
ALTER TABLE DRINK
	DROP CONSTRAINT FK_CAFE_TO_DRINK; -- ī�� -> ��ǰ

-- ��ǰ
ALTER TABLE DRINK
	DROP CONSTRAINT PK_DRINK; -- ��ǰ �⺻Ű

-- ��ǰ
DROP TABLE DRINK;

-- ��ǰ
CREATE TABLE DRINK (
	drinkCode NUMBER(8)      NOT NULL, 					-- ��ǰ�ڵ�
	cafeCode  NUMBER(5)      NOT NULL, 					-- ī���ڵ�
	drinkName VARCHAR2(25)   NOT NULL, 					-- ��ǰ��
	img       VARCHAR2(50)   default 'noimage.jpg',     -- �̹���
	price     NUMBER(10)     default 0,        		  	-- ����
	mileage   NUMBER(10)     default 0,       		    -- ���ϸ���
	spec      VARCHAR2(10)   default 'none',   		  	-- ����
	num       NUMBER(10)     default 0,        		  	-- ��ǰ����
	beanType  VARCHAR2(30)   default 'none',   		  	-- ��������
	rdate     VARCHAR2(15)   default '00/00/00' 		-- �ν��ó�¥
);
-- alter session set NLS_DATE_FORMAT='YY/MM/DD';

-- ��ǰ �⺻Ű
CREATE UNIQUE INDEX PK_DRINK
	ON DRINK ( -- ��ǰ
		drinkCode ASC -- ��ǰ�ڵ�
	);

-- ��ǰ
ALTER TABLE DRINK
	ADD
		CONSTRAINT PK_DRINK -- ��ǰ �⺻Ű
		PRIMARY KEY (
			drinkCode -- ��ǰ�ڵ�
		);

-- ��ǰ
ALTER TABLE DRINK
	ADD
		CONSTRAINT FK_CAFE_TO_DRINK -- ī�� -> ��ǰ
		FOREIGN KEY (
			cafeCode -- ī���ڵ�
		)
		REFERENCES CAFE ( -- ī��
			cafeCode -- ī���ڵ�
		);

-- �����ڵ� ���� ������ ����
DROP SEQUENCE DRINK_DRINK_SEQ;

CREATE SEQUENCE DRINK_DRINK_SEQ
START WITH 1
INCREMENT BY 1
NOCACHE;

-- 1. �����÷��̽�
insert into drink(drinkCode, cafeCode, drinkName, img, price, mileage, beanType, rdate)
values (1, 1, '���������� �̱�', 'espressosingle.PNG', 3300, 330, '�ε��׽þ� ����Ʈ�� ������', '16/06/02');
insert into drink(drinkCode, cafeCode, drinkName, img, price, mileage, spec, beanType, rdate)
values (DRINK_DRINK_SEQ.NEXTVAL, 1, 'ī��Ƹ޸�ī��', 'cafeamericano.PNG', 4100, 410, 'BEST', '�ε��׽þ� ����Ʈ�� ������', '16/06/01');
insert into drink(drinkCode, cafeCode, drinkName, img, price, mileage, beanType, rdate)
values (DRINK_DRINK_SEQ.NEXTVAL, 1, '�ٴҶ��', 'vanillalatte.PNG', 4900, 490, '�ε��׽þ� ����Ʈ�� ������', '16/06/02');
insert into drink(drinkCode, cafeCode, drinkName, img, price, mileage, beanType, rdate)
values (DRINK_DRINK_SEQ.NEXTVAL, 1, 'ī���ī', 'cafemocha.PNG', 4900, 490, '�ε��׽þ� ����Ʈ�� ������', '16/06/01');
insert into drink(drinkCode, cafeCode, drinkName, img, price, mileage, beanType, rdate)
values (DRINK_DRINK_SEQ.NEXTVAL, 1, '����', 'shortlatte.PNG', 4400, 440, '�ε��׽þ� ����Ʈ�� ������', '16/06/01');
insert into drink(drinkCode, cafeCode, drinkName, img, price, mileage, beanType, rdate)
values (DRINK_DRINK_SEQ.NEXTVAL, 1, '�պ�', 'longblack.PNG', 4100, 410, '�ε��׽þ� ����Ʈ�� ������', '16/06/02');
insert into drink(drinkCode, cafeCode, drinkName, img, price, mileage, spec)
values (DRINK_DRINK_SEQ.NEXTVAL, 1, 'īǪġ��', 'capuccino.PNG', 4400, 440, 'HIT');
insert into drink(drinkCode, cafeCode, drinkName, img, price, mileage, spec)
values (DRINK_DRINK_SEQ.NEXTVAL, 1, '�ڸ����̵�', 'grapefruitade.PNG', 5500, 550, 'BEST');
insert into drink(drinkCode, cafeCode, drinkName, img, price, mileage, spec)
values (DRINK_DRINK_SEQ.NEXTVAL, 1, '���������', 'yourtfrappe.PNG', 5800, 580, 'NEW');
insert into drink(drinkCode, cafeCode, drinkName, img, price, mileage)
values (DRINK_DRINK_SEQ.NEXTVAL, 1, '�ξ��ũƼ', 'royalmilktea.PNG', 5500, 550);

-- 2. beanbrothers
insert into drink(drinkCode, cafeCode, drinkName, img, price, mileage, beanType, rdate)
values (DRINK_DRINK_SEQ.NEXTVAL, 2, '�Ƹ޸�ī��', 'americano.PNG', 5000, 500, '�µζ� �� �ǳ�', '16/06/03');
insert into drink(drinkCode, cafeCode, drinkName, img, price, mileage, beanType, rdate)
values (DRINK_DRINK_SEQ.NEXTVAL, 2, '��', 'latte.PNG', 5500, 550, '����� ���̳�', '16/06/03');
insert into drink(drinkCode, cafeCode, drinkName, img, price, mileage, beanType, rdate)
values (DRINK_DRINK_SEQ.NEXTVAL, 2, '��������', 'affogato.PNG', 7000, 700, '�µζ� �� �ǳ�', '16/06/03');
insert into drink(drinkCode, cafeCode, drinkName, img, price, mileage, beanType, rdate)
values (DRINK_DRINK_SEQ.NEXTVAL, 2, '�󶼹ٴҶ�', 'vanillalatte.PNG', 6000, 60, '����� ���̳�', '16/06/02');

-- 3. caffebene
insert into drink(drinkCode, cafeCode, drinkName, img, price, mileage, beanType, rdate)
values (DRINK_DRINK_SEQ.NEXTVAL, 3, '�Ƹ޸�ī��', 'americano.PNG', 3800, 380, '��Ƽ���Ǿ� ����ü��', '16/06/02');
insert into drink(drinkCode, cafeCode, drinkName, img, price, mileage, beanType, rdate)
values (DRINK_DRINK_SEQ.NEXTVAL, 3, 'ī��Ḷ���ƶ�', 'caramelmacchiato.PNG', 4800, 480, '��Ƽ���Ǿ� �ôٸ� G2', '16/06/02');
insert into drink(drinkCode, cafeCode, drinkName, img, price, mileage, beanType, rdate)
values (DRINK_DRINK_SEQ.NEXTVAL, 3, '�������������ĳ�', 'espressoconpanna.PNG', 3800, 380, '��Ƽ���Ǿ� ����ü��', '16/06/02');
insert into drink(drinkCode, cafeCode, drinkName, img, spec, price, mileage)
values (DRINK_DRINK_SEQ.NEXTVAL, 3, '�׸�Ƽ�������', 'greenteafranppeno.PNG', 'HIT', 5500, 550);
insert into drink(drinkCode, cafeCode, drinkName, img, price, mileage)
values (DRINK_DRINK_SEQ.NEXTVAL, 3, '��׷���', 'earlgrey.PNG', 4000, 400);
insert into drink(drinkCode, cafeCode, drinkName, img, price, mileage)
values (DRINK_DRINK_SEQ.NEXTVAL, 3, 'ĳ����', 'chamomile.PNG', 4000, 400);
insert into drink(drinkCode, cafeCode, drinkName, img, spec, price, mileage)
values (DRINK_DRINK_SEQ.NEXTVAL, 3, '�������θ�����', 'originalmojito.PNG', 'NEW', 6300, 630);
insert into drink(drinkCode, cafeCode, drinkName, img, price, mileage)
values (DRINK_DRINK_SEQ.NEXTVAL, 3, '�������ֽ�', 'orangejuice.PNG', 5800, 580);
insert into drink(drinkCode, cafeCode, drinkName, img, price, mileage)
values (DRINK_DRINK_SEQ.NEXTVAL, 3, 'Ÿ�ι���Ƽ', 'tarobubbletea.PNG', 6300, 630);

-- 4. coffeebean
insert into drink(drinkCode, cafeCode, drinkName, img, price, mileage, beanType, rdate)
values (DRINK_DRINK_SEQ.NEXTVAL, 4, 'Ŀ�Ǻ�Ŀ��', 'coffeebeancoffee.PNG', 5000, 500, '�ڽ�Ÿ��ī SHB ������', '16/06/03');
insert into drink(drinkCode, cafeCode, drinkName, img, price, mileage, beanType, rdate)
values (DRINK_DRINK_SEQ.NEXTVAL, 4, '�Ƹ޸�ī��', 'americano.PNG', 4500, 450, '�ڽ�Ÿ��ī SHB ������', '16/06/03');
insert into drink(drinkCode, cafeCode, drinkName, img, price, mileage, beanType, rdate)
values (DRINK_DRINK_SEQ.NEXTVAL, 4, '������Ӷ�', 'hazelnutlatte.PNG', 5900, 590, '���׸��� ��Ƽ���� SHB', '16/06/03');
insert into drink(drinkCode, cafeCode, drinkName, img, price, mileage, beanType, rdate)
values (DRINK_DRINK_SEQ.NEXTVAL, 4, '��ī��', 'mochalatte.PNG', 5500, 550, '���׸��� ��Ƽ���� SHB', '16/06/03');
insert into drink(drinkCode, cafeCode, drinkName, img, price, mileage)
values (DRINK_DRINK_SEQ.NEXTVAL, 4, '���̽��������ݷ�', 'icedoublechocolate.PNG', 5300, 530);
insert into drink(drinkCode, cafeCode, drinkName, img, price, mileage)
values (DRINK_DRINK_SEQ.NEXTVAL, 4, 'ȭ��Ʈ���ݷ��帲��', 'whitechocolatedreamlatte.PNG', 5900, 590);
insert into drink(drinkCode, cafeCode, drinkName, img, spec, price, mileage)
values (DRINK_DRINK_SEQ.NEXTVAL, 4, '���̶�', 'chailatte.PNG', 'HIT', 5500, 550);
insert into drink(drinkCode, cafeCode, drinkName, img, price, mileage)
values (DRINK_DRINK_SEQ.NEXTVAL, 4, '�ױ۸��� ���۽�Ʈ', 'englishbreakfast.PNG', 4800, 480);
insert into drink(drinkCode, cafeCode, drinkName, img, spec, price, mileage)
values (DRINK_DRINK_SEQ.NEXTVAL, 4, '�����������̽������', 'berryberryiceblended.PNG', 'NEW', 6800, 680);

-- 5. droptop
insert into drink(drinkCode, cafeCode, drinkName, img, price, mileage, beanType, rdate)
values (DRINK_DRINK_SEQ.NEXTVAL, 5, '�Ƹ޸�ī��', 'americano.PNG', 4100, 410, '����� ���佺', '16/06/03');
insert into drink(drinkCode, cafeCode, drinkName, img, price, mileage, beanType, rdate)
values (DRINK_DRINK_SEQ.NEXTVAL, 5, '�÷�ȭ��Ʈ', 'flatwhite.PNG', 4600, 460, '����� ���佺', '16/06/02');
insert into drink(drinkCode, cafeCode, drinkName, img, price, mileage, beanType, rdate)
values (DRINK_DRINK_SEQ.NEXTVAL, 5, 'īǪġ��', 'capuccino.PNG', 4600, 460, '����� ���佺', '16/06/02');
insert into drink(drinkCode, cafeCode, drinkName, img, spec, price, mileage, beanType, rdate)
values (DRINK_DRINK_SEQ.NEXTVAL, 5, 'ȫ��Ŀ��', 'blackteacoffee.PNG', 'NEW', 5300, 530, '����� ���佺', '16/06/01');
insert into drink(drinkCode, cafeCode, drinkName, img, price, mileage)
values (DRINK_DRINK_SEQ.NEXTVAL, 5, '�����ö�', 'maplelatte.PNG', 5500, 550);
insert into drink(drinkCode, cafeCode, drinkName, img, spec, price, mileage)
values (DRINK_DRINK_SEQ.NEXTVAL, 5, '���������', 'orangeblanc.PNG', 'NEW', 5300, 530);

-- 6. ediya
insert into drink(drinkCode, cafeCode, drinkName, img, price, mileage, beanType, rdate)
values (DRINK_DRINK_SEQ.NEXTVAL, 6, '���������Ҹ����ƶ�', 'espressomacchiato.PNG', 2800, 280, '����ٵ��� �ҽ�', '16/06/01');
insert into drink(drinkCode, cafeCode, drinkName, img, price, mileage, beanType, rdate)
values (DRINK_DRINK_SEQ.NEXTVAL, 6, 'ī���ī', 'caffemocha.PNG', 3500, 350, '����ٵ��� �ҽ�', '16/06/01');
insert into drink(drinkCode, cafeCode, drinkName, img, price, mileage, beanType, rdate)
values (DRINK_DRINK_SEQ.NEXTVAL, 6, 'ī��Ḷ���ƶ�', 'caramelmacchiato.PNG', 3500, 350, '������ AAA+', '16/06/01');
insert into drink(drinkCode, cafeCode, drinkName, img, price, mileage)
values (DRINK_DRINK_SEQ.NEXTVAL, 6, '�ó����ī', 'cinnamonmocha.PNG', 3800, 380);
insert into drink(drinkCode, cafeCode, drinkName, img, price, mileage)
values (DRINK_DRINK_SEQ.NEXTVAL, 6, '�����÷�ġ��', 'mangoflatccino.PNG', 3500, 350);
insert into drink(drinkCode, cafeCode, drinkName, img, price, mileage)
values (DRINK_DRINK_SEQ.NEXTVAL, 6, '��纣�����Ʈ�÷�ġ��', 'blueberryyogurtflatccino.PNG', 4200, 420);
insert into drink(drinkCode, cafeCode, drinkName, img, price, mileage)
values (DRINK_DRINK_SEQ.NEXTVAL, 6, '�׸������÷�ġ��', 'greenappleflatccino.PNG', 3800, 380);
insert into drink(drinkCode, cafeCode, drinkName, img, price, mileage)
values (DRINK_DRINK_SEQ.NEXTVAL, 6, '�����𽺹�Ƽ', 'rosejasminetea.PNG', 2800, 280);
insert into drink(drinkCode, cafeCode, drinkName, img, price, mileage)
values (DRINK_DRINK_SEQ.NEXTVAL, 6, '��ũƼ', 'milktea.PNG', 4200, 420);

-- 7. hollys
insert into drink(drinkCode, cafeCode, drinkName, img, price, mileage, beanType, rdate)
values (DRINK_DRINK_SEQ.NEXTVAL, 7, '�Ƹ޸�ī��', 'americano.PNG', 4100, 410, '�ݷҺ�� ��������', '16/06/03');
insert into drink(drinkCode, cafeCode, drinkName, img, price, mileage, beanType, rdate)
values (DRINK_DRINK_SEQ.NEXTVAL, 7, '����Ʈ����ũ����', 'ristrettocreamlatte.PNG', 5600, 560, '�ݷҺ�� ��������', '16/06/02');
insert into drink(drinkCode, cafeCode, drinkName, img, price, mileage)
values (DRINK_DRINK_SEQ.NEXTVAL, 7, '������', 'sweetpotatolatte.PNG', 5500, 550);
insert into drink(drinkCode, cafeCode, drinkName, img, price, mileage, spec)
values (DRINK_DRINK_SEQ.NEXTVAL, 7, '�����������ݷ�', 'realbelgianchocolate.PNG', 5700, 570, 'BEST');
insert into drink(drinkCode, cafeCode, drinkName, img, price, mileage)
values (DRINK_DRINK_SEQ.NEXTVAL, 7, '���۹�Ʈ', 'peppermint.PNG', 4300, 430);
insert into drink(drinkCode, cafeCode, drinkName, img, price, mileage)
values (DRINK_DRINK_SEQ.NEXTVAL, 7, '���̺������ī', 'rooibospersica.PNG', 4300, 430);
insert into drink(drinkCode, cafeCode, drinkName, img, price, mileage, spec)
values (DRINK_DRINK_SEQ.NEXTVAL, 7, 'û��������Ŭ��', 'greengrapesparkling.PNG', 5500, 550, 'BEST');
insert into drink(drinkCode, cafeCode, drinkName, img, price, mileage)
values (DRINK_DRINK_SEQ.NEXTVAL, 7, '���庣�����̽�Ƽ', 'veryberryblendtea.PNG', 4800, 480);

-- 8. paiks
insert into drink(drinkCode, cafeCode, drinkName, img, price, mileage, beanType, rdate)
values (DRINK_DRINK_SEQ.NEXTVAL, 8, '�Ѹ޸�ī��', 'atmericano.PNG', 2000, 200, 'ź�ڴϾ� AA ų�����ڷ�', '16/06/01');
insert into drink(drinkCode, cafeCode, drinkName, img, price, mileage, beanType, rdate, spec)
values (DRINK_DRINK_SEQ.NEXTVAL, 8, '������Ŀ��', 'originalicecoffee.PNG', 2500, 250, 'ź�ڴϾ� AA ų�����ڷ�', '16/06/01', 'HIT');
insert into drink(drinkCode, cafeCode, drinkName, img, price, mileage, beanType, rdate)
values (DRINK_DRINK_SEQ.NEXTVAL, 8, '���ٹ�Ŀ��', 'oldcafecoffee.PNG', 2000, 200, 'ź�ڴϾ� AA ų�����ڷ�', '16/06/01');
insert into drink(drinkCode, cafeCode, drinkName, img, price, mileage, beanType, rdate)
values (DRINK_DRINK_SEQ.NEXTVAL, 8, '������', 'paikslatte.PNG', 3000, 300, 'ź�ڴϾ� AA ų�����ڷ�', '16/06/01');
insert into drink(drinkCode, cafeCode, drinkName, img, price, mileage, beanType, rdate, spec)
values (DRINK_DRINK_SEQ.NEXTVAL, 8, '���̸�������������', 'irishespresso.PNG', 2500, 250, 'ź�ڴϾ� AA ų�����ڷ�', '16/06/01', 'NEW');
insert into drink(drinkCode, cafeCode, drinkName, img, price, mileage, beanType, rdate, spec)
values (DRINK_DRINK_SEQ.NEXTVAL, 8, '��Ű��������Ű�ƶ�', 'monkeybananamacchiato.PNG', 3500, 350, 'ź�ڴϾ� AA ų�����ڷ�', '16/06/01', 'NEW');

-- 9. pascucci
insert into drink(drinkCode, cafeCode, drinkName, img, price, mileage, beanType, rdate)
values (DRINK_DRINK_SEQ.NEXTVAL, 9, '���������ҵ��ǿ�', 'espressodoppio.PNG', 3800, 380, '��� ������', '16/06/03');
insert into drink(drinkCode, cafeCode, drinkName, img, price, mileage, beanType, rdate)
values (DRINK_DRINK_SEQ.NEXTVAL, 9, '�������ε帳Ŀ��', 'originaldripcoffee.PNG', 3900, 390, '��� ������', '16/06/03');
insert into drink(drinkCode, cafeCode, drinkName, img, price, mileage, beanType, rdate)
values (DRINK_DRINK_SEQ.NEXTVAL, 9, 'ī���', 'caffelatte.PNG', 4500, 450, '�߽��� ������', '16/06/02');
insert into drink(drinkCode, cafeCode, drinkName, img, price, mileage, beanType, rdate)
values (DRINK_DRINK_SEQ.NEXTVAL, 9, '���ɶ��', 'shakerato.PNG', 4800, 480, '�߽��� ������', '16/06/02');
insert into drink(drinkCode, cafeCode, drinkName, img, price, mileage, beanType, rdate, spec)
values (DRINK_DRINK_SEQ.NEXTVAL, 9, 'Ƽ��̽���ī', 'tiramisumocha.PNG', 5500, 550, '�߽��� ������', '16/06/02', 'NEW');
insert into drink(drinkCode, cafeCode, drinkName, img, price, mileage, spec)
values (DRINK_DRINK_SEQ.NEXTVAL, 9, '�ڹ�Ĩ��Ʈ�׶�ϵ�', 'javachipmintgranita.PNG', 6000, 600, 'BEST');
insert into drink(drinkCode, cafeCode, drinkName, img, price, mileage)
values (DRINK_DRINK_SEQ.NEXTVAL, 9, '�׸�Ƽ��', 'greentealatte.PNG', 5000, 500);
insert into drink(drinkCode, cafeCode, drinkName, img, price, mileage)
values (DRINK_DRINK_SEQ.NEXTVAL, 9, '���ڷ���Ƽ', 'yujalemontea.PNG', 5500, 550);
insert into drink(drinkCode, cafeCode, drinkName, img, price, mileage)
values (DRINK_DRINK_SEQ.NEXTVAL, 9, '�����Ʊ׶�ϵ�', 'peachgranita.PNG', 6300, 630);

-- 10. starbucks
insert into drink(drinkCode, cafeCode, drinkName, img, price, mileage, beanType, rdate)
values (DRINK_DRINK_SEQ.NEXTVAL, 10, '�Ƹ޸�ī��', 'americano.PNG', 3600, 360, '������ ����', '16/06/02');
insert into drink(drinkCode, cafeCode, drinkName, img, price, mileage, beanType, rdate)
values (DRINK_DRINK_SEQ.NEXTVAL, 10, '��ü��', 'dolcelatte.PNG', 5100, 510, '������ ����', '16/06/02');
insert into drink(drinkCode, cafeCode, drinkName, img, price, mileage, beanType, rdate)
values (DRINK_DRINK_SEQ.NEXTVAL, 10, 'ī���', 'caffelatte.PNG', 4100, 410, '������ ����', '16/06/02');
insert into drink(drinkCode, cafeCode, drinkName, img, price, mileage, beanType, rdate)
values (DRINK_DRINK_SEQ.NEXTVAL, 10, 'īǪġ��', 'capuccino.PNG', 4100, 410, 'īƼ īƼ ����', '16/06/02');
insert into drink(drinkCode, cafeCode, drinkName, img, price, mileage, beanType, rdate)
values (DRINK_DRINK_SEQ.NEXTVAL, 10, 'ī���ī', 'caffemocha.PNG', 4600, 460, '����ġ �ν�Ʈ', '16/06/02');
insert into drink(drinkCode, cafeCode, drinkName, img, price, mileage, beanType, rdate)
values (DRINK_DRINK_SEQ.NEXTVAL, 10, 'ī�������Ǫġ��', 'caramelfrappuccino.PNG', 5600, 560, '����ġ �ν�Ʈ', '16/06/02');
insert into drink(drinkCode, cafeCode, drinkName, img, price, mileage, spec)
values (DRINK_DRINK_SEQ.NEXTVAL, 10, 'ü�������', 'cherryblossomlatte.PNG', 5900, 590, 'HIT');
insert into drink(drinkCode, cafeCode, drinkName, img, price, mileage)
values (DRINK_DRINK_SEQ.NEXTVAL, 10, '�ƺ�ī�����Ʈ�����', 'avocadoyogurtblended.PNG', 6700, 670);
insert into drink(drinkCode, cafeCode, drinkName, img, price, mileage)
values (DRINK_DRINK_SEQ.NEXTVAL, 10, '������Ʈ�����', 'strawberryyogurtblended.PNG', 6100, 610);
insert into drink(drinkCode, cafeCode, drinkName, img, price, mileage)
values (DRINK_DRINK_SEQ.NEXTVAL, 10, '����Ŀ������Ƽ', 'hibiscusblendbrewedtea.PNG', 4100, 410);
insert into drink(drinkCode, cafeCode, drinkName, img, price, mileage, spec)
values (DRINK_DRINK_SEQ.NEXTVAL, 10, '�����������', 'coollimefizzio.PNG', 5900, 590, 'NEW');
insert into drink(drinkCode, cafeCode, drinkName, img, price, mileage)
values (DRINK_DRINK_SEQ.NEXTVAL, 10, '������������ֽ�', 'sunriseapplejuice.PNG', 5900, 590);

-- 11. thekind
insert into drink(drinkCode, cafeCode, drinkName, img, price, mileage, beanType, rdate)
values (DRINK_DRINK_SEQ.NEXTVAL, 11, '����������', 'espresso.PNG', 2300, 230, '�ݷҺ�� ����������Ʈ', '16/06/03');
insert into drink(drinkCode, cafeCode, drinkName, img, price, mileage, beanType, rdate)
values (DRINK_DRINK_SEQ.NEXTVAL, 11, 'ȭ��Ʈ ī���ī', 'cafewhitemocha.PNG', 3300, 330, '����ٵ��� ����', '16/06/03');
insert into drink(drinkCode, cafeCode, drinkName, img, price, mileage, beanType, rdate)
values (DRINK_DRINK_SEQ.NEXTVAL, 11, '������Ӷ�', 'hazelnutlatte.PNG', 3500, 350, 'ź�ڴϾ� ���', '16/06/03');
insert into drink(drinkCode, cafeCode, drinkName, img, price, mileage, spec)
values (DRINK_DRINK_SEQ.NEXTVAL, 11, '������������', 'blackbeanfrappe.PNG', 3500, 350, 'NEW');

-- 12. tomntoms
insert into drink(drinkCode, cafeCode, drinkName, img, price, mileage, beanType, rdate, spec)
values (DRINK_DRINK_SEQ.NEXTVAL, 12, '�̱ۿ�����Ŀ��', 'singleorigincoffee.PNG', 6500, 650, '��Ƽ���Ǿ� ����ü�� G2', '16/06/02', 'BEST');
insert into drink(drinkCode, cafeCode, drinkName, img, price, mileage, beanType, rdate)
values (DRINK_DRINK_SEQ.NEXTVAL, 12, '�ó���ī���ī', 'cinnamoncafemocha.PNG', 5000, 500, '��Ƽ���Ǿ� �ôٸ� G4', '16/06/02');
insert into drink(drinkCode, cafeCode, drinkName, img, price, mileage, beanType, rdate)
values (DRINK_DRINK_SEQ.NEXTVAL, 12, 'ī��Ḷ���ƶ�', 'caramelmacchiato.PNG', 4800, 480, '��Ƽ��AAA', '16/06/01');
insert into drink(drinkCode, cafeCode, drinkName, img, price, mileage, beanType, rdate)
values (DRINK_DRINK_SEQ.NEXTVAL, 12, 'ȫ��ī���', 'redginsengcafelatte.PNG', 5500, 550, '��Ƽ��AAA', '16/06/01');
insert into drink(drinkCode, cafeCode, drinkName, img, price, mileage)
values (DRINK_DRINK_SEQ.NEXTVAL, 12, '����ġ��', 'walnutccino.PNG', 5300, 530);
insert into drink(drinkCode, cafeCode, drinkName, img, price, mileage)
values (DRINK_DRINK_SEQ.NEXTVAL, 12, '�׸���Ʈ���ݸ�', 'greenmintchocolate.PNG', 5000, 500);
insert into drink(drinkCode, cafeCode, drinkName, img, price, mileage, spec)
values (DRINK_DRINK_SEQ.NEXTVAL, 12, '���ڳӹ�ũġ��', 'coconutmilkccino.PNG', 6500, 650, 'NEW');
insert into drink(drinkCode, cafeCode, drinkName, img, price, mileage)
values (DRINK_DRINK_SEQ.NEXTVAL, 12, '��������', 'mangoslush.PNG', 3800, 380);

rollback;
select * from drink order by drinkcode desc;
select * from drink where spec='HIT' order by drinkcode desc;
commit;
-- ������
update drink set �÷���=������ where ����;


select * from cafe;
select * from cafe order by cafeCode;

alter table drink add updir varchar2(50);
-- updir�� /atwosomeplace/�� ���� ���� ���丮�� ���� �� VO�� �߰�

update drink set updir='/atwosomeplace/' where cafecode=1;
update drink set updir='/beanbrothers/' where cafecode=2;
update drink set updir='/caffebene/' where cafecode=3;
update drink set updir='/coffeebean/' where cafecode=4;
update drink set updir='/droptop/' where cafecode=5;
update drink set updir='/ediya/' where cafecode=6;
update drink set updir='/hollys/' where cafecode=7;
update drink set updir='/paiks/' where cafecode=8;
update drink set updir='/pascucci/' where cafecode=9;
update drink set updir='/starbucks/' where cafecode=10;
update drink set updir='/thekind/' where cafecode=11;
update drink set updir='/tomntoms/' where cafecode=12;

update drink set spec='none' where drinkcode=54;
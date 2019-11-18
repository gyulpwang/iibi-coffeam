-- ī��
ALTER TABLE CAFE
	DROP CONSTRAINT PK_CAFE; -- ī�� �⺻Ű

-- ī��
DROP TABLE CAFE;

-- ī��
CREATE TABLE CAFE (
	cafeCode NUMBER(5)      NOT NULL, -- ī���ڵ�
	cafeName VARCHAR2(30)   NOT NULL, -- ī���
	info     VARCHAR2(1000) NULL,     -- ī������
	site     VARCHAR2(50)   NULL,     -- ī�����Ʈ
	logo     VARCHAR2(100)  NULL,     -- ī��ΰ�
	img      VARCHAR2(100)  NULL      -- ī���̹���
);

-- ī�� �⺻Ű
CREATE UNIQUE INDEX PK_CAFE
	ON CAFE ( -- ī��
		cafeCode ASC -- ī���ڵ�
	);

-- ī��
ALTER TABLE CAFE
	ADD
		CONSTRAINT PK_CAFE -- ī�� �⺻Ű
		PRIMARY KEY (
			cafeCode -- ī���ڵ�
		);
		
-- ī���ڵ� ���� ������ ����
DROP SEQUENCE CAFE_CAFE_SEQ;

CREATE SEQUENCE CAFE_CAFE_SEQ
START WITH 1
INCREMENT BY 1
NOCACHE;

-- 1
insert into cafe(cafeCode, cafeName, info, site, logo, img)
values (CAFE_CAFE_SEQ.nextval, 'atwosomeplace', '[ī���] �����÷��̽� | [���� ��ġ] ����Ư���� �߱� ��ȣ�� 330 CJ �������缾�� 7~8�� CJǪ���(��) | [������ ��ȣ] 1577-0700 | 
[�귣�� �Ұ�] �����÷��̽��� ���� ��Ƽ���� �ձ�� �ϼ����� ���� ����ũ, ��ī�� ���� ����Ʈ�� ���ν������� ��� ǳ���ϰ� ������ ���� ���� �츰 Ŀ��, 
������ ��ǳ������ ī�信 �µ��� �����ϰ� ����� ������� ������ ���� ��ſ�(��ġ)�� ���� �� �ִ� Ư���� ������ �����մϴ�.', 
'http://www.twosome.co.kr', 'logo_atwosomeplace.PNG', 'atwosomeplace.PNG');

-- 2
insert into cafe(cafecode, cafename, info, site, logo, img)
values(CAFE_CAFE_SEQ.nextval, 'beanbrothers', '[ī���] ������� | [���� ��ġ] ����� ������ ������ 12, 3�� | [������ ��ȣ] 02-6204-7888 | 
[�귣�� �Ұ�] ���ִ� Ŀ�Ǹ� �� ���� ��� �� �ֵ��� �ϰ� �ʹٴ� ������ ���(?)���� ��������� ���۵Ǿ���. ������ Ŀ���� ȫ�� �ӿ��� ����� ������ ã���ִ� 
���̵尡 �ǰ� �ʹ�. "�̷� Ŀ�ǰ� �־���! �ʹ� ���ִ�!" �ٸ� �������ٵ� �츮��, ��������� ������κ��� ���� ��� ���� ���̴�.',
'http://www.beanbrothers.co.kr/', 'logo_beanbrothers.PNG', 'beanbrothers.PNG');

-- 3
insert into cafe(cafecode, cafename, info, site, logo, img)
values(CAFE_CAFE_SEQ.nextval, 'caffebene', '[ī���] ī�亣�� | [���� ��ġ] ����� ������ ���Ϸ� 427 | [������ ��ȣ] 1688-4666 | 
[�귣�� �Ұ�] 2014�� Ŀ�� ����������μ��� �ִ� �Ը��� ���� �۷ι� �ν��� �÷�Ʈ�� �ذ��ϰ� �ֻ��� ���θ� �����ϰ� �ֽ��ϴ�. ���۷��ö������̼�(Glocalization)��
�������� ����ȭ�� ����ȭ�� ���ÿ� �����ϸ� �پ ��Ʈ�ʽ��� �������� ������忡 �⿩�ϴ�, ���ѹα��� �ڶ������� �귣�尡 �� ���Դϴ�.',
'http://www.caffebene.co.kr/', 'logo_caffebene.PNG', 'caffebene.PNG');

-- 4
insert into cafe(cafecode, cafename, info, site, logo, img)
values(CAFE_CAFE_SEQ.nextval, 'coffeebean', '[ī���] Ŀ�Ǻ� | [������ġ] ����� ������ ������� 99�� 7 | [������ ��ȣ] 02-1577-4708 | 
[�귣�� �Ұ�] (��)Ŀ�Ǻ��ڸ��ƴ� Ŀ�ǿ� ���� �⺻���� �Բ� �� �� �ִ� Cake�� Bagel, Sandwich ���� �پ��� ����Ŀ���� �Ǹ��ϰ� ������, ���� �ۿ����� Ŀ�Ǻ��� 
���� �� �ְ� ���ִ� ���� Ŀ�ǰ��� ��ǰ���� �Ǹ��ϸ� Ŀ�ǿ� ���� ��� �� �ִ� ��� ���� �����ϰ� �ֽ��ϴ�.', 
'http://www.coffeebeankorea.com', 'logo_coffeebean.PNG', 'coffeebean.PNG');

-- 5
insert into cafe(cafecode, cafename, info, site, logo, img)
values(CAFE_CAFE_SEQ.nextval, 'droptop', '[ī���] ���ž | [������ġ] ����� ������ ������ 1���� ���ֺ��� 12��(�������� �ǹ�) | [������ ��ȣ] 541-7800 | 
[�귣�� �Ұ�] ���� ��ģ ���� ������ ���� ���� ���󿡼� ���ô� Ŀ�� ������ ���ž (Droptop)�̶� ���¾��µ�, ������ ���ž(Droptop)�� �����������(digital 
nomad)�� ���� ���� ���� ���ͷ� ���ؼ��Ͽ� Drop in a top place ��� ���̹��� ������ �������� �ְ��� ��ҿ��� �ֻ��� Ŀ�Ǹ� ���ٴ� Concept���� ź�� �Ǿ����ϴ�.', 
'http://www.cafedroptop.com', 'logo_droptop.PNG', 'droptop.PNG');

-- 6
insert into cafe(cafecode, cafename, info, site, logo, img)
values(CAFE_CAFE_SEQ.nextval, 'ediya', '[ī���] �̵�� | [������ġ] ����Ư���� ������ ������ 636 �̵�ߺ��� | [������ ��ȣ] 02-543-6467 | 
[�귣�� �Ұ�] 2015�� 3�� �̵��Ŀ�Ǵ� Ŀ�������� ���� ���� 1,500ȣ�� �����ϸ� ���� ���忡�� ���Ե鲲 ǰ�� ���� ���ִ� Ŀ�Ǹ� �ո����� ���ݿ� ������ �帮�� �ֽ��ϴ�.
���� ������ �ؿ� �귣����� ������ ����� �̰ܳ� �̵��Ŀ�Ǵ� ���Ե鲲 ǰ������ Ŀ�ǿ� ������ ���񽺸� �帮�� ���� ���� �� �������� ���Ӿ��� ����ϰ� �ֽ��ϴ�.', 
'http://www.ediya.com', 'logo_ediya.PNG', 'ediya.PNG');

-- 7
insert into cafe(cafecode, cafename, info, site, logo, img)
values(CAFE_CAFE_SEQ.nextval, 'hollys', '[ī���] �Ҹ��� | [������ġ] ����Ư���� ������ ������� 620 �̷����� Ÿ�� 13, 14�� | [������ ��ȣ] 02-2188-7100 | 
[�귣�� �Ұ�] ���ο� ������ �̷��� Ŀ���� ����� �ϳ� �ϳ� �������鼭 ���� ������� Ŀ�ǿ� �Բ� ������ ������ ��⵵�� ���ִ� ���� �ٷ� �Ҹ���Ŀ�ǰ� �߱��ϴ� 
Ŀ���� ��ſ��Դϴ�. Ŀ�ǰ� �ִ� �Ƹ��ٿ��� ���� ���� ������ ��� �� �ֵ���, �� ���� �ǹ� �ִ� ���� ���̸� ������ �Ҹ���Ŀ�ǰ� �ǰڽ��ϴ�.', 
'http://www.hollys.co.kr', 'logo_hollys.PNG', 'hollys.PNG');

-- 8
insert into cafe(cafecode, cafename, info, site, logo, img)
values(CAFE_CAFE_SEQ.nextval, 'paiks', '[ī���] ���ٹ� | [���� ��ġ] ����� ������ ������� 1�� 39 �������� 4~6�� | [������ ��ȣ] 02-549-3864 | 
[�귣�� �Ұ�] 2006�� ������ ���ڰ���� ���� ī��� ������ ���ٹ��� 15cm ��뷮 Ŀ�ǿ� �ո����� ����, ���� ����Ƽ�� �ڶ��մϴ�. 
�δ� ���� ����ϰ� �׸��� ���ְ�, ������ ����� �������� ģ�� ���� Ŀ�� ������, ���ٹ��Դϴ�.',
'http://www.paikdabang.com/paiks/index.asp', 'logo_paiks.PNG', 'paiks.PNG');

-- 9
insert into cafe(cafecode, cafename, info, site, logo, img)
values(CAFE_CAFE_SEQ.nextval, 'pascucci', '[ī���] �Ľ����� | [������ġ] ����� ���ʱ� ���絿 11-149���� | [������ ��ȣ] 080-731-2027 | 
[�귣�� �Ұ�] ī�� �Ľ���� ó�� ������ ���� 19���� ��, ���θ� �ּ����� ���� ���ο� ���� ���� ����� ������ ������Ű�鼭 �������� ����� �����߽��ϴ�. 
���������� ������� ���� ���ʷ� ����, �۷ι� �귣������ �Ľ������ ��Ż����, ����, �̱� �� �� ���� 20�� �� ���� 40�� ���ÿ� ������ �۷ι� �귣��� �����߽��ϴ�.', 
'http://www.caffe-pascucci.co.kr', 'logo_pascucci.PNG', 'pascucci.PNG');

-- 10
insert into cafe(cafecode, cafename, info, site, logo, img)
values(CAFE_CAFE_SEQ.nextval, 'starbucks', '[ī���] ��Ÿ���� | [������ġ] ����Ư���� �߱� �Ұ��� 112(�Ұ���)(��Ÿ���� �ڸ���) | [������ ��ȣ] 02)3015-1100 | 
[�귣�� �Ұ�] Ŀ�� �̻��� Ư���� ������ �Ұ��մϴ�. �����ε��� ��Ȱ �ӿ� ������ �� ������ Ŀ�� ��ȭ�� �����ϰ� �ִ� ��Ÿ������ �ϻ��� ǳ��Ӱ� �ϴ� 
��3�� �������μ� ���������� ������ȸ �ӿ��� �� �� �Բ��ϸ� ���ο� Ŀ�ǹ�ȭ�� ������Ű�� �ֽ��ϴ�.', 
'http://www.istarbucks.co.kr', 'logo_starbucks.PNG', 'starbucks.PNG');

-- 11
insert into cafe(cafecode, cafename, info, site, logo, img)
values(CAFE_CAFE_SEQ.nextval, 'thekind', '[ī���] ������Ŀ�� | [������ġ] ��⵵ ���� �ϻ굿�� �鸶�� 223 | [������ ��ȣ] 1566-6367 | 
[�귣�� �Ұ�] �ٸ��� ���� ������ �޲ٴ� ������� �� ���� Ŀ��������, ������Ŀ�Ǹ� ��������ϴ�. ��ī�� ������ ������Ŀ�Ǵ� ������ �÷����� ������ ����� 
������ �ƴ��ϰ� ����� �������� �ٰ����ϴ�. ���������� ���� ���� Ŀ�Ǹ� ���ô� ��ſ�� ���� ������ ��� ������ �ູ�� �����ϴ� ���� Ŀ���������Դϴ�.', 
'http://www.xn--9m1by48b62bvxjse.com/', 'logo_thekind.PNG', 'thekind.PNG');

-- 12
insert into cafe(cafecode, cafename, info, site, logo, img)
values(CAFE_CAFE_SEQ.nextval, 'tomntoms', '[ī���] Ž��Ž�� | [������ġ] ����Ư���� ������ ������ 163�� 10 ����κ��� 2F | [������ ��ȣ] 02-3412-0781 | 
[�귣�� �Ұ�] Ž��Ž���� �ż��ϰ� ǳ���� Ŀ���� ���� ������ �� ������ ���� �ּ��� ���ϰ� �ֽ��ϴ�. ���� �� ���� Ŀ�������� ������ �����ϸ�
��ǰ�� Ŀ�ǿ� �� ���� ������ ������ �׸��� ���� ������� �Բ��ϴ� ����� ������� ���� ���ѹα��� ����� �� ���迡�� ��� �ް� �ֽ��ϴ�.', 
'http://www.tomntoms.com', 'logo_tomntoms.PNG', 'tomntoms.PNG');

select * from cafe order by cafecode;
commit;

update cafe set cafename='�����÷��̽�' where cafecode=1;
update cafe set cafename='�������' where cafecode=2;
update cafe set cafename='ī�亣��' where cafecode=3;
update cafe set cafename='Ŀ�Ǻ�' where cafecode=4;
update cafe set cafename='���ž' where cafecode=5;
update cafe set cafename='�̵��' where cafecode=6;
update cafe set cafename='�Ҹ���' where cafecode=7;
update cafe set cafename='���ٹ�' where cafecode=8;
update cafe set cafename='�Ľ�����' where cafecode=9;
update cafe set cafename='��Ÿ����' where cafecode=10;
update cafe set cafename='������Ŀ��' where cafecode=11;
update cafe set cafename='Ž��Ž��' where cafecode=12;

select * from drink where cafecode=1;
update drink set beantype='�ε��׽þ� ����Ʈ�� ������', rdate='16/06/01' where drinkcode='6';
commit;
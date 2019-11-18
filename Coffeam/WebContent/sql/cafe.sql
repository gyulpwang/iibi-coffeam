-- 카페
ALTER TABLE CAFE
	DROP CONSTRAINT PK_CAFE; -- 카페 기본키

-- 카페
DROP TABLE CAFE;

-- 카페
CREATE TABLE CAFE (
	cafeCode NUMBER(5)      NOT NULL, -- 카페코드
	cafeName VARCHAR2(30)   NOT NULL, -- 카페명
	info     VARCHAR2(1000) NULL,     -- 카페정보
	site     VARCHAR2(50)   NULL,     -- 카페사이트
	logo     VARCHAR2(100)  NULL,     -- 카페로고
	img      VARCHAR2(100)  NULL      -- 카페이미지
);

-- 카페 기본키
CREATE UNIQUE INDEX PK_CAFE
	ON CAFE ( -- 카페
		cafeCode ASC -- 카페코드
	);

-- 카페
ALTER TABLE CAFE
	ADD
		CONSTRAINT PK_CAFE -- 카페 기본키
		PRIMARY KEY (
			cafeCode -- 카페코드
		);
		
-- 카페코드 관련 시퀀스 생성
DROP SEQUENCE CAFE_CAFE_SEQ;

CREATE SEQUENCE CAFE_CAFE_SEQ
START WITH 1
INCREMENT BY 1
NOCACHE;

-- 1
insert into cafe(cafeCode, cafeName, info, site, logo, img)
values (CAFE_CAFE_SEQ.nextval, 'atwosomeplace', '[카페명] 투썸플레이스 | [본사 위치] 서울특별시 중구 동호로 330 CJ 제일제당센터 7~8층 CJ푸드빌(주) | [고객센터 번호] 1577-0700 | 
[브랜드 소개] 투썸플레이스는 전문 파티쉐의 손길로 완성도를 높인 케이크, 마카롱 등의 디저트와 딥로스팅으로 깊고 풍부하게 본연의 맛과 향을 살린 커피, 
유럽의 고풍스러운 카페에 온듯한 따뜻하고 편안한 분위기로 나만의 작은 즐거움(사치)을 만날 수 있는 특별한 공간을 제공합니다.', 
'http://www.twosome.co.kr', 'logo_atwosomeplace.PNG', 'atwosomeplace.PNG');

-- 2
insert into cafe(cafecode, cafename, info, site, logo, img)
values(CAFE_CAFE_SEQ.nextval, 'beanbrothers', '[카페명] 빈브라더스 | [본사 위치] 서울시 마포구 토정로 12, 3층 | [고객센터 번호] 02-6204-7888 | 
[브랜드 소개] 맛있는 커피를 더 쉽게 즐길 수 있도록 하고 싶다는 가벼운 욕심(?)으로 빈브라더스는 시작되었다. 수많은 커피의 홍수 속에서 당신의 취향을 찾아주는 
가이드가 되고 싶다. "이런 커피가 있었어! 너무 맛있다!" 다른 무엇보다도 우리가, 빈브라더스가 당신으로부터 가장 듣고 싶은 말이다.',
'http://www.beanbrothers.co.kr/', 'logo_beanbrothers.PNG', 'beanbrothers.PNG');

-- 3
insert into cafe(cafecode, cafename, info, site, logo, img)
values(CAFE_CAFE_SEQ.nextval, 'caffebene', '[카페명] 카페베네 | [본사 위치] 서울시 광진구 동일로 427 | [고객센터 번호] 1688-4666 | 
[브랜드 소개] 2014년 커피 프랜차이즈로서는 최대 규모인 양주 글로벌 로스팅 플랜트를 준공하고 최상의 원두를 제공하고 있습니다. ‘글로컬라이제이션(Glocalization)’
전략으로 세계화와 현지화를 동시에 실현하며 뛰어난 파트너십을 바탕으로 세계시장에 기여하는, 대한민국의 자랑스러운 브랜드가 될 것입니다.',
'http://www.caffebene.co.kr/', 'logo_caffebene.PNG', 'caffebene.PNG');

-- 4
insert into cafe(cafecode, cafename, info, site, logo, img)
values(CAFE_CAFE_SEQ.nextval, 'coffeebean', '[카페명] 커피빈 | [본사위치] 서울시 강남구 봉은사로 99길 7 | [고객센터 번호] 02-1577-4708 | 
[브랜드 소개] (주)커피빈코리아는 커피와 차를 기본으로 함께 할 수 있는 Cake과 Bagel, Sandwich 등의 다양한 베이커리를 판매하고 있으며, 매장 밖에서도 커피빈을 
느낄 수 있게 해주는 각종 커피관련 제품들을 판매하며 커피와 차를 즐길 수 있는 모든 길을 제시하고 있습니다.', 
'http://www.coffeebeankorea.com', 'logo_coffeebean.PNG', 'coffeebean.PNG');

-- 5
insert into cafe(cafecode, cafename, info, site, logo, img)
values(CAFE_CAFE_SEQ.nextval, 'droptop', '[카페명] 드롭탑 | [본사위치] 서울시 강남구 논현동 1번지 삼주빌딩 12층(신한은행 건물) | [고객센터 번호] 541-7800 | 
[브랜드 소개] 이후 지친 몸과 마음을 쉬기 위해 정상에서 마시는 커피 한잔을 드롭탑 (Droptop)이라 일컫었는데, 현재의 드롭탑(Droptop)은 디지털유목민(digital 
nomad)을 위한 도심 속의 쉼터로 재해석하여 Drop in a top place 라는 네이밍의 명제를 바탕으로 최고의 장소에서 최상의 커피를 즐긴다는 Concept으로 탄생 되었습니다.', 
'http://www.cafedroptop.com', 'logo_droptop.PNG', 'droptop.PNG');

-- 6
insert into cafe(cafecode, cafename, info, site, logo, img)
values(CAFE_CAFE_SEQ.nextval, 'ediya', '[카페명] 이디야 | [본사위치] 서울특별시 강남구 논현로 636 이디야빌딩 | [고객센터 번호] 02-543-6467 | 
[브랜드 소개] 2015년 3월 이디야커피는 커피전문점 최초 국내 1,500호를 오픈하며 전국 매장에서 고객님들께 품질 좋고 맛있는 커피를 합리적인 가격에 제공해 드리고 있습니다.
국내 대기업과 해외 브랜드와의 경쟁을 꿋꿋이 이겨낸 이디야커피는 고객님들께 품질좋은 커피와 진심의 서비스를 드리기 위해 지금 이 순간에도 끊임없이 노력하고 있습니다.', 
'http://www.ediya.com', 'logo_ediya.PNG', 'ediya.PNG');

-- 7
insert into cafe(cafecode, cafename, info, site, logo, img)
values(CAFE_CAFE_SEQ.nextval, 'hollys', '[카페명] 할리스 | [본사위치] 서울특별시 강남구 테헤란로 620 미래에셋 타워 13, 14층 | [고객센터 번호] 02-2188-7100 | 
[브랜드 소개] 원두에 숨겨진 이러한 커피의 비밀을 하나 하나 밝혀가면서 많은 사람들이 커피와 함께 소중한 순간을 즐기도록 해주는 것이 바로 할리스커피가 추구하는 
커피의 즐거움입니다. 커피가 주는 아름다움을 보다 많은 고객들이 즐길 수 있도록, 매 순간 의미 있는 작은 차이를 만들어가는 할리스커피가 되겠습니다.', 
'http://www.hollys.co.kr', 'logo_hollys.PNG', 'hollys.PNG');

-- 8
insert into cafe(cafecode, cafename, info, site, logo, img)
values(CAFE_CAFE_SEQ.nextval, 'paiks', '[카페명] 빽다방 | [본사 위치] 서울시 강남구 봉은사로 1길 39 유성빌딩 4~6층 | [고객센터 번호] 02-549-3864 | 
[브랜드 소개] 2006년 논현동 먹자골목의 작은 카페로 시작한 빽다방은 15cm 대용량 커피에 합리적인 가격, 놀라운 퀄리티를 자랑합니다. 
부담 없이 편안하게 그리고 맛있게, 만나면 기분이 좋아지는 친구 같은 커피 전문점, 빽다방입니다.',
'http://www.paikdabang.com/paiks/index.asp', 'logo_paiks.PNG', 'paiks.PNG');

-- 9
insert into cafe(cafecode, cafename, info, site, logo, img)
values(CAFE_CAFE_SEQ.nextval, 'pascucci', '[카페명] 파스쿠찌 | [본사위치] 서울시 서초구 양재동 11-149번지 | [고객센터 번호] 080-731-2027 | 
[브랜드 소개] 카페 파스쿠찌가 처음 등장한 것은 19세기 말, 원두를 주석냄비에 볶아 새로운 맛과 향을 만드는 실험을 성공시키면서 본격적인 사업을 전개했습니다. 
에스프레소 추출법을 업계 최초로 도입, 글로벌 브랜드현재 파스쿠찌는 이탈리아, 영국, 미국 등 전 세계 20여 개 국의 40여 도시에 진출한 글로벌 브랜드로 성장했습니다.', 
'http://www.caffe-pascucci.co.kr', 'logo_pascucci.PNG', 'pascucci.PNG');

-- 10
insert into cafe(cafecode, cafename, info, site, logo, img)
values(CAFE_CAFE_SEQ.nextval, 'starbucks', '[카페명] 스타벅스 | [본사위치] 서울특별시 중구 소공로 112(소공동)(스타벅스 코리아) | [고객센터 번호] 02)3015-1100 | 
[브랜드 소개] 커피 이상의 특별한 경험을 소개합니다. 세계인들의 생활 속에 스며들어 전 세계의 커피 문화를 선도하고 있는 스타벅스가 일상을 풍요롭게 하는 
제3의 공간으로서 국내에서도 지역사회 속에서 고객 과 함께하며 새로운 커피문화를 정착시키고 있습니다.', 
'http://www.istarbucks.co.kr', 'logo_starbucks.PNG', 'starbucks.PNG');

-- 11
insert into cafe(cafecode, cafename, info, site, logo, img)
values(CAFE_CAFE_SEQ.nextval, 'thekind', '[카페명] 더착한커피 | [본사위치] 경기도 고양시 일산동구 백마로 223 | [고객센터 번호] 1566-6367 | 
[브랜드 소개] 바르고 착한 세상을 꿈꾸는 사람들이 모여 착한 커피전문점, 더착한커피를 만들었습니다. 북카페 컨셉의 더착한커피는 따뜻한 컬러감의 원목을 사용해 
고객에게 아늑하고 편안한 공간으로 다가갑니다. 공정무역을 통한 착한 커피를 마시는 즐거움과 착한 마음을 모아 나누는 행복을 선사하는 착한 커피전문점입니다.', 
'http://www.xn--9m1by48b62bvxjse.com/', 'logo_thekind.PNG', 'thekind.PNG');

-- 12
insert into cafe(cafecode, cafename, info, site, logo, img)
values(CAFE_CAFE_SEQ.nextval, 'tomntoms', '[카페명] 탐앤탐스 | [본사위치] 서울특별시 강남구 논현로 163길 10 버드로빌딩 2F | [고객센터 번호] 02-3412-0781 | 
[브랜드 소개] 탐앤탐스는 신선하고 풍부한 커피의 맛과 향으로 고객 만족을 위해 최선을 다하고 있습니다. 국내 및 세계 커피전문점 시장을 선도하며
고품격 커피와 갓 구운 따뜻한 프레즐 그리고 좋은 사람들이 함께하는 편안한 분위기로 지금 대한민국을 비롯해 전 세계에서 사랑 받고 있습니다.', 
'http://www.tomntoms.com', 'logo_tomntoms.PNG', 'tomntoms.PNG');

select * from cafe order by cafecode;
commit;

update cafe set cafename='투썸플레이스' where cafecode=1;
update cafe set cafename='빈브라더스' where cafecode=2;
update cafe set cafename='카페베네' where cafecode=3;
update cafe set cafename='커피빈' where cafecode=4;
update cafe set cafename='드롭탑' where cafecode=5;
update cafe set cafename='이디야' where cafecode=6;
update cafe set cafename='할리스' where cafecode=7;
update cafe set cafename='빽다방' where cafecode=8;
update cafe set cafename='파스쿠찌' where cafecode=9;
update cafe set cafename='스타벅스' where cafecode=10;
update cafe set cafename='더착한커피' where cafecode=11;
update cafe set cafename='탐앤탐스' where cafecode=12;

select * from drink where cafecode=1;
update drink set beantype='인도네시아 수마트라 만델링', rdate='16/06/01' where drinkcode='6';
commit;
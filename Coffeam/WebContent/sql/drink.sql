-- 상품
ALTER TABLE DRINK
	DROP CONSTRAINT FK_CAFE_TO_DRINK; -- 카페 -> 상품

-- 상품
ALTER TABLE DRINK
	DROP CONSTRAINT PK_DRINK; -- 상품 기본키

-- 상품
DROP TABLE DRINK;

-- 상품
CREATE TABLE DRINK (
	drinkCode NUMBER(8)      NOT NULL, 					-- 상품코드
	cafeCode  NUMBER(5)      NOT NULL, 					-- 카페코드
	drinkName VARCHAR2(25)   NOT NULL, 					-- 상품명
	img       VARCHAR2(50)   default 'noimage.jpg',     -- 이미지
	price     NUMBER(10)     default 0,        		  	-- 가격
	mileage   NUMBER(10)     default 0,       		    -- 마일리지
	spec      VARCHAR2(10)   default 'none',   		  	-- 스펙
	num       NUMBER(10)     default 0,        		  	-- 상품수량
	beanType  VARCHAR2(30)   default 'none',   		  	-- 원두종류
	rdate     VARCHAR2(15)   default '00/00/00' 		-- 로스팅날짜
);
-- alter session set NLS_DATE_FORMAT='YY/MM/DD';

-- 상품 기본키
CREATE UNIQUE INDEX PK_DRINK
	ON DRINK ( -- 상품
		drinkCode ASC -- 상품코드
	);

-- 상품
ALTER TABLE DRINK
	ADD
		CONSTRAINT PK_DRINK -- 상품 기본키
		PRIMARY KEY (
			drinkCode -- 상품코드
		);

-- 상품
ALTER TABLE DRINK
	ADD
		CONSTRAINT FK_CAFE_TO_DRINK -- 카페 -> 상품
		FOREIGN KEY (
			cafeCode -- 카페코드
		)
		REFERENCES CAFE ( -- 카페
			cafeCode -- 카페코드
		);

-- 음료코드 관련 시퀀스 생성
DROP SEQUENCE DRINK_DRINK_SEQ;

CREATE SEQUENCE DRINK_DRINK_SEQ
START WITH 1
INCREMENT BY 1
NOCACHE;

-- 1. 투썸플레이스
insert into drink(drinkCode, cafeCode, drinkName, img, price, mileage, beanType, rdate)
values (1, 1, '에스프레소 싱글', 'espressosingle.PNG', 3300, 330, '인도네시아 수마트라 만델링', '16/06/02');
insert into drink(drinkCode, cafeCode, drinkName, img, price, mileage, spec, beanType, rdate)
values (DRINK_DRINK_SEQ.NEXTVAL, 1, '카페아메리카노', 'cafeamericano.PNG', 4100, 410, 'BEST', '인도네시아 수마트라 만델링', '16/06/01');
insert into drink(drinkCode, cafeCode, drinkName, img, price, mileage, beanType, rdate)
values (DRINK_DRINK_SEQ.NEXTVAL, 1, '바닐라라떼', 'vanillalatte.PNG', 4900, 490, '인도네시아 수마트라 만델링', '16/06/02');
insert into drink(drinkCode, cafeCode, drinkName, img, price, mileage, beanType, rdate)
values (DRINK_DRINK_SEQ.NEXTVAL, 1, '카페모카', 'cafemocha.PNG', 4900, 490, '인도네시아 수마트라 만델링', '16/06/01');
insert into drink(drinkCode, cafeCode, drinkName, img, price, mileage, beanType, rdate)
values (DRINK_DRINK_SEQ.NEXTVAL, 1, '숏라떼', 'shortlatte.PNG', 4400, 440, '인도네시아 수마트라 만델링', '16/06/01');
insert into drink(drinkCode, cafeCode, drinkName, img, price, mileage, beanType, rdate)
values (DRINK_DRINK_SEQ.NEXTVAL, 1, '롱블랙', 'longblack.PNG', 4100, 410, '인도네시아 수마트라 만델링', '16/06/02');
insert into drink(drinkCode, cafeCode, drinkName, img, price, mileage, spec)
values (DRINK_DRINK_SEQ.NEXTVAL, 1, '카푸치노', 'capuccino.PNG', 4400, 440, 'HIT');
insert into drink(drinkCode, cafeCode, drinkName, img, price, mileage, spec)
values (DRINK_DRINK_SEQ.NEXTVAL, 1, '자몽에이드', 'grapefruitade.PNG', 5500, 550, 'BEST');
insert into drink(drinkCode, cafeCode, drinkName, img, price, mileage, spec)
values (DRINK_DRINK_SEQ.NEXTVAL, 1, '요거프라페', 'yourtfrappe.PNG', 5800, 580, 'NEW');
insert into drink(drinkCode, cafeCode, drinkName, img, price, mileage)
values (DRINK_DRINK_SEQ.NEXTVAL, 1, '로얄밀크티', 'royalmilktea.PNG', 5500, 550);

-- 2. beanbrothers
insert into drink(drinkCode, cafeCode, drinkName, img, price, mileage, beanType, rdate)
values (DRINK_DRINK_SEQ.NEXTVAL, 2, '아메리카노', 'americano.PNG', 5000, 500, '온두라스 엘 피노', '16/06/03');
insert into drink(drinkCode, cafeCode, drinkName, img, price, mileage, beanType, rdate)
values (DRINK_DRINK_SEQ.NEXTVAL, 2, '라떼', 'latte.PNG', 5500, 550, '브라질 하이냐', '16/06/03');
insert into drink(drinkCode, cafeCode, drinkName, img, price, mileage, beanType, rdate)
values (DRINK_DRINK_SEQ.NEXTVAL, 2, '아포가토', 'affogato.PNG', 7000, 700, '온두라스 엘 피노', '16/06/03');
insert into drink(drinkCode, cafeCode, drinkName, img, price, mileage, beanType, rdate)
values (DRINK_DRINK_SEQ.NEXTVAL, 2, '라떼바닐라', 'vanillalatte.PNG', 6000, 60, '브라질 하이냐', '16/06/02');

-- 3. caffebene
insert into drink(drinkCode, cafeCode, drinkName, img, price, mileage, beanType, rdate)
values (DRINK_DRINK_SEQ.NEXTVAL, 3, '아메리카노', 'americano.PNG', 3800, 380, '에티오피아 예가체프', '16/06/02');
insert into drink(drinkCode, cafeCode, drinkName, img, price, mileage, beanType, rdate)
values (DRINK_DRINK_SEQ.NEXTVAL, 3, '카라멜마끼아또', 'caramelmacchiato.PNG', 4800, 480, '에티오피아 시다모 G2', '16/06/02');
insert into drink(drinkCode, cafeCode, drinkName, img, price, mileage, beanType, rdate)
values (DRINK_DRINK_SEQ.NEXTVAL, 3, '에스프레소콘파냐', 'espressoconpanna.PNG', 3800, 380, '에티오피아 예가체프', '16/06/02');
insert into drink(drinkCode, cafeCode, drinkName, img, spec, price, mileage)
values (DRINK_DRINK_SEQ.NEXTVAL, 3, '그린티프라페노', 'greenteafranppeno.PNG', 'HIT', 5500, 550);
insert into drink(drinkCode, cafeCode, drinkName, img, price, mileage)
values (DRINK_DRINK_SEQ.NEXTVAL, 3, '얼그레이', 'earlgrey.PNG', 4000, 400);
insert into drink(drinkCode, cafeCode, drinkName, img, price, mileage)
values (DRINK_DRINK_SEQ.NEXTVAL, 3, '캐모마일', 'chamomile.PNG', 4000, 400);
insert into drink(drinkCode, cafeCode, drinkName, img, spec, price, mileage)
values (DRINK_DRINK_SEQ.NEXTVAL, 3, '오리지널모히또', 'originalmojito.PNG', 'NEW', 6300, 630);
insert into drink(drinkCode, cafeCode, drinkName, img, price, mileage)
values (DRINK_DRINK_SEQ.NEXTVAL, 3, '오렌지주스', 'orangejuice.PNG', 5800, 580);
insert into drink(drinkCode, cafeCode, drinkName, img, price, mileage)
values (DRINK_DRINK_SEQ.NEXTVAL, 3, '타로버블티', 'tarobubbletea.PNG', 6300, 630);

-- 4. coffeebean
insert into drink(drinkCode, cafeCode, drinkName, img, price, mileage, beanType, rdate)
values (DRINK_DRINK_SEQ.NEXTVAL, 4, '커피빈커피', 'coffeebeancoffee.PNG', 5000, 500, '코스타리카 SHB 따라주', '16/06/03');
insert into drink(drinkCode, cafeCode, drinkName, img, price, mileage, beanType, rdate)
values (DRINK_DRINK_SEQ.NEXTVAL, 4, '아메리카노', 'americano.PNG', 4500, 450, '코스타리카 SHB 따라주', '16/06/03');
insert into drink(drinkCode, cafeCode, drinkName, img, price, mileage, beanType, rdate)
values (DRINK_DRINK_SEQ.NEXTVAL, 4, '헤이즐넛라떼', 'hazelnutlatte.PNG', 5900, 590, '과테말라 안티구아 SHB', '16/06/03');
insert into drink(drinkCode, cafeCode, drinkName, img, price, mileage, beanType, rdate)
values (DRINK_DRINK_SEQ.NEXTVAL, 4, '모카라떼', 'mochalatte.PNG', 5500, 550, '과테말라 안티구아 SHB', '16/06/03');
insert into drink(drinkCode, cafeCode, drinkName, img, price, mileage)
values (DRINK_DRINK_SEQ.NEXTVAL, 4, '아이스더블초콜렛', 'icedoublechocolate.PNG', 5300, 530);
insert into drink(drinkCode, cafeCode, drinkName, img, price, mileage)
values (DRINK_DRINK_SEQ.NEXTVAL, 4, '화이트초콜렛드림라떼', 'whitechocolatedreamlatte.PNG', 5900, 590);
insert into drink(drinkCode, cafeCode, drinkName, img, spec, price, mileage)
values (DRINK_DRINK_SEQ.NEXTVAL, 4, '차이라떼', 'chailatte.PNG', 'HIT', 5500, 550);
insert into drink(drinkCode, cafeCode, drinkName, img, price, mileage)
values (DRINK_DRINK_SEQ.NEXTVAL, 4, '잉글리쉬 블랙퍼스트', 'englishbreakfast.PNG', 4800, 480);
insert into drink(drinkCode, cafeCode, drinkName, img, spec, price, mileage)
values (DRINK_DRINK_SEQ.NEXTVAL, 4, '베리베리아이스블렌디드', 'berryberryiceblended.PNG', 'NEW', 6800, 680);

-- 5. droptop
insert into drink(drinkCode, cafeCode, drinkName, img, price, mileage, beanType, rdate)
values (DRINK_DRINK_SEQ.NEXTVAL, 5, '아메리카노', 'americano.PNG', 4100, 410, '브라질 산토스', '16/06/03');
insert into drink(drinkCode, cafeCode, drinkName, img, price, mileage, beanType, rdate)
values (DRINK_DRINK_SEQ.NEXTVAL, 5, '플랫화이트', 'flatwhite.PNG', 4600, 460, '브라질 산토스', '16/06/02');
insert into drink(drinkCode, cafeCode, drinkName, img, price, mileage, beanType, rdate)
values (DRINK_DRINK_SEQ.NEXTVAL, 5, '카푸치노', 'capuccino.PNG', 4600, 460, '브라질 산토스', '16/06/02');
insert into drink(drinkCode, cafeCode, drinkName, img, spec, price, mileage, beanType, rdate)
values (DRINK_DRINK_SEQ.NEXTVAL, 5, '홍차커피', 'blackteacoffee.PNG', 'NEW', 5300, 530, '브라질 산토스', '16/06/01');
insert into drink(drinkCode, cafeCode, drinkName, img, price, mileage)
values (DRINK_DRINK_SEQ.NEXTVAL, 5, '메이플라떼', 'maplelatte.PNG', 5500, 550);
insert into drink(drinkCode, cafeCode, drinkName, img, spec, price, mileage)
values (DRINK_DRINK_SEQ.NEXTVAL, 5, '오렌지블랑', 'orangeblanc.PNG', 'NEW', 5300, 530);

-- 6. ediya
insert into drink(drinkCode, cafeCode, drinkName, img, price, mileage, beanType, rdate)
values (DRINK_DRINK_SEQ.NEXTVAL, 6, '에스프레소마끼아또', 'espressomacchiato.PNG', 2800, 280, '엘살바도르 팬시', '16/06/01');
insert into drink(drinkCode, cafeCode, drinkName, img, price, mileage, beanType, rdate)
values (DRINK_DRINK_SEQ.NEXTVAL, 6, '카페모카', 'caffemocha.PNG', 3500, 350, '엘살바도르 팬시', '16/06/01');
insert into drink(drinkCode, cafeCode, drinkName, img, price, mileage, beanType, rdate)
values (DRINK_DRINK_SEQ.NEXTVAL, 6, '카라멜마끼아또', 'caramelmacchiato.PNG', 3500, 350, '말라위 AAA+', '16/06/01');
insert into drink(drinkCode, cafeCode, drinkName, img, price, mileage)
values (DRINK_DRINK_SEQ.NEXTVAL, 6, '시나몬모카', 'cinnamonmocha.PNG', 3800, 380);
insert into drink(drinkCode, cafeCode, drinkName, img, price, mileage)
values (DRINK_DRINK_SEQ.NEXTVAL, 6, '망고플랫치노', 'mangoflatccino.PNG', 3500, 350);
insert into drink(drinkCode, cafeCode, drinkName, img, price, mileage)
values (DRINK_DRINK_SEQ.NEXTVAL, 6, '블루베리요거트플랫치노', 'blueberryyogurtflatccino.PNG', 4200, 420);
insert into drink(drinkCode, cafeCode, drinkName, img, price, mileage)
values (DRINK_DRINK_SEQ.NEXTVAL, 6, '그린애플플랫치노', 'greenappleflatccino.PNG', 3800, 380);
insert into drink(drinkCode, cafeCode, drinkName, img, price, mileage)
values (DRINK_DRINK_SEQ.NEXTVAL, 6, '로즈쟈스민티', 'rosejasminetea.PNG', 2800, 280);
insert into drink(drinkCode, cafeCode, drinkName, img, price, mileage)
values (DRINK_DRINK_SEQ.NEXTVAL, 6, '밀크티', 'milktea.PNG', 4200, 420);

-- 7. hollys
insert into drink(drinkCode, cafeCode, drinkName, img, price, mileage, beanType, rdate)
values (DRINK_DRINK_SEQ.NEXTVAL, 7, '아메리카노', 'americano.PNG', 4100, 410, '콜롬비아 수프리모', '16/06/03');
insert into drink(drinkCode, cafeCode, drinkName, img, price, mileage, beanType, rdate)
values (DRINK_DRINK_SEQ.NEXTVAL, 7, '리스트레토크림라떼', 'ristrettocreamlatte.PNG', 5600, 560, '콜롬비아 수프리모', '16/06/02');
insert into drink(drinkCode, cafeCode, drinkName, img, price, mileage)
values (DRINK_DRINK_SEQ.NEXTVAL, 7, '고구마라떼', 'sweetpotatolatte.PNG', 5500, 550);
insert into drink(drinkCode, cafeCode, drinkName, img, price, mileage, spec)
values (DRINK_DRINK_SEQ.NEXTVAL, 7, '리얼벨지안초콜렛', 'realbelgianchocolate.PNG', 5700, 570, 'BEST');
insert into drink(drinkCode, cafeCode, drinkName, img, price, mileage)
values (DRINK_DRINK_SEQ.NEXTVAL, 7, '페퍼민트', 'peppermint.PNG', 4300, 430);
insert into drink(drinkCode, cafeCode, drinkName, img, price, mileage)
values (DRINK_DRINK_SEQ.NEXTVAL, 7, '루이보스페시카', 'rooibospersica.PNG', 4300, 430);
insert into drink(drinkCode, cafeCode, drinkName, img, price, mileage, spec)
values (DRINK_DRINK_SEQ.NEXTVAL, 7, '청포도스파클링', 'greengrapesparkling.PNG', 5500, 550, 'BEST');
insert into drink(drinkCode, cafeCode, drinkName, img, price, mileage)
values (DRINK_DRINK_SEQ.NEXTVAL, 7, '레드베리아이스티', 'veryberryblendtea.PNG', 4800, 480);

-- 8. paiks
insert into drink(drinkCode, cafeCode, drinkName, img, price, mileage, beanType, rdate)
values (DRINK_DRINK_SEQ.NEXTVAL, 8, '앗메리카노', 'atmericano.PNG', 2000, 200, '탄자니아 AA 킬리만자로', '16/06/01');
insert into drink(drinkCode, cafeCode, drinkName, img, price, mileage, beanType, rdate, spec)
values (DRINK_DRINK_SEQ.NEXTVAL, 8, '원조냉커피', 'originalicecoffee.PNG', 2500, 250, '탄자니아 AA 킬리만자로', '16/06/01', 'HIT');
insert into drink(drinkCode, cafeCode, drinkName, img, price, mileage, beanType, rdate)
values (DRINK_DRINK_SEQ.NEXTVAL, 8, '옛다방커피', 'oldcafecoffee.PNG', 2000, 200, '탄자니아 AA 킬리만자로', '16/06/01');
insert into drink(drinkCode, cafeCode, drinkName, img, price, mileage, beanType, rdate)
values (DRINK_DRINK_SEQ.NEXTVAL, 8, '빽스라떼', 'paikslatte.PNG', 3000, 300, '탄자니아 AA 킬리만자로', '16/06/01');
insert into drink(drinkCode, cafeCode, drinkName, img, price, mileage, beanType, rdate, spec)
values (DRINK_DRINK_SEQ.NEXTVAL, 8, '아이리쉬에스프레소', 'irishespresso.PNG', 2500, 250, '탄자니아 AA 킬리만자로', '16/06/01', 'NEW');
insert into drink(drinkCode, cafeCode, drinkName, img, price, mileage, beanType, rdate, spec)
values (DRINK_DRINK_SEQ.NEXTVAL, 8, '몽키빠나나마키아또', 'monkeybananamacchiato.PNG', 3500, 350, '탄자니아 AA 킬리만자로', '16/06/01', 'NEW');

-- 9. pascucci
insert into drink(drinkCode, cafeCode, drinkName, img, price, mileage, beanType, rdate)
values (DRINK_DRINK_SEQ.NEXTVAL, 9, '에스프레소도피오', 'espressodoppio.PNG', 3800, 380, '쿠바 알투라', '16/06/03');
insert into drink(drinkCode, cafeCode, drinkName, img, price, mileage, beanType, rdate)
values (DRINK_DRINK_SEQ.NEXTVAL, 9, '오리지널드립커피', 'originaldripcoffee.PNG', 3900, 390, '쿠바 알투라', '16/06/03');
insert into drink(drinkCode, cafeCode, drinkName, img, price, mileage, beanType, rdate)
values (DRINK_DRINK_SEQ.NEXTVAL, 9, '카페라떼', 'caffelatte.PNG', 4500, 450, '멕시코 알투라', '16/06/02');
insert into drink(drinkCode, cafeCode, drinkName, img, price, mileage, beanType, rdate)
values (DRINK_DRINK_SEQ.NEXTVAL, 9, '샤케라또', 'shakerato.PNG', 4800, 480, '멕시코 알투라', '16/06/02');
insert into drink(drinkCode, cafeCode, drinkName, img, price, mileage, beanType, rdate, spec)
values (DRINK_DRINK_SEQ.NEXTVAL, 9, '티라미스모카', 'tiramisumocha.PNG', 5500, 550, '멕시코 알투라', '16/06/02', 'NEW');
insert into drink(drinkCode, cafeCode, drinkName, img, price, mileage, spec)
values (DRINK_DRINK_SEQ.NEXTVAL, 9, '자바칩민트그라니따', 'javachipmintgranita.PNG', 6000, 600, 'BEST');
insert into drink(drinkCode, cafeCode, drinkName, img, price, mileage)
values (DRINK_DRINK_SEQ.NEXTVAL, 9, '그린티라떼', 'greentealatte.PNG', 5000, 500);
insert into drink(drinkCode, cafeCode, drinkName, img, price, mileage)
values (DRINK_DRINK_SEQ.NEXTVAL, 9, '유자레몬티', 'yujalemontea.PNG', 5500, 550);
insert into drink(drinkCode, cafeCode, drinkName, img, price, mileage)
values (DRINK_DRINK_SEQ.NEXTVAL, 9, '복숭아그라니따', 'peachgranita.PNG', 6300, 630);

-- 10. starbucks
insert into drink(drinkCode, cafeCode, drinkName, img, price, mileage, beanType, rdate)
values (DRINK_DRINK_SEQ.NEXTVAL, 10, '아메리카노', 'americano.PNG', 3600, 360, '베란다 블렌드', '16/06/02');
insert into drink(drinkCode, cafeCode, drinkName, img, price, mileage, beanType, rdate)
values (DRINK_DRINK_SEQ.NEXTVAL, 10, '돌체라떼', 'dolcelatte.PNG', 5100, 510, '베란다 블렌드', '16/06/02');
insert into drink(drinkCode, cafeCode, drinkName, img, price, mileage, beanType, rdate)
values (DRINK_DRINK_SEQ.NEXTVAL, 10, '카페라떼', 'caffelatte.PNG', 4100, 410, '베란다 블렌드', '16/06/02');
insert into drink(drinkCode, cafeCode, drinkName, img, price, mileage, beanType, rdate)
values (DRINK_DRINK_SEQ.NEXTVAL, 10, '카푸치노', 'capuccino.PNG', 4100, 410, '카티 카티 블렌드', '16/06/02');
insert into drink(drinkCode, cafeCode, drinkName, img, price, mileage, beanType, rdate)
values (DRINK_DRINK_SEQ.NEXTVAL, 10, '카페모카', 'caffemocha.PNG', 4600, 460, '프렌치 로스트', '16/06/02');
insert into drink(drinkCode, cafeCode, drinkName, img, price, mileage, beanType, rdate)
values (DRINK_DRINK_SEQ.NEXTVAL, 10, '카라멜프라푸치노', 'caramelfrappuccino.PNG', 5600, 560, '프렌치 로스트', '16/06/02');
insert into drink(drinkCode, cafeCode, drinkName, img, price, mileage, spec)
values (DRINK_DRINK_SEQ.NEXTVAL, 10, '체리블라썸라떼', 'cherryblossomlatte.PNG', 5900, 590, 'HIT');
insert into drink(drinkCode, cafeCode, drinkName, img, price, mileage)
values (DRINK_DRINK_SEQ.NEXTVAL, 10, '아보카도요거트블렌디드', 'avocadoyogurtblended.PNG', 6700, 670);
insert into drink(drinkCode, cafeCode, drinkName, img, price, mileage)
values (DRINK_DRINK_SEQ.NEXTVAL, 10, '딸기요거트블렌디드', 'strawberryyogurtblended.PNG', 6100, 610);
insert into drink(drinkCode, cafeCode, drinkName, img, price, mileage)
values (DRINK_DRINK_SEQ.NEXTVAL, 10, '히비스커스블렌드티', 'hibiscusblendbrewedtea.PNG', 4100, 410);
insert into drink(drinkCode, cafeCode, drinkName, img, price, mileage, spec)
values (DRINK_DRINK_SEQ.NEXTVAL, 10, '쿨라임피지오', 'coollimefizzio.PNG', 5900, 590, 'NEW');
insert into drink(drinkCode, cafeCode, drinkName, img, price, mileage)
values (DRINK_DRINK_SEQ.NEXTVAL, 10, '선라이즈애플주스', 'sunriseapplejuice.PNG', 5900, 590);

-- 11. thekind
insert into drink(drinkCode, cafeCode, drinkName, img, price, mileage, beanType, rdate)
values (DRINK_DRINK_SEQ.NEXTVAL, 11, '에스프레소', 'espresso.PNG', 2300, 230, '콜롬비아 레인포레스트', '16/06/03');
insert into drink(drinkCode, cafeCode, drinkName, img, price, mileage, beanType, rdate)
values (DRINK_DRINK_SEQ.NEXTVAL, 11, '화이트 카페모카', 'cafewhitemocha.PNG', 3300, 330, '엘살바도르 모비딕', '16/06/03');
insert into drink(drinkCode, cafeCode, drinkName, img, price, mileage, beanType, rdate)
values (DRINK_DRINK_SEQ.NEXTVAL, 11, '헤이즐넛라떼', 'hazelnutlatte.PNG', 3500, 350, '탄자니아 사비', '16/06/03');
insert into drink(drinkCode, cafeCode, drinkName, img, price, mileage, spec)
values (DRINK_DRINK_SEQ.NEXTVAL, 11, '검은콩프라페', 'blackbeanfrappe.PNG', 3500, 350, 'NEW');

-- 12. tomntoms
insert into drink(drinkCode, cafeCode, drinkName, img, price, mileage, beanType, rdate, spec)
values (DRINK_DRINK_SEQ.NEXTVAL, 12, '싱글오리진커피', 'singleorigincoffee.PNG', 6500, 650, '에티오피아 예가체프 G2', '16/06/02', 'BEST');
insert into drink(drinkCode, cafeCode, drinkName, img, price, mileage, beanType, rdate)
values (DRINK_DRINK_SEQ.NEXTVAL, 12, '시나몬카페모카', 'cinnamoncafemocha.PNG', 5000, 500, '에티오피아 시다모 G4', '16/06/02');
insert into drink(drinkCode, cafeCode, drinkName, img, price, mileage, beanType, rdate)
values (DRINK_DRINK_SEQ.NEXTVAL, 12, '카라멜마끼아또', 'caramelmacchiato.PNG', 4800, 480, '동티모르AAA', '16/06/01');
insert into drink(drinkCode, cafeCode, drinkName, img, price, mileage, beanType, rdate)
values (DRINK_DRINK_SEQ.NEXTVAL, 12, '홍삼카페라떼', 'redginsengcafelatte.PNG', 5500, 550, '동티모르AAA', '16/06/01');
insert into drink(drinkCode, cafeCode, drinkName, img, price, mileage)
values (DRINK_DRINK_SEQ.NEXTVAL, 12, '월넛치노', 'walnutccino.PNG', 5300, 530);
insert into drink(drinkCode, cafeCode, drinkName, img, price, mileage)
values (DRINK_DRINK_SEQ.NEXTVAL, 12, '그린민트초콜릿', 'greenmintchocolate.PNG', 5000, 500);
insert into drink(drinkCode, cafeCode, drinkName, img, price, mileage, spec)
values (DRINK_DRINK_SEQ.NEXTVAL, 12, '코코넛밀크치노', 'coconutmilkccino.PNG', 6500, 650, 'NEW');
insert into drink(drinkCode, cafeCode, drinkName, img, price, mileage)
values (DRINK_DRINK_SEQ.NEXTVAL, 12, '망고슬러쉬', 'mangoslush.PNG', 3800, 380);

rollback;
select * from drink order by drinkcode desc;
select * from drink where spec='HIT' order by drinkcode desc;
commit;
-- 수정문
update drink set 컬럼명=수정값 where 조건;


select * from cafe;
select * from cafe order by cafeCode;

alter table drink add updir varchar2(50);
-- updir은 /atwosomeplace/와 같이 상위 디렉토리를 지정 후 VO에 추가

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
/* 알파벳 대, 소문자, 숫자, _까지 허용 */
var isUserid=function(obj){
	var	uidVal=obj.value;	// 아이디 입력값
	// '/'는 쌍따옴표 같은 역할
	// ^는 시작, $는 끝을 의미.
	// [] 뒤 +는 하나 이상을 의미
	var pattern = new RegExp(/^[a-zA-Z0-9_!]{4,16}$/);
	var bool=pattern.test(uidVal);
	
	// 사용자가 입력한 값이 패턴에 맞으면 true 반환. 아니면 false를 반환.
	//alert("bool = "+bool);
	return bool;
}

/* 0~9 사이의 숫자, -, + 기호로 시작하거나 끝나야한다. */
var isTel=function(obj){
	var	telVal=obj.value;	// 전화번호 입력값
	var pattern = new RegExp(/^[0-9-+]+$/);
	var bool=pattern.test(telVal);
				
	return bool;
	
	/*
	^	: 시작을 의미
	$	: 끝을 의미
	a-z	: 알파벳 소문자
	A-Z	: 알파벳 대문자
	0-9	: 숫자
	+	: 패턴이 한 번 이상 반복된다는 의미
	*/
}

/* 앞자리는 (010|011)중에 하나 - hp2(숫자 3~4자리) - hp3(숫자 4자리) */
var isHp=function(obj){
	var hpVal=obj.value;
	var pattern = new RegExp(/\b(010|011)[-]\d{3,4}[-]\d{4}\b/);
	var bool=pattern.test(hpVal);
	
	return bool;
}		

/* 생년월일 날짜 유형 체크
yyyy-MM-dd 또는 yyyy/MM/dd
[0-9]{4} */
var isDate=function(obj){
	var dateVal=obj.value;
	// '/'를 줄때는 역슬래시(escape문자)와 함께 써줘야한다.
	// 월에 {1,2}와 같이 쓴 것은 1자리 또는 2자리 입력가능하도록.
	var pattern=new RegExp(/\b\d{4}[-\/]\d{1,2}[-\/]\d{1,2}\b/);
	return pattern.test(dateVal);
	/*
	\b		: 단어의 경계를 나타내며, 해당 패턴이 정확히 일치해야 함을 의미한다.
	\d{4}	: 숫자 4개가 나와야 한단 의미
	[-\/]	: 하이픈(-)이나 슬래시(/)를 허용하겠단 의미
	\d{1,2}	: 숫자가 1개 또는 2개 올 수 있다는 의미
	*/
}

/* 이메일 형식 체크
as123@naver.com
알파벳+숫자+하이픈+언더바 조합으로 5~12자리 => as-134[5,12]
@가 와야 하고
알파벳소문자[2, 10]
.(1개 오던지 생략 가능. 여러 개는 안됨)
알파벳 소문자[2,3] */
var isEmail=function(obj){
	var emailVal=obj.value;
	/* yahoo.co.kr과 같이 .co 부분은 naver.com과 
	같은 경우에는 생략 가능하므로 ([a-z]{2,3}[\.])?로 표기. */ 
	var pattern=new RegExp(/^[\w-_]{3,12}[@][a-z]{2,10}[\.]([a-z]{2,3}[\.])?[a-z]{2,3}$/);
	return pattern.test(emailVal);
}
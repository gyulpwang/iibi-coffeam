<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script type="text/javascript" src="../js/common.js"></script>
<script type="text/javascript">
	/* 아이디 중복 체크 ========== */
	var idCheck=function(){
		var url = "idCheck.jsp";
		// widow.open(url, "제목", "속성들");
		win = window.open(url, "idCheck", "width=400, height=250, left=100, top=200");
	}
	
	/* 입력값 유효성 체크 ========== */
	var check=function(){
		// alert('check');
		// 이름, 아이디, 비밀번호, 연락처 값 입력 안했을 경우 alert() 띄우기
		// ==로 할 경우 =로 입력하는 실수를 줄이기 위해 ! 사용 습관 들이자.
		if(!f.name.value){
			alert('이름을 입력하세요.');
			f.name.focus();
			return;
		}
		if(!f.userid.value){
			alert('아이디를 입력하세요.');
			f.userid.focus();
			return;
		}
		if(!f.pwd.value){
			alert('비밀번호를 입력하세요.');
			f.pwd.focus();
			return;
		}
		if(f.pwd.value != f.pwd2.value){
			alert('비밀번호와 비밀번호 확인이 달라요.');
			f.pwd2.select();
			return;
		}
		if(!f.email.value){
			alert('Email이 입력되지 않았습니다.');
			f.email.focus();
			return;
		}
		if(!f.hp1.value || !f.hp2.value || !f.hp3.value){
			alert('연락처를 모두 입력하세요.');
			f.hp2.focus();
			return;
		}
		// isNaN() : is Not a Number. 숫자가 아니면 true, 숫자면 false 반환
		if(isNaN(f.hp2.value)){
			alert('연락처는 숫자여야 해요.');
			f.hp2.select();
			return;
		}
		if(isNaN(f.hp3.value)){
			alert('연락처는 숫자여야 해요.');
			f.hp3.select();
			return;
		}
		// 이용 약관 체크 여부
		if(!f.agree.checked){
			alert('이용 약관에 동의해야 합니다.');
			f.agree.focus();
			return;
		}
		// 아이디 형식 체크
		if(!isUserid(f.userid)){
			alert("아이디는 영문자, 숫자, _만 가능해요.");
			f.userid.select();
			return;
		}
		// 이메일 형식 체크
		if(!isEmail(f.email)){
			alert("이메일 형식에 맞지 않아요.");
			f.email.select();
			return;
		}
		f.submit();	// 서버에 전송
		$('#mypage').addClass('active');
	}
</script>
    
<!-- 액션 안에 스페이스가 들어가면 오류 나기 때문에 바로 닫아버림. -->
<jsp:include page="/coffeam_top.jsp"/>
<script type="text/javascript">$('#mypage').addClass('active');</script>
<jsp:include page="/coffeam_noticeAside.jsp"/>
<div class="col-md-12">
<div class="row box">
	<form name="f" id="f" method="post" action="memberJoin.jsp">
	<table class="table table-responsive">
		<thead>
			<tr class="tableTitle">
				<th colspan="2"><h3><b>회원가입</b></h3></th>
			</tr>
		</thead>
		<tbody>
			<tr>
				<th width="30%">이름</th>
				<td width="70%">
					<input type="text" name="name" id="name" size="20" class="form-control">
				</td>
			</tr>
			<tr>
				<th>아이디</th>
				<td>
					<!-- readonly -->
					<input type="text" name="userid" id="userid"
					readonly style='background-color:silver' size="20">
					<button type="button" class="btn btn-default" onclick="idCheck()">아이디 중복 체크</button>
				</td>
			</tr>
			<tr>
				<th>비밀번호</th>
				<td>
					<input type="password" name="pwd" id="pwd" size="20" class="form-control">
				</td>
			</tr>
			<tr>
				<th width="20%">비밀번호 확인</th>
				<td width="80%">
					<input type="password" name="pwd2" id="pwd2" size="20" class="form-control">
				</td>
			</tr>
			<tr>
				<th width="20%">이메일</th>
				<td width="80%">
					<input type="email" name="email" id="email" size="20" class="form-control">
				</td>
			</tr>
			<tr>
				<th width="20%">연락처</th>
				<td width="80%">
					<select name="hp1" id="hp1">
						<optgroup label="연락처">
							<option value="010">010</option>
							<option value="011">011</option>
						</optgroup>
					</select>
					 - <input type="tel" name="hp2" id="hp2" size="6" maxlength="4">
					 - <input type="tel" name="hp3" id="hp3" size="6" maxlength="4">
				</td>
			</tr>
			<tr>
				<th width="20%">선호메뉴</th>
				<td width="80%">
					<select name="favorite" id="favorite">
						<optgroup label="선호하는 음료를 선택해주세요.">
							<option value="espresso">에스프레소</option>
							<option value="americano">아메리카노</option>
							<option value="caffelatte">카페라떼</option>
							<option value="capuccino">카푸치노</option>
							<option value="caffemocha">카페모카</option>
							<option value="caramelmacchiato">카라멜마끼아또</option>
							<option value="etc">그 외</option>
						</optgroup>
					</select>
			</tr>
			<tr>
				<th colspan="2" style="text-align:right">이용약관에 동의하십니까?&ensp;
					<input type="checkbox" name="agree" id="agree"> 동의
				</th>
			</tr>
			<tr>
				<td colspan="2" style="text-align:center">
					<iframe src="agree.html" width="95%" height="160px"></iframe>
				</td>
			</tr>
			<tr>
				<td colspan="2" style="text-align:center">
					<button type="button" class="btn btn-danger" onclick="check()">회원가입</button>
					<button type="reset" class="btn btn-default">다시쓰기</button>
				</td>
			</tr>
		</tbody>
	</table>
	</form>
	</div>
</div>
<jsp:include page = "/coffeam_best.jsp"/>
<jsp:include page = "/coffeam_foot.jsp"/>
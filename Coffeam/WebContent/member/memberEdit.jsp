<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="user.member.*" %>
<%@ include file="/include/function.jsp" %>
    
<script type="text/javascript">
	/* 아이디 중복 체크 ========== */
	var idCheck=function(){
		var url = "idCheck.jsp";
		// widow.open(url, "제목", "속성들");
		win = window.open(url, "idCheck", "width=400, height=200, left=100, top=100");
	}

	var delUser = function(idx){
		var yn = confirm('정말 회원탈퇴하시겠습니까?');
		if(yn){
			// 삭제 페이지로 이동. 파라미터로 idx를 달고 가야 삭제 가능
			location.href = "memberDel.jsp?idx="+idx;
		}
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
		f.submit();	// 서버에 전송
	}
</script>
    
<!-- 액션 안에 스페이스가 들어가면 오류 나기 때문에 바로 닫아버림. -->
<jsp:include page="/coffeam_top.jsp"/>
<script type="text/javascript">$('#mypage').addClass('active');</script>
<jsp:include page="/coffeam_noticeAside.jsp"/>
<jsp:useBean id="cdao" class="user.member.MemberDAO" scope="session" />
<%
	// 회원 번호 받기
	String idxStr=request.getParameter("idx");
	if(idxStr == null || idxStr.trim().isEmpty()){
		response.sendRedirect(request.getContextPath()+"/coffeam/coffeam_Home.jsp");
		return;
	}
	MemberVO cvo=cdao.findMemberByIdx(new Integer(idxStr.trim()));
	if(cvo == null){
		goBack("존재하지 않는 회원입니다.", out);
		return;
	}
%>
<div class="col-md-12" align="center">
	<div class="row box">
	<form name="f" id="f" method="post" action="memberEditEnd.jsp">
	<table class="table">
		<thead>
			<tr class="tableTitle">
				<th colspan="3"><h3><b>회원정보수정</b></h3></th>
			</tr>
		</thead>
		<tbody>
			<tr>
				<th width="30%">회원번호</th>
				<td width="80%" colspan="2">
					<input type="text" name="idx" id="idx" value="<%=idxStr%>" readonly style="background-color:silver" class="form-control">
				</td>
			</tr>
			<tr>
				<th width="30%">이름</th>
				<td width="80%" colspan="2">
					<input type="text" name="name" id="name" value="<%=cvo.getName()%>" size="25" class="form-control">
				</td>
			</tr>
			<tr>
				<th width="30%">아이디</th>
				<td width="40%">
					<!-- readonly -->
					<input type="text" name="userid" id="userid"
					readonly style='background-color:silver' value="<%=cvo.getUserid()%>" size="25" class="form-control">
				</td>
				<td align="right" width="30%">
					<button type="button" class="btn btn-default" onclick="idCheck()">아이디 중복 체크</button>
				</td>
			</tr>
			<tr>
				<th width="30%">비밀번호</th>
				<td width="80%" colspan="2">
					<input type="password" name="pwd" id="pwd" value="<%=cvo.getPwd()%>" size="25" class="form-control">
				</td>
			</tr>
			<tr>
				<th width="30%">비밀번호 확인</th>
				<td width="80%" colspan="2">
					<input type="password" name="pwd2" id="pwd2" value="<%=cvo.getPwd()%>" size="25" class="form-control">
				</td>
			</tr>
			<tr>
				<th width="30%">이메일</th>
				<td width="80%" colspan="2">
					<input type="email" name="email" value="<%=cvo.getEmail()%>" id="email" size="40" class="form-control">
				</td>
			</tr>
			<tr>
				<th width="30%">연락처</th>
				<td width="80%" colspan="2">
				<% String hp1=cvo.getHp1();%>
					<select name="hp1" id="hp1">
						<optgroup label="연락처">
							<option value="010" <%=hp1.equals("010")?"selected":"" %>>010</option>
							<option value="011" <%=hp1.equals("011")?"selected":"" %>>011</option>
						</optgroup>
					</select>
					 - <input type="tel" name="hp2" id="hp2" value="<%=cvo.getHp2()%>" size="6" maxlength="4">
					 - <input type="tel" name="hp3" id="hp3" value="<%=cvo.getHp3()%>" size="6" maxlength="4">
				</td>
			</tr>
			<tr>
				<th width="30%">마일리지</th>
				<td width="50%">
					<input type="text" name="mileage" id="mileage" value="<%=cvo.getMileage()%>" readonly style="background-color:silver" class="form-control">
				</td>
				<td width="20%">
					빈즈
				</td>
			</tr>
			<tr>
			<!-- <div class="dropdown">
			  <button class="btn btn-primary dropdown-toggle" type="button" data-toggle="dropdown">Dropdown Example
			  <span class="caret"></span></button>
			  <ul class="dropdown-menu">
			    <li><a href="#">HTML</a></li>
			    <li><a href="#">CSS</a></li>
			    <li><a href="#">JavaScript</a></li>
			  </ul>
			</div> -->
				<th width="30%">선호메뉴</th>
				<td width="80%" colspan="2">
					<% String favorite = cvo.getFavorite();%>
					<select name="favorite" id="favorite">
						<optgroup label="선호하는 음료를 선택해주세요.">
							<option value="espresso" <%=favorite.equals("espresso")?"selected":"" %>>에스프레소</option>
							<option value="americano" <%=favorite.equals("americano")?"selected":"" %>>아메리카노</option>
							<option value="caffelatte" <%=favorite.equals("caffelatte")?"selected":"" %>>카페라떼</option>
							<option value="capuccino" <%=favorite.equals("capuccino")?"selected":"" %>>카푸치노</option>
							<option value="caffemocha" <%=favorite.equals("caffemocha")?"selected":"" %>>카페모카</option>
							<option value="caramelmacchiato" <%=favorite.equals("caramelmacchiato")?"selected":"" %>>카라멜마끼아또</option>
							<option value="etc" <%=favorite.equals("etc")?"selected":"" %>>그 외</option>
						</optgroup>
					</select>
				</td>
			</tr>
			<tr>
				<td colspan="3" style="text-align:center"><br><br>
					<button type="button" onclick="check()" class="btn btn-warning">정보수정</button>
					<button type="reset" class="btn btn-default">다시쓰기</button>
					<button type="button" onclick="delUser(<%=Integer.parseInt(idxStr)%>)" class="btn btn-danger">회원탈퇴</button>
				</td>
			</tr>
		</tbody>
	</table>
	</form>
	</div>
</div>
<jsp:include page="/coffeam_basket.jsp"/>
<jsp:include page="/coffeam_foot.jsp"/>
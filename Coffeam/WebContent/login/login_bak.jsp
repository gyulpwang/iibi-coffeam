<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="user.member.*" %>

<script type="text/javascript">
	var loginCheck=function(){
		if(!loginF.userid.value){
			alert('아이디를 입력하세요.');
			loginF.userid.focus();
			return;
		}
		if(!loginF.pwd.value){
			alert('비밀번호를 입력하세요.');
			loginF.pwd.focus();
			return;
		}
		loginF.submit();
	}	
</script>

<div class="row box">
<%	// 세션에 저장된 객체를 꺼낸다.(loginUser, loginTime)
	// Object getAttribute(String key)
	MemberVO loginUser=(MemberVO)session.getAttribute("loginUser");
	String loginTime=(String)session.getAttribute("loginTime");
	if(loginUser == null){
		Cookie[] cks = request.getCookies();
		String key = "", val = "";
		boolean isSaveId = false;
		
		if(cks != null){
			for(Cookie c : cks){
				key=c.getName();
				if(key.equals("saveId")){val=c.getValue();	break;}
				isSaveId = true;
			}
		}
%>

	<!-- 로그인 안했을 때는 폼을 보여준다.----------------------- -->
	<form name="loginF" action="<%=request.getContextPath()%>/login/loginEnd.jsp" method="post" class="form-horizontal">
	<table class="table table-responsive">
		<thead>
         	<tr bgcolor="#fad3ca" style="color:#af1817"><th colspan="2"><h3><b>Login</b></h3></th></tr>
        </thead>
        <tbody>
			<tr>
				<th width="30%">아이디</th>
				<th style="text-align:right;"><input type="text" name="userid" id="userid" value="<%=val%>" size="10"></th><!--  size="10" -->
			</tr>
			<tr>
				<th>비밀번호</th>
				<th style="text-align:right;"><input type="password" name="pwd" id="pwd" size="10"></th><!--  size="10" -->
			</tr>
			<tr>
				<td>
					<input type="checkbox" name="saveUid" id="saveUid" 
					<%if(isSaveId)	out.println("checked");%>> 아이디 저장
				</td>
				<td style="text-align:right;">
					<a href="javascript:loginCheck()"><button type="button" class="btn btn-default">로그인</button></a> <!-- &ensp; -->
				</td>
		    </tr>
		    <tr style="text-align: center">
		    	<td>
		    		<a href="<%=request.getContextPath()%>/member/memberJoin.jsp"><button type="button" class="btn btn-default">회원가입</button></a>
		    	</td>
		    	<td>
		    		<span style="text-align:right;"><a href="#"><button type="button" class="btn btn-default">아이디/비밀번호 찾기</button></a></span>
				</td>
			</tr>
		</tbody>
	</table>
	<p>
	</form>
	<!-- 로그인 했을 경우----------------------------------- -->
	<%}else{%>
	<table class="table table-responsive">
		<thead>
			<tr style="background-color:#fad3ca; color:#af1817">
				<td colspan="2">
					<h3><b><span style="color:#af1817;"><%=loginUser.getName()%>
					[<span style="color:red"><%=loginUser.getUserid()%></span>]님</span></b></h3><p>
				</td>
			</tr>
		</thead>
		<tbody>
			<tr>
				<th><span style="color:#af1817;">마일리지</span></th>
				<td><span style="color:#af1817;"><%=loginUser.getMileage()%>빈즈</span></td>
			</tr>
			<tr>
				<th><span style="color:#af1817;">선호메뉴</span></th>
				<td><span style="color:#af1817;"><%=loginUser.getFavorite()%></span></td>
			</tr>
			<tr>
				<th><span style="color:#af1817;">접속시간</span></th>
				<td><span style="color:#af1817;"><%=loginTime%></span></td>
			</tr>
			<tr>
				<td colspan="2" style="text-align:center">
					<a href="<%=request.getContextPath()%>/login/logOut.jsp">
						<button type="button" class="btn btn-default">로그아웃</button>
					</a>
				</td>
			</tr>
		</tbody>
	</table>
	<%}%>
</div>
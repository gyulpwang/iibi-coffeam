<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="user.member.*, java.util.*, java.text.*" %>

<%	DecimalFormat df = new DecimalFormat("###,###");
	SimpleDateFormat sdf = new SimpleDateFormat("yy/MM/dd"); %>
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

	<!-- 로그인 안했을 때는 폼을 보여준다. -->
	<form name="loginF" action="<%=request.getContextPath()%>/login/loginEnd.jsp" method="post" class="form-horizontal" role="form">
	<div class="row box-parent">
		<table class="table">
			<thead>
				<tr class="tableTitle">
					<td width="45%"><h3><b>로그인</b></h3></td>
				</tr>
			</thead>
		</table>
	  <div class="form-group">
	    <div class="col-sm-2">
	      <label for="userid" class="control-label">ID</label>
	    </div>
	    <div class="col-sm-6">
	      <input type="text" class="form-control" name="userid" id="userid" value="<%=val%>" placeholder="Id">
	    </div>
	    <div class="col-sm-4 checkbox">
			<span style="text-align:right;">
	        <label style="font-size: smaller">
	        	<input type="checkbox" name="saveUid" id="saveUid" <%if(isSaveId)	out.println("checked");%>> ID저장
	        </label>
	        </span>
	    </div>
	  </div>
	  <div class="form-group">
	    <div class="col-sm-2">
	      <label for="pwd" class="control-label">PW</label>
	    </div>
	    <div class="col-sm-6">
	      <input type="password" class="form-control" name="pwd" id="pwd" placeholder="Password">
	    </div>
	    <div class="col-sm-4">
	    	<span style="text-align:right;">
	    		<a href="javascript:loginCheck()">
	    			<button type="button" class="btn btn-danger">로그인</button>
	    		</a>
	    	</span>
	    </div>
		<div class="form-group">
		    <div class="col-sm-12" style="text-align: center;"><!-- col-sm-offset-2 -->
		    	<br>
				<a href="<%=request.getContextPath()%>/member/memberJoin.jsp"><button type="button" class="btn btn-default">회원가입</button></a>
				<span style="text-align:right;"><a href="#"><button type="button" class="btn btn-default">아이디/비밀번호 찾기</button></a></span>
		    </div>
	    </div>
	  </div>
	  </div>
	</form>
	<!-- 로그인 했을 경우 -->
	<%}else{%>
	<table class="table table-responsive">
		<thead>
			<tr class="tableTitle">
				<td colspan="2">
					<a href="<%=request.getContextPath()%>/mypage/coffeam_MyPage.jsp" style="color:#fff">
						<h3><b><%=loginUser.getName()%>
						[<span style="color: yellow; text-decoration: underline;">
							<%=loginUser.getUserid()%></span>]님</b></h3>
					</a>
					<p>
				</td>
			</tr>
		</thead>
		<tbody>
			<tr>
				<th width="40%"><span style="color:#af1817;">마일리지</span></th>
				<td><span style="color:#af1817;"><%=df.format(loginUser.getMileage())%>빈즈</span></td>
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
						<button type="button" class="btn btn-danger">로그아웃</button>
					</a>
				</td>
			</tr>
		</tbody>
	</table>
	<%}%>
</div>
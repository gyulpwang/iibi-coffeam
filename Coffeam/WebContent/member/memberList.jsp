<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*, user.member.*" %>

<%-- <link rel = "stylesheet" type = "text/css" href = "<%=request.getContextPath()%>/css/layout.css"> --%>
<!-- MemberDAO dao = new MemberDAO();와 동일. -->
<jsp:useBean id="cdao" class="user.member.MemberDAO" scope="session"/>

<jsp:include page="/coffeam_top.jsp"/>
<script type="text/javascript">$('#mypage').addClass('active');</script>
<jsp:include page="/coffeam_noticeAside.jsp"/>
<div class="row box" align="center">
	<h1>::: 회원전체목록(MemberList) :::</h1>
	<h2> [ADMIN MODE] </h2>
	<table style="width:90%" class="table" border="1" class="box">
		<tr>
			<th>번호</th>	<th>이름</th>	<th>아이디</th>	<th>연락처</th>
			<th>이메일</th>	<th>가입일</th>	<th>수정|삭제</th>
		</tr>
		<!-- ------------------------------------------ -->
		<% 
		ArrayList<MemberVO> arr = cdao.listAllMember();
		
		if(arr==null || arr.size()==0){
			%><tr><td colspan = '7'>서버 오류이거나 데이터가 없습니다.</td></tr><%
		}else{
			// 반복문 돌 부분 ---------------------------
			Iterator<MemberVO> it = arr.iterator();
			while(it.hasNext()){
				MemberVO cvo = it.next();%>
			<tr>
				<td><%=cvo.getIdx()%></td>
				<td><%=cvo.getName()%></td>
				<td><%=cvo.getUserid()%></td>
				<td><%=cvo.getAllHp()%></td>
				<td><%=cvo.getEmail()%></td>
				<td><%=cvo.getIndate()%></td>
				<td><a href="javascript:editUser('<%=cvo.getIdx()%>')">수정</a>|
				<%-- <a href="#" onclick="delUser('<%=user.getIdx()%>')">삭제</a></td> --%>
				<%-- href로 자바스크립트 함수를 불러줄 때는
				sudo protocol(javascript:)를 꼭 붙여줘야함! --%>
				<a href="javascript:delUser('<%=cvo.getIdx()%>')">삭제</a>
			<%}%>
		</tr>
		<%}%>
	</table>
	
	<!-- 검색 관련 폼 ========================================= -->
	<form name="findF" action="memberFind.jsp" style="margin-top:20px">
		<p>
		<select name="findType" id="findType">
			<optgroup label="검색 유형">
				<!-- value에 컬럼명을 쓰면 get방식이라 컬럼명이 노출됨.
				컬럼명으로 해킹과 같은 위험성이 있기 때문에 숫자로 주었다. -->
				<option value="0">이름</option>
				<option value="1">아이디</option>
				<option value="2">이메일</option>
				<option value="3">선호메뉴</option>
			</optgroup>
		</select>
		<input type="text" name="findString" id="findString" size="40" class="box">
		<button>검색</button>
	</form>
	<!-- =========================================================== -->	
	<!-- 수정 처리 관련 폼 ========================================= -->
	<form name="editF">
		<p><input type="hidden" name="idx" id="idx">
	</form>
	<!-- =========================================================== -->
</div>
<jsp:include page = "/coffeam_best.jsp"/>
<jsp:include page = "/coffeam_foot.jsp"/>

<script type="text/javascript">
	var editUser = function(idx){
		// GET 방식이므로 idx가 url에 노출. 보안에 취약
		//location.href="memberEdit.jsp?idx="+idx;
		editF.idx.value=idx;
		editF.method="POST";
		editF.action="memberEdit.jsp";	// POST 방식이라 폼에 다 포함되어서 쿼리 스트링을 보낼 필요 없음.
		editF.submit();
	}

	var delUser = function(idx){
		var yn = confirm(idx+'번 회원정보를 정말 삭제합니까?');
		if(yn){
			// 삭제 페이지로 이동. 파라미터로 idx를 달고 가야 삭제 가능
			location.href = "memberDel.jsp?idx="+idx;
		}
	}
</script>